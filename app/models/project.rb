class Project < ActiveRecord::Base
  belongs_to :account

  validates :name, presence: true

  before_save { self.slug = name.parameterize }
end
