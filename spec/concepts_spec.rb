require_relative './../app.rb'

describe ConceptLibrary do
    
    context "Given an invalid input e.g. empty string or wrong data type" do 
        #edit section
        it 'should return an error message to try again' do
            concept_item = ConceptLibrary.new
            expect(concept_item)
        end 
        #add section
        it 'should return a error message if the input is empty' do 
            concept_item = ConceptLibrary.new
            expect(concept_item)
        end

    end 

        it 'should be able to add a task' do
            concept_item = ConceptLibrary.new
            concept_item.add_concept("inheritance", "ruby")
            expect(concept_item.concepts.last).to eq({concept: "inheritance", category: "ruby"})
        end

        it 'should display all our concepts' do
            concepts = ConceptLibrary.new
            expected_output = "Concepts:\nConcept: inheritance\nCategory: ruby\nDifficulty: 5\nExplained: it is hard"
            expect{concept_item.display_concept_library}.to output(expected_output).to_stdout
        end 

end 

