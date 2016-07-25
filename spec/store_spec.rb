require("spec_helper")

describe(Store) do
  it{ should have_and_belong_to_many(:brands) }

  it { should validate_presence_of(:name) }

describe('#capitalize_name') do
    it "capitalizes the name of a store" do
      store = Store.create({:name => "demo store"})
      expect(store.name()).to (eq("Demo store"))
    end
  end
end
