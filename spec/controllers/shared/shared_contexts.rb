shared_context "user is logged in" do
  let(:user) { FactoryGirl.build_stubbed(:user) }

  before do
    sign_in(user)
    request.headers.merge!(user.create_new_auth_token)
  end
end
