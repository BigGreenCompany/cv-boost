ActiveSupport.on_load(:action_text_rich_text) do
  has_paper_trail skip: [:created_at, :updated_at]
end
