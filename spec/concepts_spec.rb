require_relative './../concept_item'
require_relative './../menu'
require_relative './../crud_concept'
require_relative './../concept_library'
require_relative './../app.rb'

# describe ConceptItem do
#     it 'should return the category of the item' do
#         name = "Inheritance"
#         category = "Ruby"
#         concept_item = ConceptItem.new(name, category)
#         expect(concept_item.category).to eq(category)
#     end
# end

# describe Menu do
#     it 'should be able to add a concept' do
#     name = "Inheritance"
#     category = "Ruby"
#     menu = Menu.new
#     menu.add_item(name, category)
#     expect(menu.get_category(name)).to eq(category)
#     end
# end

describe ConceptLibrary do
    # it 'should have an empty array of concepts' do
    #     concept_item = ConceptLibrary.new
    #     expect(concept_item.concepts).to eq []
    # end

    #the last task I've created should equal the last task in the array
    # it 'should be able to add a task' do
    #     concept_item = ConceptLibrary.new
    #     concept_item.add_concept("inheritance", "ruby")
    #     expect(concept_item.concepts.last).to eq({concept: "inheritance", category: "ruby"})
    # end

    # it 'should ask user for input' do
    #     concept_item = ConceptLibrary.new
    #     expected_output = "Enter the concept name\n"
    #     expect{concept_item.add_concept_message}.to output(expected_output).to_stdout
    # end

    #test input, but not required for terminal app
    # let(:input) {StringIO.new('test task')}
    # it 'should recieve concept name from terminal input' do
    #     concept_item = ConceptLibrary.new
    #     expect(concept_item.add_concept).to eq('inheritance')
    # end

    it 'should display all our tasks' do
            concept_item = ConceptLibrary.new
            expected_output = "Concepts:\nConcept: inheritance\nCategory: ruby\nDifficulty: 5\nExplained: it is hard"
            expect{concept_item.display_concept_library}.to output(expected_output).to_stdout
    end 

end

