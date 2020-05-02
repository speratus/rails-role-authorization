RSpec.describe "general tests" do
    context "extended models" do
        it "has a Role model" do
            expect(RoleAuthorization::Models::Role).to be_a(Class)
        end
    end
end