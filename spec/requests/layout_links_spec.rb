require 'rails_helper'

RSpec.describe "LayoutLinks", :type => :request do
  
  Capybara.ignore_hidden_elements = false
  
  before (:each) do
    @base_title ="Ruby on Rails Tutorial Sample App"
  end
  
  describe "GET /layout_links" do
    
    it "should have a homepage at '/'" do
       visit '/'
       expect(page).to have_title("#{@base_title} | Home")
       # expect(response.body).to have_xpath("//title",:text => "Home")
    end
    
    it "should have a Contact page at '/contact'" do
      visit '/contact'
      expect(page).to have_title("#{@base_title} | Contact")
    end

    it "should have a About page at '/about'" do
      visit '/about'
      expect(page).to have_title("#{@base_title} | About")
    end

    it "should have a Help page at '/help'" do
      visit '/help'
      expect(page).to have_title("#{@base_title} | Help")
    end
   
    it "should have a sign up page" do
      visit '/signup'
      expect(page).to have_title("#{@base_title} | Sign up")
    end
   
    it "should have the right links" do
      visit root_path
      expect(page).to have_title("#{@base_title} | Home")
      click_link "About"
      expect(page).to have_title("#{@base_title} | About")
      click_link "Contact"
      expect(page).to have_title("#{@base_title} | Contact")
      click_link "Home"
      expect(page).to have_title("#{@base_title} | Home")
      click_link "Sign up now!"
      expect(page).to have_title("#{@base_title} | Sign up")
      expect(page).to have_selector('a[href="/"]>img')
    end
  end
end
