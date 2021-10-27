//
//  WelcomeViewController.swift
//  EduardMudritskiiHW 2.3
//
//  Created by Эдуард on 27.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, " + userName
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        userName = ""
    }
}
