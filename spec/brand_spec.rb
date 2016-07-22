require("spec_helper")

describe(Brand) do
  it{ should have_and_belong_to_many(:stores) }

  describe('#capitalize_name') do
    it "capitalizes the name of a brand" do
      brand = Brand.create({:name => "demo brand"})
      expect(brand.name()).to (eq("Demo brand"))
    end
  end
end
