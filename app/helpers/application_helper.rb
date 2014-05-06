module ApplicationHelper

def formatted_date(date)
    date.to_time.strftime("%Y-%B-%d")   
end

end
