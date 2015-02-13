require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  render_views
  Capybara.ignore_hidden_elements = false

  before (:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
    
    it "returns the right title" do
      get :home
      expect(response.body).to have_xpath("//title",:text => "#{@base_title} | Home")
    end
    
    it "should have a non-blank body" do
      get :home
      expect(response.body).not_to match(/<body>\s*<\/body>/) 
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
    it "returns the right title" do
      get :contact
      expect(response.body).to have_xpath("//title",:text => "#{@base_title} | Contact")
    end
  end
  
  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
    it "returns the right title" do
      get :about
      expect(response.body).to have_xpath("//title",:text => "#{@base_title} | About")
    end
  end
  
  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end
    it "returns the right title" do
      get :help
      expect(response.body).to have_xpath("//title",:text => "#{@base_title} | Help")
    end
  end

end
