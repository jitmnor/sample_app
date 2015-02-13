require 'rails_helper'

RSpec.describe "LayoutLinks", :type => :request do
  
  Capybara.ignore_hidden_elements = false
  
  describe "GET /layout_links" do
    
    it "should have a homepage at '/'" do
       visit '/'
       expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
       # expect(response.body).to have_xpath("//title",:text => "Home")
    end
    
    it "should have a Contact page at '/contact'" do
      visit '/contact'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
    end

    it "should have a About page at '/about'" do
      visit '/about'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
    end

    it "should have a Help page at '/help'" do
      visit '/help'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
   end
  end
end
