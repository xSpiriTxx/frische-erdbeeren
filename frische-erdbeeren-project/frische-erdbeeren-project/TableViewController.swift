//
//  TableViewController.swift
//  frische-erdbeeren-project
//
//  Created by Matthias Gassner on 23.12.21.
//

import UIKit

class TableViewController: UITableViewController {

    var queue = DispatchQueue(label: "download")
    //let path = "https://ergast.com/api/f1/2021/22/results.json"
    let path = "https://ergast.com/api/f1/2021/22.json"
    var model = RaceModel()
    var currentPerson: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: path){
            download(url: url)
        }
        
        
    }
    func download(url: URL){
        queue.async {
            let tempModel = self.asyncDownload(url: url)
            DispatchQueue.main.async {
                self.model = tempModel
                self.tableView.reloadData()
            }
        }
    }
    
    func asyncDownload(url:URL) -> RaceModel{
        var model = RaceModel()
        if let data = try? Data(contentsOf: url){
            print("Downloaded: \(data)")
            if let json = try? JSONSerialization.jsonObject(with: data, options: []){
                print("json: \(json)")
                if let array = json as? [[String : Any]] {
                    print("array is: \(array)")
                    model = parseArray(array: array)
                }else{
                    print("No array")
                }
            }
        }else{
            print("Error downloading data!")
        }
        return model
    }
    
    func parseArray(array: [[String: Any]]) -> RaceModel{
        let model = RaceModel()
        for el in array {
            let entry = Entry()
            entry.season = el["season"] as! String
            model.persons.append(entry)
        }
        return model
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)

        let person = model.persons[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = person.raceName
        cell.detailTextLabel?.text = person.season

        return cell
    }
    
    //https://stackoverflow.com/questions/55091420/not-able-to-parse-the-json-data-from-f1-url
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentPerson = model.persons[indexPath.row]
        print("selected row \(indexPath)")
        
        //performSegue(withIdentifier: "detail", sender: self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("PREPARE")
        if let viewController = segue.destination as? ViewController {
            viewController.entry = self.currentPerson!
        }
    }
    

}
