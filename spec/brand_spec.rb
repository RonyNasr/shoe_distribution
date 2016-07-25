require("spec_helper")

describe(Brand) do
  it{ should have_and_belong_to_many(:stores) }

  it("validates the presence of a store name")do
  brand = Brand.new({:name => "", :image =>"default.png"})
  expect(store.save()).to (eq(false))
  end

  describe('#capitalize_name') do
    it "capitalizes the name of a brand" do
      brand = Brand.create({:name => "demo brand", :image =>"default.png" })
      expect(brand.name()).to (eq("Demo brand"))
    end
  end
end
