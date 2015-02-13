require 'rails_helper'

RSpec.describe "LayoutLinks", :type => :request do
  
  Capybara.ignore_hidden_elements = false
  
  describe "GET /layout_links" do
    
    it "should have a homepage at '/'" do
       get '/'
       expect(response.body).to have_xpath("//title",:text => "Home")
    end
    
    # it "should have a Contact page at '/contact'" do
#       get '/contact'
#       expect(response.body).to have_xpath("//title",:text => "Contact")
#     end
#
#     it "should have a About page at '/about'" do
#       get '/about'
#       expect(response.body).to have_xpath("//title",:text => "About")
#     end
#
    # it "should have a Help page at '/help'" do
   #   get '/help'
   #   expect(response.body).to have_xpath("//title",:text => "Help")
   # end
  end
end
