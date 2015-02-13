require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  render_views
  Capybara.ignore_hidden_elements = false;
  
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
