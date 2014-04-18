require 'spec_helper'
require 'pp'

describe User do

  before(:each) do
    @user =   FactoryGirl.create(:user)

  end

  after(:each) do
    User.delete_all
    Device.delete_all
    UserFollowDevice.delete_all
  end

  it "should have a user_follow_devices method" do
    @user.should respond_to(:user_follow_devices)
  end

  it "should have a followed_devices method"  do
    @user.should respond_to(:followed_devices)
  end

  it "should have a following? method" do
    @user.should respond_to(:following?)
  end

  it "should have a follow! method"  do
    @user.should respond_to(:follow!)
  end

  it "should have an unfollow! method" do
    @user.should respond_to(:unfollow!)
  end

  it "should respond to devices" do
    @user.should respond_to(:devices)
  end

  describe "owning @device" do

    before do
      @device = FactoryGirl.create(:device, :user_id => @user.id)
    end

    it "should have devices including @device" do

      @user.devices.should include(@device)

    end

  end

  describe "following @private_device" do

    before do
      @private_device  =        FactoryGirl.create(:device, public:false)
    end

    it "should not be valid" do
      @user.follow!(@private_device).should_not be_valid
    end

  end

  describe "following @public_device" do

    before do
      @public_device  =        FactoryGirl.create(:device, public:true)
      @other_public_device  =  FactoryGirl.create(:device, public:true)

      @user.follow!(@public_device)
      @user.save

    end

    it "should respond to  following(@public_device)" do

      @user.should     be_following(@public_device)
    end

    it "should not respond to  following(@other_public_device) " do
      @user.should_not     be_following(@other_public_device)
    end

    it "should include @device in the following array" do
      @user.followed_devices.should include(@public_device)
    end

    it "should unfollow @device" do
      @user.unfollow!(@public_device)
      @user.should_not be_following(@public_device)
    end

  end

end
