require './item.rb'

class List

    attr_accessor :label
    attr_reader :items

    def initialize(label)
        @label = label
        @items = []
    end

    def [](idx)
       return nil if !valid_index?(idx)
       @items[idx]
    end 

    def add_item(title, deadline, description='')
        new_item = Item.new(title, deadline, description)
        if new_item
            @items << new_item
            true
        else 
            false 
        end
    end

    def size 
        @items.length
    end 

    def valid_index?(idx)
        !!@items[idx]
    end 

    def swap(idx_1, idx_2)
        return false if !valid_index?(idx_1) || !valid_index?(idx_2)
        @items[idx_1], @items[idx_2] = @items[idx_2], @items[idx_1]
        true 
    end 

    def priority 
        @items.first
    end 

    def line  
        p '----------------------------'
    end

    def print 
        line
        p '        GROCERIES           '
        line 
        p 'Index | Item       |Deadline'
        @items.each_with_index do |item, idx|
            p "#{idx} |    #{item.title}     | #{item.deadline}"
        end
        p line
    end 

    def print_full_item(index)
        line
        p "#{self[index].title}         #{self[index].deadline}"
        p "#{self[index].description}" 
        p line
    end 

    def print_priority
        print_full_item(0)
    end

    def up(idx, amount)
    end 

end