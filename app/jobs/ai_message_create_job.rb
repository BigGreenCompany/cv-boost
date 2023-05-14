class AiMessageCreateJob < ApplicationJob
  queue_as :default

  def perform(attributes)
    AiMessage.create(attributes)
  end
end
