class Application < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def as_json(options = {})
    super(options.merge({ except: [:id] }))
  end
end
