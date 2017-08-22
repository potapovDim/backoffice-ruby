describe "Profile page" do
    before  do
        @browser.window.resize_to 1600, 1200 
        @browser.goto BASE_URL
        @page = BackofficePage.new(@browser)
        @login_page = LoginPage.new(@browser)        
        @profile_page = ProfilePage.new(@browser)        
        # @login_page.login(@user_email, @user_pass)    
        # @profile_page.go_to
    end
    it "check page elements existing" do
        @login_page.login(@user_email, @user_pass)    
        @profile_page.go_to

        # don't forget about breadcrumbs
        @profile_page.get_user_info.each{ |e| expect(if_containt_text(e.text)).to eq(true) }
        # actions??
        sleep 3
    end
    # it "change user photo" do
    #     # puts "../img/pic.jpeg"
    #     @profile_page.upload_user_photo
    #     # expect(element(css: @profile_page.upload_user_photo("../img/pic.jpeg"))).to be_present
    # end
end
