//
//  ViewController.swift
//  frische-erdbeeren-project
//
//  Created by Matthias Gassner on 23.12.21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var entry:Race!
    @IBOutlet weak var raceNameLabel: UILabel!
    @IBOutlet weak var headTitle: UINavigationItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        if entry == nil {
            return
        }
        
        headTitle.title = entry.raceName
        
        raceNameLabel.text = "\(entry.circuits.circuitName) (\(entry.date))"
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "driver", for: indexPath)
        
        let result = self.entry.results[indexPath.row]
        let driver = result.driver
        let timeOrStatus = result.time?.time ?? result.status
        
        cell.textLabel?.text = "[\(indexPath.row+1)] \(driver.givenName) \(driver.familyName) - \(result.constructor.name)"
        cell.detailTextLabel?.text = "\(timeOrStatus) | Points: \(result.points) "
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18.0)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 16.0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entry.results.count
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
