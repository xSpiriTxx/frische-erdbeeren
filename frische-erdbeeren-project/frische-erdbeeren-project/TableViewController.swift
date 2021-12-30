//
//  TableViewController.swift
//  frische-erdbeeren-project
//
//  Created by Matthias Gassner on 23.12.21.
//

import UIKit

class TableViewController: UITableViewController {

    var queue = DispatchQueue(label: "download")
    var path = "https://ergast.com/api/f1/2021/results.json?limit=2000"
    var model = RaceModel()
    var currentRace: Race!
    var year: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.path = "https://ergast.com/api/f1/\(year ?? "2021")/results.json?limit=2000"
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
        let model = RaceModel()
        if let data = try? Data(contentsOf: url){
            print("Downloaded: \(data)")
            /*if let json = try? JSONSerialization.jsonObject(with: data, options: []){
                print("json: \(json)")
                if let array = json as? [[String : Any]] {
                    print("array is: \(array)")
                    model = parseArray(array: array)
                }else{
                    print("No array")
                }
                
            }*/
            model.parseData(data: data)
        }else{
            print("Error downloading data!")
        }
        return model
    }
    
    /*func parseArray(array: [[String: Any]]) -> RaceModel{
        let model = RaceModel()
        for el in array {
            var entry: Race!
            entry.season = el["season"] as! String
            model.persons.append(entry)
        }
        return model
    }*/

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return (model.data == nil ? 0 : model.data.mrData.raceTable.races.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)

        let race = model.data.mrData.raceTable.races[indexPath.row]

        cell.textLabel?.text = race.raceName
        cell.detailTextLabel?.text = race.date
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18.0)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 16.0)
        
        return cell
    }
    
    //https://stackoverflow.com/questions/55091420/not-able-to-parse-the-json-data-from-f1-url
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentRace = model.data.mrData.raceTable.races[indexPath.row]
        print("selected row \(indexPath)")
        
        //performSegue(withIdentifier: "detail", sender: self)
    }
    
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
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        self.currentRace = model.data.mrData.raceTable.races[indexPath.row]
        
        print("PREPARE")
        if let viewController = segue.destination as? ViewController {
            viewController.entry = self.currentRace
        }
    }
    

}
