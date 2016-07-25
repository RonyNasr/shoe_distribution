require("spec_helper")

describe(Store) do
  it{ should have_and_belong_to_many(:shoes) }
end

describe('#capitalize_name') do
    it "capitalizes the name of a store" do
      store = Store.create({:name => "demo store"})
      expect(store.name()).to (eq("Demo store"))
    end

    it("validates the presence of a store name")do
    store = Store.new({:name => ""})
    expect(store.save()).to (eq(false))
    end
  end
