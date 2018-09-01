require 'spec_helper'

describe OmniauthResult do
  subject { described_class.new(:omniauth => auth_hash) }
  let(:user) { subject.user }

  context 'with a matching existing user' do
    let!(:existing_user) { FactoryBot.create :admin, :provider => 'google', :username => 'spraints@gmail.com' }
    it { expect(user).to eq(existing_user) }
    it { expect(user.username).to eq('spraints@gmail.com') }
    it { expect(user).not_to be_changed }
  end

  context 'without a matching existing user' do
    it { expect(user).to be_persisted }
    it { expect(user.provider).to eq('google') }
    it { expect(user.uid).to eq(uid) }
    it { expect(user.enabled).to be_falsey }
    it { expect(user.username).to eq('spraints@gmail.com') }
    it { expect(user).not_to be_changed }
  end

  let(:auth_hash) { OmniAuth::AuthHash.new({
    "provider"=>"google",
    "uid"=>uid,
    "info"=>{
      "name"=>"Matt Burke",
      "email"=>"spraints@gmail.com",
      "first_name"=>"Matt",
      "last_name"=>"Burke",
      "image"=> "https://lh4.googleusercontent.com/-3KxHFJXGatM/AAAAAAAAAAI/AAAAAAAAA90/et5mPDKK-3Y/photo.jpg?sz=50",
      "urls"=>{"Google"=>"https://plus.google.com/116644164965850406883"},
    },
    "credentials"=>{
      "token"=> token,
      "expires_at"=>1419695790,
      "expires"=>true,
    },
    "extra"=>{
      "id_token"=>id_token,
      "raw_info"=>{
        "kind"=>"plus#personOpenIdConnect",
        "gender"=>"male",
        "sub"=>"116644164965850406883",
        "name"=>"Matt Burke",
        "given_name"=>"Matt",
        "family_name"=>"Burke",
        "profile"=>"https://plus.google.com/116644164965850406883",
        "picture"=> "https://lh4.googleusercontent.com/-3KxHFJXGatM/AAAAAAAAAAI/AAAAAAAAA90/et5mPDKK-3Y/photo.jpg?sz=50",
        "email"=>"spraints@gmail.com",
        "email_verified"=>"true",
        "locale"=>"en",
      },
    },
  }) }
  let(:uid) { "116644164965850406883" }
  let(:id_token) { "todo" } # shouldn't need this. It's a huge, signed string.
  let(:token) { "todo" } # shouldn't need this either. It's shorter, but I'm not going to put my real token in.
end
