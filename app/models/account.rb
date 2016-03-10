class Account < ActiveRecord::Base
  has_many :projects

  validates :name, presence: true

  before_save { self.slug = name.parameterize }
end
