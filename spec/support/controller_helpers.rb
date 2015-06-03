module ControllerHelpers
  def sign_in(user = FactoryGirl.build(:user))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end

  def authenticate_subscriber(subscriber = create(:subscriber))
    if subscriber.nil?
      allow(controller).to receive(:authenticate_subscriber_from_token!)
      allow(controller).to receive(:current_subscriber).and_return(nil)
    else
      request.headers['Auth-Token'] = subscriber.api_tokens.first.auth_token
      allow(controller).to receive(:current_subscriber).and_return(subscriber)
    end
  end
end