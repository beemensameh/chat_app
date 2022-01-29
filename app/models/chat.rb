class Chat < ApplicationRecord
  belongs_to :application

  def as_json(options = {})
    super(options.merge({ except: [:id, :application_id] }))
  end
end
