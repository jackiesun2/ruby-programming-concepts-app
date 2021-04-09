# Programming Concepts Application

# Software Plan

# Software Implementation Plan

# Control Flow Diagram

# Error Handling

# Testing

# Bash Script

To launch the application using the bash script, ensure you are in the correct directory and type "./run_app.sh".

### Feature 1 CRUD:

##### Scenario 1: Add a new concept

1. Open the terminal and type in ruby app.rb (ensure you are in the correct directory).
2. Scroll down to add section and select Add.
3. Type in "Arrays" as the title.
4. Type in "Ruby" as the category.
5. Type in "5" for the difficulty level.
6. Type in "Test concept" for the explanation.
7. Now you will return back to the main menu. Select the programming concepts library.
8. You should expect to see the concept you typed as the last concept in the library.

##### Scenario 2: Edit a concept

1. Run ruby app.rb, as per scenario 1.
2. Scroll down to the edit section and select edit.
3. Type in the concept number you would like to edit, choose the last concept on the list.
4. Type in a letter to select the field you would like to edit. Type "n" to change the name and type enter.
5. Change the name to "test name" and type enter. You will automatically be returned to the main menu.
6. Select the programming concepts library on the menu.
7. Scroll down to the bottom and the concept you have edited will have "test name" as the concept name.

### Feature 2 Persistence Storage:

##### Scenario 1: Add a new concept, close application, reopen application and view saved concept

1. Open the terminal and type in ruby app.rb (ensure you are in the correct directory).
2. Scroll down to add section and select Add.
3. Type in "Arrays" as the title.
4. Type in "Ruby" as the category.
5. Type in "5" for the difficulty level.
6. Type in "Test concept" for the explanation.
7. Now you will return back to the main menu. Select exit.
8. Type in ruby app.rb again to run the program.
9. Select programming concept library.
10. Scroll down to the bottom and view the concept you just added.

##### Scenario 2: Delete new concept from storage

1. Run ruby app.rb, as per scenario 1.
2. Scroll down to the delete section and select delete.
3. Select the concept you would like to delete. Choose the last concept on the list.
4. Type in y or yes to confirm you want to delete the concept.
5. A prompt will confirm that the concept has now been deleted. Press enter to return to home menu.
6. Now you are back to the main menu. Select exit.
7. Type in ruby app.rb again to run the program.
8. Select the programming concepts library on the menu.
9. Scroll down to the bottom and the concept you have deleted will now be gone.
