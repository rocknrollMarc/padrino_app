require 'spec_helper'

RSpec.describe User do
  let(:user) { build(:user) }
  let(:user_first) { build(:user, name: 'Marc') }
  let(:user_second) { build(:user, name: 'Marc') }
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

  it 'should have no blank name' do
    user.name = ""
    user.save.should be false
  end

  describe 'Passwords' do
    it 'should have no blank passwords' do
      user.password = ""
      user.save.should be false
    end
  end

  describe 'when name is allready used' do

    it 'should not be saved' do
      user_second.save.should be false
    end
  end

  describe 'email address' do
    it 'should have no blank email' do
      user.email = ""
      user.save.should be false
    end

    it 'valid' do
      addresses = %w[thor@marvel.de hero@movie.com]
      addresses.each do |email|
        user_first.email = email
        user_second.name = email
        user_second.should be_valid
      end
    end

    it 'not valid' do
      addresses = %w[spamspamspam.de heman,test.com]
      addresses.each do |email|
        user_second.email = email
        user_second.should_not be_valid
      end
    end
  end
end
