require 'spec_helper'

RSpec.describe User do
  let(:user) { User.new }
  it 'can be created' do
    user.should_not be_nil
  end
end
