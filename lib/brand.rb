class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  before_create(:capitalize_name)

private
  def capitalize_name
    self.name = (name().capitalize())
  end
end
