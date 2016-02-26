require 'rails_helper'

RSpec.describe User, :type => :model do
  it "creates token after create" do
    user = create(:user)
    expect(user.token).to be_present
  end
end
