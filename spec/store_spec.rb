require("spec_helper")

describe(Store) do
  it{ should have_and_belong_to_many(:shoes) }
end

describe('#capitalize_name') do
    it "capitalizes the name of a store" do
      store = Store.create({:name => "demo store"})
      expect(store.name()).to (eq("Demo store"))
    end
  end
