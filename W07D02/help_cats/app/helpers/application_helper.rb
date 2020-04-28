module ApplicationHelper
    def auth_token
        "<form name='authenticity_token' type='hidden' value='#{h(form_authenticity_token)}'".html_safe
    end
end
