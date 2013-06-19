module ControllerMacros

  def login_user
    before(:each) do
      FactoryGirl.create(:user)
      sign_in User
    end
  end

end