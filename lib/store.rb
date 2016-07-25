class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  before_create(:capitalize_name)
  validates(:name, :presence => true)

private
  def capitalize_name
    self.name = (name().capitalize())
  end
end
