class ProfilePage
    def initialize(driver)
        @browser                         = driver
        @upload_picture_input            = 'picture-uploader input[type="file"]'
        @upload_success_notification     = '.notification-item.success'
        #user data
        @user_info                       = 'profile-info p span'
        # actions
        @info_action                     = 'a[href="#/profile/info"]'
        @edit_action                     = 'a[href="#/profile/edit"]'
        @change_pass_action              = 'a[href="#/profile/change-password"]'

    end
    def go_to
        @browser.goto "#{BASE_URL}#/profile/info"
        
    end
    def get_user_info
        return @browser.elements(css: @user_info)
    end
    # def upload_user_photo
    #     # puts "#{__dir__}"
    #     # puts "../img/pic.jpeg"
    #     @browser.element(css: @upload_picture_input).send_keys "../img/pic.jpeg"
    #     sleep 1
    #     return @upload_success_notification
    # end
   
  
end
