# return true if button disabled
def if_button_disabled(button)
    return button.attribute_value("disabled")
end  

# return true if element contain text
def if_containt_text(item)
    unless item == "" || item == " " || item == nil 
        return true
    end
    return false
end