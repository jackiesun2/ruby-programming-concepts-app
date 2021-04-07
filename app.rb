require "json"
require "tty-prompt"


class ConceptLibrary
    attr_accessor :concepts
    def initialize
        @concepts = load_concepts
        @prompt = TTY::Prompt.new
    end

# Concept Library

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

    def display_concept_library
        puts "Programming Concept Library"
        number = 1
        @concepts.each do |concept|
            puts "Concept #{number}: #{concept[:name]} | Language Category: #{concept[:category]}"
            number += 1
        end
        puts "*"*35
    end

    # def select_concept(index)
    #     display_concept(@concepts[index])
    # end

    def select_concept_edit
        concept_number = (gets.chomp.to_i - 1)
        display_concept(@concepts[concept_number])
        @concepts[concept_number]
    end

    def filter_option
        system 'clear'
        each_concept = @concepts.map.with_index do |concept, index| 
            {name: "Concept: #{index + 1} #{concept[:name]}", value: index}
        end
        choice = @prompt.select("Select the concept you would like to view", each_concept, filter: true)
    end

# menu 

    def display_welcome
        puts "*"*35
        puts "Welcome."
        puts "This is a Programming Concepts App."
        display_menu
    end

    def display_menu
        loop do
            input = @prompt.select("Menu:") do |menu|
                puts "*"*35
                menu.choice "Programing Concept Library", 0
                menu.choice "Add", 1
                menu.choice "Delete", 2
                menu.choice "Edit", 3
                menu.choice "Exit", 4
            end
            menu_input(input)              
        end
    end

    def menu_input(input)
        case input
        when 0
            # display_concept_library
            concept_index = filter_option
            display_concept(@concepts[concept_index])
            # select_concept(validate_input_number)
            # select_concept
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
        begin
            data = File.read("app.json")
            JSON.parse(data, symbolize_names: true)
        rescue Errno::ENOENT
            puts "This file does not exist, please make the file"
            exit
        end 
    end

# select concept



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
            puts "Select the concept number you would like to edit..."
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
        else
            puts 
        end
    end

# error handling 

    def validate_input_number
        # regex to solve this? 
        # multiple number? 
        # how to fix this to input a letter to get an error?
        loop do
            concept_number = gets.chomp.to_i * 1
                if concept_number >= 1
                    concept_number = (concept_number - 1)
                        if @concepts.length >= (concept_number + 1)
                            return concept_number
                        else
                            puts "Number is not between 1 - #{@concepts.length} try another number"
                        end
                else 
                    # puts "This is not a number, Press enter to try again"
                    # gets
                end
                puts "This is not a number, Press enter to try again"
                gets
            end
    end

# initialize new 

end 

    new = ConceptLibrary.new
    new.display_welcome
     # new2 = ConceptLibrary.new 
    # str = String.new
    # prompt = TTY::Prompt.new

    # class test
    #     @prompt = 
    # end

    # new = ConceptLibrary.new


# Old code made redudant by ruby gems

