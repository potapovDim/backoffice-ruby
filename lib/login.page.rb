class LoginPage
    def initialize(driver)
        @browser                    = driver
        @email_input                = '#inputEmail3'
        @pass_input                 = '#inputPassword3'
        @button_auth                = '.btn.btn-default.btn-auth'
        # @button_auth                = 'button[class="btn btn-default btn-auth"]'
        @error_notification         = '.error'
    end   
    def set_email_input(email)
        @browser.text_field(:css, @email_input).set(email)
    end        
    def set_pass_input(pass)
        @browser.text_field(:css, @pass_input).set(pass)
    end        
    def get_auth_button
        return  @browser.button(:css, @button_auth)
        
    end    
    def get_error_notification
        return @browser.element(css: @error_notification)
    end        
    def login(email, pass)
        set_email_input(email)
        set_pass_input(pass)
        get_auth_button.click
        sleep 1
    end
end
