class BackofficePage
    def initialize(driver)
        @browser  = driver
        # header
        @logo_button                = 'a[class="al-logo clearfix"]'
        @toggle_button              = 'a[class="collapse-menu-link ion-navicon"]'
        @welcome_string             = 'span[class="account_welcome"]'
        @profile_drop_button        = '.dropdown.al-user-profile'
        # header elements in suppor user only
        @search_button              = 'i[class="ion-ios-search-strong"]'
        @search_input               = 'input[id="searchInput"]'
        # page elements
        @go_back_button             = 'h1[class="al-title"] button'
        @page_title                 = 'h1[class="al-title"]'
        @breadcrumb_address         = '.al-breadcrumb li a'
        @breadcrumb_current_page    = '.al-breadcrumb li:last-child'
        # profile elements
        @profile_button             = 'a[href="#/profile"]'
        @sign_out_button            = 'a[class="signout"]'
        # sidebar
        @title_items_list           = 'ba-menu-item>li'
        @icon_items_list            = '.al-sidebar-list-link>i'
        # footer
        @all_copy_string            = 'div[class="al-copy"]'
        @version_string             = 'div[class="al-footer-right"]'
    end
    def get_sidebar_menu_title
        return @browser.elements(css: @title_items_list)
    end
    def get_sidebar_menu_length
        return  @browser.elements(css: @title_items_list).length
    end
    def get_sidebar_menu_icon_length
        return  @browser.elements(css: @icon_items_list).length
    end
    def logout
        unless (@browser.element(css: @profile_drop_button).class_name).include? "open"
            @browser.element(css: @profile_drop_button).click
        end
        @browser.element(css: @sign_out_button).click
        sleep 1
    end

end