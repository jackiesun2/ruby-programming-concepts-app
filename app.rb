require "json"
require "tty-prompt"
require "ascii"
require 'colorize'

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
        puts "Please input Yes/No or Y/N or enter to return to menu"
    end
    gets
    system 'clear'
    display_menu
end

# menu 

    def display_welcome
        puts "*"*35
        puts "🅆 🄴 🄻 🄲 🄾 🄼 🄴 .".colorize(:blue)
        puts "🅃 🄷 🄸 🅂  🄸 🅂  🄰  🄿 🅁 🄾 🄶 🅁 🄰 🄼 🄼 🄸 🄽 🄶  🄲 🄾 🄽 🄲 🄴 🄿 🅃 🅂  🄰 🄿 🄿 .".colorize(:blue)
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
        system 'clear'
        display_menu
    end

# add concept

    def add_concept
        system 'clear'
        puts "Add the title of the programming concept:"
        title = gets.strip
        check_input(title, "title")
        puts "Add Category:"
        category = gets.strip
        check_input(category, "category")
        puts "Add Diffculty to understand from 1-10, 1 is easy and 10 is extremely hard:"
        level = gets.strip
        check_input(level, "number between 1 - 10")
        puts "Explain the concept, what is it? when is it used? etc..:"
        description = gets.strip
        check_input(description, "description")
        concepts << {name: title,
                     category: category,
                     difficulty: level,
                     explained: description
                    }
        save_concept
    end

    def check_input(input, input_name)
        while input.empty? 
            puts "Please enter a #{input_name}, it cannot be empty"
            input = gets.strip
        end
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
        edit_selection(concept)
        save_concept
    end

    def select_concept_edit
        loop do
        concept_number = (gets.chomp.to_i - 1)
            if concept_number >= 0 && (concept_number + 1) <= @concepts.length
                display_concept(@concepts[concept_number])
                return @concepts[concept_number]
            else
                puts "Please input the correct concept number"
            end
        end
    end

    def edit_selection(concept)
        loop do
        selection = gets.strip.downcase
            if selection == "n"
                puts "New Concept Name:"
                concept[:name] = gets.chomp
                break
            elsif selection == "c"
                puts "New Catergory Type:"
                concept[:category] = gets.chomp
                break
            elsif selection == "d"
                puts "New Difficulty Level:"
                concept[:difficulty] = gets.chomp
                break
            elsif selection == "e"
                puts "New Explanation:"
                concept[:explained] = gets.chomp
                break
            else
                system 'clear'
                display_concept(concept)
                puts "You have not selected the correct input." 
                puts "Please select one of the following options to edit: name = n | category = c | difficulty = d | explained = e"
            end
        end
    end

    def command_line_library(option) 
        case option
        when "library"
            concept_index = filter_option("view")
            display_concept(@concepts[concept_index])
            menu_return
        when "add"
            add_concept
        when "delete"
            delete_concept
        when "edit"
            edit_concept
        end
    end

end 

# Initialize new & Ruby arguments 

    new = ConceptLibrary.new
    option = ARGV[0]
    ARGV.clear

    if option == "-h".downcase || option == "-help".downcase
        puts "This is a programming concepts application"
        puts "Command line arguments include add, delete and edit arguments. To use the command line argument, run the program with ruby app.rb, to use the CRUD features through the command line use ruby app.rb add to add and vice versa for delete and edit."
    elsif option == "library".downcase || option == "add".downcase || option == "delete".downcase || option == "edit".downcase
        new.command_line_library(option)
    else
    new.display_welcome
    end
