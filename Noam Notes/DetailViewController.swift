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
 
 
 
 */ // ------------------------  End Comments  ------------------------

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textView: UITextView! // Connection between our text view in the 'Note' screen to our detailViewController class
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.text = "New Note"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
