class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  before_save(:capitalize_name)

private
  def capitalize_name
    self.brand = (brand().capitalize())
  end
end
