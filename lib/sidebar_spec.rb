describe "Sidebar" do
    before :each do
        @browser.window.resize_to 1600, 1200 
        @browser.goto BASE_URL
        @page = BackofficePage.new(@browser)
        @login_page = LoginPage.new(@browser)        
        @login_page.login(@user_email, @user_pass)        
    end
    it "check sidebar items" do
        # !shoold add condition for diferent role
        expect(@page.get_sidebar_menu_length).to eq(21)
        expect(@page.get_sidebar_menu_icon_length).to eq(21)
        @page.get_sidebar_menu_title.each{|e| expect(if_containt_text(e.title)).to eq(true)}
    end
end
