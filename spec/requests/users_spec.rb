require 'rails_helper'

RSpec.describe "Users", :type => :request do
  
  describe "sign up" do
    describe "failure" do
      it "should not make a new user" do
        expect(
        lambda do
          visit signup_path
          fill_in "Name",         :with => ""
          fill_in "Email",        :with => ""
          fill_in "Password",     :with => ""
          fill_in "Confirmation", :with => ""
          click_button "Sign up"
          #render the new template
          expect(page).to have_title("#{@base_title} | Sign up")
          expect(page).to have_selector('div#error_explanation')
        end).not_to change(User,:count)
      end
      
    end
    
    describe "failure" do
      it "should  make a new user" do
        expect(
        lambda do
          visit signup_path
          fill_in "Name",         :with => "New User"
          fill_in "Email",        :with => "user@example.com"
          fill_in "Password",     :with => "foobar"
          fill_in "Confirmation", :with => "foobar"
          click_button "Sign up"
          #render the new template
          expect(page).to have_title("New User")
          expect(page).to have_selector('div.flash.success')
        end).to change(User,:count).by(1)
      end
      
    end
  end
end
