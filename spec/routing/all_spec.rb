require 'spec_helper'

describe 'routing', type: :routing do
  context 'farmer' do
    it { expect(get('/')).to route_to("customers#index") }
    it { expect(get('/customers/new')).to route_to("customers#new") }
    it { expect(post('/customers')).to route_to("customers#create") }
    it { expect(get('/customers/1')).to route_to("customers#show", :id => '1') }
    it { expect(get('/customers/1/edit')).to route_to("customers#edit", :id => '1') }
    it { expect(patch('/customers/1')).to route_to("customers#update", :id => '1') }
    it { expect(get('/market')).to route_to("customers#edit_all") }
    it { expect(patch('/market')).to route_to("customers#update_all") }
  end

  context 'member' do
    it { expect(get('/member/5a5e56f')).to route_to("self_service#show", :slug => '5a5e56f') }
  end
end
