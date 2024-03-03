class Experience < ApplicationRecord
  has_paper_trail skip: [:created_at, :updated_at]

  belongs_to :user
  belongs_to :job_listing, optional: true
  has_many :ai_messages, dependent: :destroy

  broadcasts

  enum category: {
    work: "work",
    education: "education"
  }

  has_rich_text :description

  validates :started_at, presence: true
  validates :place, presence: true
  validates :title, presence: true
  validate :description_cannot_include_attachments

  def prompt
    <<~TEXT
      You are an expert at reviewing resumes for job applications.
      #{job_listing&.prompt}
      I want you to give feedback on how to improve the description of this experience.
      This experience is one of many in the #{category} experience section.
      ```html
      #{place}
      #{title}
      #{location}
      #{description}

      Please respond using markdown for rich text. No HTML.
      ```
    TEXT
  end

  def fetch_openai_response
    response = OpenAI::Client.new.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: ai_messages.for_openai.prepend({role: "system", content: prompt}),
        temperature: 0.7,
        n: 1,
        stream: stream_proc,
      }
    )
  end

  # TODO: could lead to performance issues for multiple users
  # https://gist.github.com/alexrudall/cb5ee1e109353ef358adb4e66631799d?permalink_comment_id=4711444#gistcomment-4711444
  def stream_proc
    ai_message = ai_messages.create(role: "assistant", content: "")
    proc do |chunk, _bytesize|
      new_content = chunk.dig("choices", 0, "delta", "content")
      ai_message.update(content: ai_message.content + new_content) if new_content
    end
  end

  scope :default_order, -> { order(started_at: :desc) }

  def to_s
    "#{title} at #{place}"
  end

  private

  def description_cannot_include_attachments
    if description.body.attachments.any?
      errors.add(:description, "cannot include attachments")
    end
  end
end
