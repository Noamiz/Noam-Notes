//
//  ViewController.swift
//  Noam Notes
//
//  Created by Noam Mizrachi on 10/06/2019.
//  Copyright © 2019 Noam Mizrachi. All rights reserved.
//
/*  ------------------   Comments by Noam ------------------
 
1. '@IBOutlet' means that this property is connected to an interface builder outlet that is, it is connected to some user interface object. We created it by adding Table View object to the main.storyboard and then right-clicked-draged it from there to the VewController.swift file as a property - and save as 'table'.
 
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
 
 16. func 'save' writes the data from the 'data' array to a file in a locatoin on the devise that is spesified by URL whenever we change data.
    The data array is wrapped by NSArray that adds the options to read and write the data in the array to a file.
    In the 'try' statement we are writing the data in the 'data' array to a file in order to save it.
    We call this function when a note is deleted (in 'tableView' with commit).
 
 17. func 'load' makes sure that there is data to load and that its the right type of data.
    The data array then is being loaded with the data that is saved in the given URL path.
    Data is loaded when the app launches because we call this function inside the function 'viewDidLoad'.
 
 18. 'fileURL' if of type URL that is a referance to the file we want to save (that contains the data from the 'data' array).
    'baseURL' is of type URL - we are getting the file URL for the documents directory.
    Next step - we give our 'fileURL' a path component called 'notes.txt' that is, we are passing the name of the file as a string.
 
 19. We need to respond to a selected row in the table view.
    First we connect our table to a delegate (dataSource handles the data in the table, while the Delegate handles interactivity). Again, we need fo add inheritance from 'UITableViewDelegate'.
    We are using the 'UITableViewDelegate' method tableView with 'didSelectRowAt' that tells the delegate that the specifide row is now selected.
    Now when we select a row on the app we will see in the output area on xcode the name of the row.
    This process is for responding to a selection in a table view - we tell the table to set it's delegate to our class (self) and we handle the mentioned method.
 
 20. We added the third view controller to be the new screen when a row is selected in the table view - so when we select a note (row) we will be taken to the screen that will show us the full text of the note.
    We will be able to edit our note in that screen.
    When we go back the note authomaticly be saved.
    We added to this view controller a 'text view' for multiple lines of text. Again I added constraints to the text view by selecting it, pin it to the edges of the screen of the main view, and pressing: 'cmd + shift + opt + =' in order for the content to streach and shrink in the correct dimantions of the Apple devise.
    We gave this screen a title 'Note' in the attribute inspector.
    In video 21 he shows how to create the transition (segue) between the 2 view controllers - from the first view controller 'view controller' object that is located at the top left of the view controller bar we drag to the seconds view controller main screen (In the text view) and then select 'show'.
    We selected the segue (arrow between 2 view controller that was created and gave it an identifier 'detail').
    * Now the new view is a 'childe' of the main view controller, and thus it have a title bar and a 'Back' button!
 
 21. We are creating a transition from this main controller view to the 'Note' view. The identifier of the segue is the string 'detail' because that is the identifier of the segue between those two views.
    We put the same row (for performing the segue) in the func 'addNote' because we also want it to happen when we create new note.
 
 
 
 
*/ // ------------------ End of Noam comments ------------------


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
// Properties
    
    @IBOutlet weak var table: UITableView!  // Comment #1
    var data: [String] = []
    var fileURL: URL! // Comment #18
    
// Methodes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self  // Comment #2
        table.delegate = self // Comment #19
        
        self.title = "Noam Notes" // Comment #7
        self.navigationController?.navigationBar.prefersLargeTitles = true // Comment #8
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote)) // Comment #10
        self.navigationItem.rightBarButtonItem = addButton // Comment #11
        
        self.navigationItem.leftBarButtonItem = editButtonItem // Comment #12
        
        let baseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) // Comment #18
        fileURL = baseURL.appendingPathComponent("notes.txt") // Comment #18
        
        load() // comment #17
    }
    
    // Comment #9
    @objc func addNote() {
        if table.isEditing {  // Comment #15
            return
        }
        let name: String = "Item \(data.count + 1)"
        data.insert(name, at: 0)
        let indexPath: IndexPath = IndexPath(row: 0, section: 0) // always the top row
        table.insertRows(at: [indexPath], with: .automatic) // new row and an animation for inserting it
        self.performSegue(withIdentifier: "detail", sender: nil) // Comment #21
    }

    // Return the number of rows for the table: (required method of UITableViewDataSource)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count  // Comment #3
    }
    
    // Provide a cell object for each row - creating a cell, put the appropriate text inside it and return it: (required method of UITableViewDataSource)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! // Comment #4
        cell.textLabel?.text = data[indexPath.row] // Comment #5
        return cell
    }
    
    // Comment #13 - executes when 'Edit' button is pressed
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated) // calling super class method first
        table.setEditing(editing, animated: animated) // puting the table in editing mode
    }
    
    // Comment #14 - executes when 'Delete' button in edit mode is pressed
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row) // remove the data from the data array,
        table.deleteRows(at: [indexPath], with: .fade) // remove the row from the table with 'fade' animation
        save() // Comment #16
    }
    
    // Comment 19 - this method handle selecting the row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.performSegue(withIdentifier: "detail", sender: nil) // Comment #21
    }
    
    // Comment #16
    func save() {
        let a = NSArray(array: data) //NSArray wraps the array and adds functionality like writing and reading from a file
        do {
            try a.write(to: fileURL) // Comment #18
        } catch  {
            print("Error writing to file")
        }
    }
    
    // comment #17
    func load() {
        if let loadedData: [String] = NSArray(contentsOf: fileURL) as? [String] { // if data not nil and and typecast works
            data = loadedData
            table.reloadData()
        }
    }

}

