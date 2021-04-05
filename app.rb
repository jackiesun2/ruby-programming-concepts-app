class ConceptLibrary
    attr_accessor :task
    def initialize
        @concepts = []
    end

    def concepts 
        return @concepts
    end

    def add_concept(concept_input, category_input)
        concepts << {concept: concept_input,
                     category: category_input}
    end

    def add_concept_message
        puts "Enter the concept name"
        # puts "Add Title"
        # title = gets.chomp
        # puts "Add Category:"
        # catergory = gets.chomp
        # puts "Add Diffculty"
        # difficulty = gets.chomp
        # puts "Add Description"
        # description = gets.chomp
    end 
    
end




# Home section
def display_welcome
    puts "*"*35
    puts "Welcome."
    puts "This is a Programming Concepts App."
    puts "Press * to continue"
    puts "*"*35
end

def display_menu
    puts "*"*35
    puts "1. Programming Concept Library"
    puts "2. Add"
    puts "3. Delete"
    puts "4. Edit"
    puts "*"*35
end


# display concept library
def display_concept_library

end


# menu select

def menu_select
    #select display concept library
    #select add
    #select delete
    #select edit
end


# add section