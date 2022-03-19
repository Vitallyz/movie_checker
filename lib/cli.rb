

class CLI

    attr_accessor :event_list

    def initialize(event_list)
        self.event_list = event_list
    end

    def select_event
        print_race_list event_list

        get_event_number event_list
    end
    
    def print_race_list
        system 'clear' #|| system 'cls'

        race_list.each_with_index(1) do |event, index|
            puts "#{index}, #{event.title}, #{event.location}. #{event.date}}"
        end
    end

    def get_event_number
        
        get_user_input_with_message("Enter the event number to list scheduled races for that event: ").to_i

        while selected_event > event_list.count || selected_event < 1 
            selected_event = get_user_input_with_message("Event number: #{selected_event} is out of range, try again: ").to_i
        end
        selected_event
    end

    def get_user_input_with_message(message)
        print "\n" + message
        response = gets.chomp # chomp to remove \n
        exit(0) if response == 'exit'
        response
    end



end