require 'rails_helper'


RSpec.describe UsersController, :type => :controller do

  render_views
  Capybara.ignore_hidden_elements = false;
  
  describe "GET #show" do
    
    before (:each) do
      @user = Factory(:user)
    end
    
    it "should be successfull" do
      get :show, :id => @user.id
      expect(response).to be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user.id
      expect(assigns(:user)).to eq(@user)    
    end
    
    it "should have the right title" do
      get :show, :id => @user.id
      expect(response.body).to have_xpath("//title", :text => @user.name)
    end
    
    it "should have the user's name as header" do
      get :show, :id =>@user.id
      expect(response.body).to have_xpath("//h1", :text => @user.name)
    end
    
    it "should have a profile image" do
      # get :show, :id => @user
      # expect(response.body).to have_xpath("h1>img", :text =>'Gravatar')
    end
    
    it "should have the right URL" do
      # get :show, :id => @user.id
      # expect(page).to have_selector("//td/a")
    end
  end
  
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "should have the right title" do
      get :new
      expect(response.body).to have_xpath("//title",:text =>"Sign up")
    end
    
  end
  

end
