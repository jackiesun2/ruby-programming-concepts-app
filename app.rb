class ConceptLibrary
    attr_accessor :task
    def initialize
        @concepts = []
    end

    def concepts 
        return @concepts
    end

    def display_welcome
        puts "*"*35
        puts "Welcome."
        puts "This is a Programming Concepts App."
        display_menu
    end

    def display_menu
        loop do
            system 'clear'
            puts "*"*35
            puts "0. Programming Concept Library"
            puts "1. Add"
            puts "2. Delete"
            puts "3. Edit"
            puts "4. Exit"
            puts "*"*35
            input = gets.chomp
            menu_input(input.to_i)
        end
    end

    def menu_input(input)
        case input
        when 0 
            display_concept_library
        when 1 
            add_concept
        when 2
            #delete concept
        when 3
            #edit concept
        when 4
            exit
        end 
    end

    def add_concept
        puts "Add the title of the programming concept:"
        title = gets.chomp
        puts "Add Category:"
        category = gets.chomp
        puts "Add Diffculty to understand from 1-10, 1 is easy and 10 is extremely hard:"
        level = gets.chomp
        puts "Explain the concept, what is it? when is it used?etc..:"
        description = gets.chomp
        concepts << {name: title,
                     category: category,
                     difficulty: level,
                     explained: description
                    }
    end

    def display_concept_library
        puts "Programming Concept Library"
        puts "Select the concept number to view"
        number = 0
        @concepts.each do |concept|
            puts "Concept #{number}: #{concept[:name]} | Language Category: #{concept[:category]}"
            number += 1
        end
        select_concept
    end

    def select_concept
        concept_selected = gets.chomp
    end


    new = ConceptLibrary.new
    new.display_welcome
end
