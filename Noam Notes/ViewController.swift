//
//  ViewController.swift
//  Noam Notes
//
//  Created by Noam Mizrachi on 10/06/2019.
//  Copyright © 2019 Noam Mizrachi. All rights reserved.
//
/*  ----------------   Comments by Noam ----------------
 
1. '@IBOutlet' means that this property is connected to an interface builder outlet that is, it is connected to some user interface object.
 
 2. To provide data to a Table View we need to set the table's dataSource to an object (self) that implements 'UITableViewDataSource' protocol.
    That is why we added the 'UITableViewDataSource' to our ViewController class ingeritance and we are implementing it's 2 'Required' methods: 'func tableView' and then returning self.
 The class 'UITavleViewDataSource' is the class that provide the data to the Table view. So we associate aour table with the 'UITavleViewDataSource' class.
 
 3. 'return data.count ' will return the number of rows in tne data array we created.
 
 4. Declaration of new Table view cell - we created a prototype cell and define his identifier to be 'cell' and we are reusing him instead of creating new cells each time.
    we could have just create new cells with the declaration: 'let cell: UITableViewCell = UITableViewCell()' .
 
 5. Defining the text in each cell to be the data array content of each row number, that is, each row number in the table ('indexPath.row) gets the contact of the data array cell with the same number. 'idexPath' can provide the row in the table or the section (rows are usually grouped to sections) of the table.
 
 6. We use a Navigation Controller in order to wrap the content we have (the table view) and to give us: title bar at the top of the screen and manages that title bar as we go to different screens in the application, and even controlling animations between the different screens and links to to back to previous screen.
    -- We clicked our Table View on our storyboard and wrapped it with the 'Navigation controller' by selecting 'Editor -> Embed In -> Navigation Controller'.
    We can see in our main.storyboard 2 screens: 'Navigation Controller' that points to a screen 'View Controller'.
 
 7. Defining the title of self to be "Noam Notes".
 
 8. Defining the navigation bar title to be in larger.
 
 9. 'addNote' - A func for creating new note: we are setting the name of the cell to be "Item" and then the number of the row (we already have the first 3 so we start by 4 thus - we say data.count + 1 ).
    Then we insert that name to the data array (at index 0 each time).
    Then, we declare 'indexPath' constant to be the idexPath (the element that provide row and section number) for row 0 and section 0 (because the new row is created at the top of the table).
    Then we add new spot in the table view and show animation that we set to authomatic coice.
    The '@objc' before the function is because we need to expose this function (addNote) to objective-C in order to pass a method in as a selector that is called trough a button action.
 
 10. Adding button to the navigation controller - We created a button for the Bar area, and defined it to be an 'add' kind of button (a '+' shaped), terget is the OBJECT that calls the action being performed when pressing the button, so we entered 'self', and the ation is the method we want to execute when the button is pressed so we entered 'addNote' function.
 
 11. We are setting the right button in the navigation bar to be the 'addButton' we created, which when clicked, run the 'addNote' function.
 We had to select the 'rightBarButtonItem' from the 'navigationItem' property that self have.

 12. We set the left bar button of the navigation bar to be an edit button - a button that is built in and already property of the view controller class.
 
 13. A view controller method that puts the table in editing mode.
    When pressing 'edit' in the app, this function executes and we can now see an option for removing each item, but even if we select removing them, they will not be deleted. So we need to edit the table's DATA and not only the table, we need to handle one of the table's methods.
 
 14. The function handles and edit the content inside the table.
    It allows us to get information about the row the user want to delete.
    When the user press 'Delete' this function executes:
    We first remove the data from the data array, and then update the table by removing the row.
 
 15. If the table is in 'editing mode' the function that executes when the '+' button is pressed do nothin. That is for disabling the option to add new note when the 'edit' button is pressed.
 
 
*/ // ---------------- End of Noam comments ----------------


import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
// Properties
    
    @IBOutlet weak var table: UITableView!  // Comment #1
    var data: [String] = ["Item 1", "Item 2", "Item 3"]
    
// Methodes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self  // Comment #2
        self.title = "Noam Notes" // Comment #7
        self.navigationController?.navigationBar.prefersLargeTitles = true // Comment #8
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote)) // Comment #10
        self.navigationItem.rightBarButtonItem = addButton // Comment #11
        
        self.navigationItem.leftBarButtonItem = editButtonItem // Comment #12
    }
    
    // Comment #9
    @objc func addNote() {
        if table.isEditing {  // Comment #15
            return
        }
        let name: String = "Item \(data.count + 1)"
        data.insert(name, at: 0)
        let indexPath: IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic) // new row and an animation for inserting it
    }

    // Return the number of rows for the table:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count  // Comment #3
    }
    
    // Provide a cell object for each row - creating a cell, put the appropriate text inside it and return it:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! // Comment #4
        cell.textLabel?.text = data[indexPath.row] // Comment #5
        return cell
    }
    
    // Comment #13 - executes when 'Edit' button is pressed
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated) // caling super class method first
        table.setEditing(editing, animated: animated) // puting the table in editing mode
    }
    
    // Comment #14 - executes when 'Delete' button in edit mode is pressed
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row) // remove the data from the data array,
        table.deleteRows(at: [indexPath], with: .fade) // remove the row from the table with 'fade' animation
    }

}

