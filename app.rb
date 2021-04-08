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

    def filter_option(path)
        system 'clear'
        each_concept = @concepts.map.with_index do |concept, index| 
            {name: "Concept #{index + 1}: #{concept[:name]} | Language Category: #{concept[:category]}", value: index}
        end
        choice = @prompt.select("Select the concept you would like to #{path}", each_concept, filter: true)
    end

# delete concept

def delete_concept
    concept_number = filter_option("delete")
    puts "Are you sure you want to delete Concept #{concept_number + 1} (Y/N)"
    user_input = gets.strip.downcase
    if user_input == "y" || user_input == "yes"
        puts "This concept has been deleted. Press enter to return home"
        @concepts.delete_at(concept_number)
        save_concept
    elsif user_input == "n" || user_input == "no"
        puts "This concept has not been deleted. Press enter to return home"
    else 
        puts "Please input Yes/No or Y/N"
    end
    gets
    system 'clear'
    display_menu
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
            concept_index = filter_option("view")
            display_concept(@concepts[concept_index])
            menu_return
        when 1
            add_concept
        when 2
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
        title = gets.strip
        while title.empty? 
            puts "Please enter a title, it cannot be empty"
            title = gets.strip
        end
        puts "Add Category:"
        category = gets.strip
        while category.empty?
            puts "Please enter a category, it cannot be empty"
            category = gets.strip
        end
        puts "Add Diffculty to understand from 1-10, 1 is easy and 10 is extremely hard:"
        level = gets.strip
        while level.empty?
            puts "Please enter a level, it cannot be empty"
            level = gets.strip
        end
        puts "Explain the concept, what is it? when is it used? etc..:"
        description = gets.strip
        while description.empty?
            puts "Please enter a level, it cannot be empty"
            description = gets.strip
        end
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

# edit concept

    def edit_concept
        system 'clear'
        display_concept_library
        puts "Select the concept number you would like to edit..."
        concept = select_concept_edit
        puts "Select the field you would like to edit:"
        puts "name = n | category = c | difficulty = d | explained = e"
        edit_selection(gets.strip.downcase, concept)
        save_concept
    end

    def select_concept_edit
        concept_number = (gets.chomp.to_i - 1)
        display_concept(@concepts[concept_number])
        return @concepts[concept_number]
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
            puts "please select one of the following options: name = n | category = c | difficulty = d | explained = e"
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

end 

# initialize new 

    new = ConceptLibrary.new
    new.display_welcome

# Old code made redudant by ruby gems

