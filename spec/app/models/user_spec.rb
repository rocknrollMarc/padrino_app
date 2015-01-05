require 'spec_helper'

RSpec.describe User do
  let(:user) { build(:user) }
  let(:job_offer) { {:title => 'Padrino Engeneer', :location => 'Berlin',
    :description => 'Come and kiss my ass!'} }

  it 'can be created' do
    user.should_not be_nil
  end

  it 'fresh user should have no offers' do
    user.job_offers.size.should == 0
  end

  it 'should have job-offers' do
    user.job_offers.build(attributes_for(:job_offer))
    user.job_offers.size.should == 1
  end
end
