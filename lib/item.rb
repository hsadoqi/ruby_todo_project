class Item 
    attr_accessor :title, :deadline, :description

    def initialize(title, deadline, description)
        raise "not a valid date" if !Item.valid_date?(deadline)
        @deadline = deadline
        @title = title
        @description = description
    end 

    def self.valid_date?(date_str)
        form_date = date_str.split('-').map(&:to_i)
        year, month, day = form_date
        return false if form_date.length != 3 
        return false if !(0..12).include?(month)
        return false if !(0..31).include?(day)
        true
    end

    def print_item
        p "|    #{title}     | #{deadline}"
    end

end 