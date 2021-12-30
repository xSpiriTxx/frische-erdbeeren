//
//  DetailTable.swift
//  frische-erdbeeren-project
//
//  Created by Matthias Gassner on 29.12.21.
//

import UIKit

class DetailTable: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if model.data == nil {
            return 0
        }
            
        return model.data.mrData.raceTable.races.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)

        let person = model.data.mrData.raceTable.races[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = person.raceName
        cell.detailTextLabel?.text = person.season+" - "+person.round

        return cell
    }

}
