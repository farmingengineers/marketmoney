require 'spec_helper'

describe OmniauthResult do
  subject { described_class.new(:omniauth => auth_hash) }
  let(:user) { subject.user }

  context 'with a matching existing user' do
    let!(:existing_user) { FactoryGirl.create :admin, :provider => 'google', :uid => "https://www.google.com/accounts/o8/id?id=ye_olde_google_user_id" }
    it { expect(user).to eq(existing_user) }
  end

  context 'without a matching existing user' do
    it { expect(user).to be_persisted }
    it { expect(user.provider).to eq('google') }
    it { expect(user.uid).to eq('https://www.google.com/accounts/o8/id?id=ye_olde_google_user_id') }
    it { expect(user.enabled).to be_false }
  end

  let(:auth_hash) { OmniAuth::AuthHash.new({
    :info => {
      :email => "spraints@gmail.com",
      :first_name => "Matt",
      :last_name => "Burke",
      :name => "Matt Burke",
    },
    :provider => "google",
    :uid => "https://www.google.com/accounts/o8/id?id=ye_olde_google_user_id",
    :credentials => {},
    :extra => {
      :response => openid_response,
    }
  }) }
  let(:openid_response) { 'todo' }
  # if I need it, it's like this:
  # #<OpenID::Consumer::SuccessResponse:0x007fd7d99e3708
  #   @endpoint=#<OpenID::OpenIDServiceEndpoint:0x007fd7d9b3c708
  #     @claimed_id="https://www.google.com/accounts/o8/id?id=ye_olde_google_user_id",
  #     @server_url="https://www.google.com/accounts/o8/ud",
  #     @type_uris=["http://specs.openid.net/auth/2.0/signon", "http://openid.net/srv/ax/1.0", "http://specs.openid.net/extensions/ui/1.0/mode/popup", "http://specs.openid.net/extensions/ui/1.0/icon", "http://specs.openid.net/extensions/pape/1.0"],
  #     @local_id=nil,
  #     @canonical_id=nil,
  #     @used_yadis=true,
  #     @display_identifier=nil>,
  #   @identity_url="https://www.google.com/accounts/o8/id?id=ye_olde_google_user_id",
  #   @message=#<OpenID::Message:0x007fd7d9cbd708
  #     @args={[:bare_namespace, "_method"]=>"post", ["http://specs.openid.net/auth/2.0", "mode"]=>"id_res", ["http://specs.openid.net/auth/2.0", "op_endpoint"]=>"https://www.google.com/accounts/o8/ud", ["http://specs.openid.net/auth/2.0", "response_nonce"]=>"2014-02-08T04:59:27Zhahahahaha", ["http://specs.openid.net/auth/2.0", "return_to"]=>"http://localhost:3030/auth/google/callback?_method=post", ["http://specs.openid.net/auth/2.0", "assoc_handle"]=>"1.mas_que_opaque_strings", ["http://specs.openid.net/auth/2.0", "signed"]=>"op_endpoint,claimed_id,identity,return_to,response_nonce,assoc_handle,ns.ext1,ext1.mode,ext1.type.ext2,ext1.value.ext2,ext1.type.ext3,ext1.value.ext3,ext1.type.ext0,ext1.value.ext0", ["http://specs.openid.net/auth/2.0", "sig"]=>"K1vvdykJY/PW49TpTjM4zeFk+eA=", ["http://specs.openid.net/auth/2.0", "identity"]=>"https://www.google.com/accounts/o8/id?id=ye_olde_google_user_id", ["http://specs.openid.net/auth/2.0", "claimed_id"]=>"https://www.google.com/accounts/o8/id?id=ye_olde_google_user_id", ["http://openid.net/srv/ax/1.0", "mode"]=>"fetch_response", ["http://openid.net/srv/ax/1.0", "type.ext2"]=>"http://axschema.org/namePerson/first", ["http://openid.net/srv/ax/1.0", "value.ext2"]=>"Matt", ["http://openid.net/srv/ax/1.0", "type.ext3"]=>"http://axschema.org/namePerson/last", ["http://openid.net/srv/ax/1.0", "value.ext3"]=>"Burke", ["http://openid.net/srv/ax/1.0", "type.ext0"]=>"http://axschema.org/contact/email", ["http://openid.net/srv/ax/1.0", "value.ext0"]=>"spraints@gmail.com"},
  #     @namespaces=#<OpenID::NamespaceMap:0x007fd7d9cbd578
  #       @alias_to_namespace={:null_namespace=>"http://specs.openid.net/auth/2.0", "ext1"=>"http://openid.net/srv/ax/1.0", "sreg"=>"http://openid.net/extensions/sreg/1.1"},
  #       @namespace_to_alias={"http://specs.openid.net/auth/2.0"=>:null_namespace, "http://openid.net/srv/ax/1.0"=>"ext1", "http://openid.net/extensions/sreg/1.1"=>"sreg"},
  #       @implicit_namespaces=[]>,
  #     @openid_ns_uri="http://specs.openid.net/auth/2.0">,
  #   @signed_fields=["openid.op_endpoint", "openid.claimed_id", "openid.identity", "openid.return_to", "openid.response_nonce", "openid.assoc_handle", "openid.ns.ext1", "openid.ext1.mode", "openid.ext1.type.ext2", "openid.ext1.value.ext2", "openid.ext1.type.ext3", "openid.ext1.value.ext3", "openid.ext1.type.ext0", "openid.ext1.value.ext0"]>
end
