//
//  ViewController.swift
//  frische-erdbeeren-project
//
//  Created by Matthias Gassner on 23.12.21.
//

import UIKit

class ViewController: UIViewController {

    var entry = Entry()
    
    @IBOutlet weak var raceNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        raceNameLabel.text = entry.raceName
        // Do any additional setup after loading the view.
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
