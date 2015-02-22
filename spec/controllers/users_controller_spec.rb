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
      #pull out the @user assigned in show method
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
  
  describe "POST 'create' " do
      
    describe "failure " do
    
      before (:each) do
        @attr = {:name =>" " , :email => " ", :password => " ", :password_confirmation => " "}
      end
      
      it "should have the right title" do
        post :create, :user =>@attr
        expect(response.body).to have_xpath("//title", :text=> "Sign up")
      end
      
      it "should render a new page" do
        post :create, :user => @attr
        expect(response).to render_template('new')
      end
      
      it "shoule not create a new user" do
        expect(
        lambda do
          post :create,  :user =>@attr
        end).not_to change(User, :count)
      end
      
    end
    
    describe "success " do
      before (:each) do
         @attr = {:name =>"New User" , :email => "user@example.com",
                  :password => "foobar", :password_confirmation => "foobar"}
      end
      
      it "should create a user" do
        expect(
        lambda do
           post :create, :user=>@attr
         end).to change(User,:count).by(1)
      end
      
      it "should redirect user to the user show page" do
        post :create, :user=>@attr
        #pull out the @user assigned in create method
        expect(response).to redirect_to(user_path(assigns(:user))) 
      end
      
      it "should have a welcome message" do
        post :create, :user=>@attr
        expect(flash[:success]) =~ /Welcome to the Sample App/i
      end
    end
    
  end
  
  

end
