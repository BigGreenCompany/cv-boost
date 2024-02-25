class FetchOpenaiResponseJob < ApplicationJob
  def perform(experience)
    experience.fetch_openai_response
  end
end
