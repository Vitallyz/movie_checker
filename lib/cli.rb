

class CLI

    def clear_screen
        system 'clear'
    end

    def print_message(msg)
        puts msg
    end

    def get_input_with_message(msg)
        print msg + ": "
        gets 
    end
end