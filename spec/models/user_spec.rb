require 'rails_helper'

RSpec.describe User, :type => :model do
  
  before (:each)do
    @attr = {
      :name => "Example user", 
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    expect(no_name_user).not_to be_valid
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email=>""))
    expect(no_email_user).not_to be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    expect(long_name_user).not_to be_valid
  end
  
  it "should accepts valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      expect(valid_email_user).to be_valid
    end
  end
  
  it "should rejects invalid email addresses" do
    addresses = %w[user@foo,com THE_USER_at_foo.bar.org first.last@foo.]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      expect(valid_email_user).not_to be_valid
    end
  end
  
  it "should rejects duplicate email address" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    expect(user_with_duplicate_email).not_to be_valid
  end
  
  it "should rejects email address identical up to case" do
    upcase_email= @attr[:email].upcase
    User.create!(@attr.merge(:email=>upcase_email))
    user_with_duplicate_email = User.new(@attr)
    expect(user_with_duplicate_email).not_to be_valid
  end
  
  describe "passwords" do # passwords is vitual attribute
    before(:each) do
      @user = User.new(@attr)
    end
    
    it "should have a password attribute" do
      expect(@user).to respond_to(:password)
    end
    
    it "shold have a password confirmation aatribute" do
      expect(@user).to respond_to(:password_confirmation)
    end
  end
  
  describe "password validations" do
    
    it "should require a password" do
      expect(User.new(@attr.merge(:password => "", :password_confirmation =>""))).not_to be_valid
    end
    
    it "should require a matching password confirmation" do
      expect(User.new(@attr.merge(:password_confirmation =>"invalidPassword"))).not_to be_valid
    end
    
    it "should reject short passwords" do
      short = "a" * 5
      hash = User.new(@attr.merge(:password => short, :password_confirmation =>short))
      expect(hash).not_to be_valid
    end
    
    it "should reject long passwords" do
      short = "a" * 41
      hash = User.new(@attr.merge(:password => short, :password_confirmation =>short))
      expect(hash).not_to be_valid
    end
  end
  
  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      expect(@user).to respond_to (:encrypted_password)
    end
  
  end
  
end
