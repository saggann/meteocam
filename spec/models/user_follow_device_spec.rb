require 'spec_helper'

describe UserFollowDevice do

  describe "user follow device relationship" do

    before(:all) do
      @user =   FactoryGirl.create(:user)
      @device = FactoryGirl.create(:device)
    end

    after(:all) do
      User.delete_all
      Device.delete_all
      UserFollowDevice.delete_all
    end

    # Relationship creation
    let(:user_follow_device) { @user.user_follow_devices.build(device_id: @device.id) }
    subject { user_follow_device }
    it { should be_valid }

    describe "follower methods of a relationship" do

      it { should respond_to(:user) }
      it { should respond_to(:device) }
      its(:user) { should eq @user }
      its(:device) { should eq @device }

    end

    describe "when user id is not present" do
      before { user_follow_device.user_id = nil }
      it { should_not be_valid }
    end

    describe "when device id is not present" do
      before { user_follow_device.device_id = nil }
      it { should_not be_valid }
    end

  end
end