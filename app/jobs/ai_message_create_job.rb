class AiMessageCreateJob < ApplicationJob
  queue_as :default

  def perform(params)
    AiMessage.create(params)
  end
end
