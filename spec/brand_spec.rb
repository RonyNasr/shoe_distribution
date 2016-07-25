require("spec_helper")

describe(Brand) do
  it{ should have_and_belong_to_many(:stores) }

  it { should validate_presence_of(:name) }

  describe('#capitalize_name') do
    it "capitalizes the name of a brand" do
      brand = Brand.create({:name => "demo brand", :image =>"default.png" })
      expect(brand.name()).to (eq("Demo brand"))
    end
  end
end
