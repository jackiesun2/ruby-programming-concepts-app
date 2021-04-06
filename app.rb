require "json"

class ConceptLibrary
    attr_accessor :concepts
    def initialize
        @concepts = load_concepts
    end

# display pages

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

    def display_concept_library
        puts "Programming Concept Library"
        number = 1
        @concepts.each do |concept|
            puts "Concept #{number}: #{concept[:name]} | Language Category: #{concept[:category]}"
            number += 1
        end
    end

    def display_concept(concept)
            system 'clear'
            puts "Programming Concept"
            puts "*"*35
            puts "Concept name: #{concept[:name]}"
            puts "Concept category: #{concept[:category]}"
            puts "Concept difficulty: #{concept[:difficulty]}"
            puts "Explained:"
            puts "#{concept[:explained]}"
            puts "*"*35
    end

# menu input

    def menu_input(input)
        case input
        when 0 
            display_concept_library
            puts "Select the concept you would like to view"
            select_concept
            menu_return
        when 1 
            add_concept
        when 2
            puts "Select the concept number you would like to delete"
            delete_concept
        when 3
            edit_concept
        when 4
            exit
        end 
    end

    def menu_return
        puts "Press enter to return to menu"
        gets
        display_menu
    end

# add concept

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
        save_concept
    end

# persistence storage

    def save_concept
        File.write("app.json",concepts.to_json)
    end

    def load_concepts
        data = File.read("app.json")
        JSON.parse(data, symbolize_names: true)
    end

# select concept

    def select_concept
        concept_number = (gets.chomp.to_i - 1)
        display_concept(@concepts[concept_number])
    end

    def select_concept_edit
        concept_number = (gets.chomp.to_i - 1)
        display_concept(@concepts[concept_number])
        @concepts[concept_number]
    end


# delete concept

    def delete_concept
            system 'clear'
            display_concept_library
            concept_number = (gets.chomp.to_i - 1)
            @concepts.delete_at(concept_number)
            save_concept
            display_concept_library
            puts "Press enter to return to menu"
            get_back = gets.chomp
            display_menu
    end

# edit concept

    def edit_concept
            system 'clear'
            display_concept_library
            puts "Select the concept you would like to edit..."
            concept = select_concept_edit
            puts "Select the field you would like to edit:"
            puts "name = n | category = c | difficulty = d | explained = e"
            edit_selection(gets.chomp, concept)
            save_concept
    end

    def edit_selection(edit, concept)
        if edit == "n"
            puts "New Concept Name:"
            concept[:name] = gets.chomp
        elsif edit == "c"
            puts "New Catergory Type:"
            concept[:category] = gets.chomp
        elsif edit == "d"
            puts "New Difficulty Level:"
            concept[:difficulty] = gets.chomp
        elsif edit == "e"
            puts "New Explanation:"
            concept[:explained] = gets.chomp
        end
    end

    new = ConceptLibrary.new
    new.display_welcome

end
