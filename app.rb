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
        puts "*"*35
        display_menu
    end

    def display_menu
        loop do
        puts "0. Programming Concept Library"
        puts "1. Add"
        puts "2. Delete"
        puts "3. Edit"
        puts "*"*35
        input = gets.chomp
        menu_input(input.to_i)
        end
    end

    def menu_input(input)
        case input
        when 0 
            #display programming concept library
            display_concept_library
        when 1 
            #add concept
            add_concept
        when 2
            #delete concept
        when 3
            #edit concept
        when 4
            #exit app
        end 
    end

    def add_concept
        puts "Add the title of the programming concept"
        title = gets.chomp
        puts "Add Category:"
        category = gets.chomp
        puts "Add Diffculty to understand from 1-10, 1 is easy and 10 is extremely hard:"
        level = gets.chomp
        puts "Explain the concept, what is it? when is it used? etc"
        description = gets.chomp
        concepts << {concept: title,
                     category: category,
                     difficulty: level,
                     explained: description
                    }
    end

    def display_concept_library
        
    end

    new = ConceptLibrary.new
    new.display_welcome
end
