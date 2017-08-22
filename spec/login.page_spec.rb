describe "Login user" do
    before :each do
        @browser.window.resize_to 1600, 1200 
        @browser.goto BASE_URL
        @login_page = LoginPage.new(@browser)
    end
    it "failed login user" do
        @login_page.login("fail@fail.com", "failfail")
        expect(@browser.url).to include("login")   
        expect(@login_page.get_error_notification).to be_present        
    end
    it "login with bad data" do
        # empty email
        @login_page.set_pass_input(@user_pass)
        expect(if_button_disabled(@login_page.get_auth_button)).to be  
        expect(@browser.url).to include("login")         
        @browser.goto BASE_URL
        # empty pass
        @login_page.set_email_input(@user_email)
        expect(if_button_disabled(@login_page.get_auth_button)).to be  
        expect(@browser.url).to include("login") 
        # wrong email & correct pass
        @login_page.login("fail@fail.com", @user_pass)
        expect(@browser.url).to include("login") 
        expect(@login_page.get_error_notification).to be_present                
        # correct email & wrong pass
        @login_page.login(@user_email, "failfail")
        expect(@browser.url).to include("login")
        expect(@login_page.get_error_notification).to be_present                
    end
    it "success login" do
        @login_page.login(@user_email, @user_pass)
        expect(@browser.url).to include("dashboard")         
        # expect(@browser).to include(@user_role)
    end
end
