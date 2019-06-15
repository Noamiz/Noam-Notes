//
//  DetailViewController.swift
//  Noam Notes
//
//  Created by Noam Mizrachi on 15/06/2019.
//  Copyright © 2019 Noam Mizrachi. All rights reserved.
//

/* ------------------------  Noam Comments  ------------------------
 
 1. This custom class was created for connecting our detail view ('Note' scene) to this custom class, and then connecting the text view of the Note scene to a property of this custom class.
    In order to modify the text in the 'detail' view (Note scene) inside our code, we created this custom class for this view controller (Note scene).
    * For connecting our 'Note' view controller to the 'DetailViewController' class we select the view controller object of the 'Note' scene (top left at the bar) and then at the utility area we select the 'identity inspector'. At the 'Class' field we select 'DetailViewController' and now they are connected.
 
 
 2. Connection between our text view in the 'Note' screen to our detailViewController class
 
 3. For setting the content of the text view we created a setter.
 
 4. We create an 'masterView' variable of type ViewController that will reference the main (master) view controller of our app.
 
 5. The func viewWillDisappear is for when the detailView is on is way our, that is, returning to the master view, we want to modify (main) view controller on the way in it, using that initial data.
 
 6. Every time view appears, when we call this method it authomaticly brings up the software keyboard to pop up.
 
 
 */ // ------------------------  End Comments  ------------------------

import UIKit

class DetailViewController: UIViewController {

// Properties:
    @IBOutlet weak var textView: UITextView! // Comment #2
    var text: String = ""
    var masterView: ViewController! // Comment #4
    
    
// Methods:
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.text = text
        self.navigationItem.largeTitleDisplayMode = .never // Detail view controller will never distlay large titles
    }
    
    // Comment #6
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
        textView.resignFirstResponder() // When returning to the main view controller the keyboard will slide down
    }
    
    // Comment #3
    func setText(t: String) {
        text = t
        if isViewLoaded {
            textView.text = t
        }
    }
    
    // Comment #5
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        masterView.newRowText = textView.text
    }

}
