//
//  UITableTableViewController.swift
//  Milestone2
//
//  Created by Matthew Hollyhead on 30/07/2020.
//  Copyright © 2020 Matthew Hollyhead. All rights reserved.
//

import UIKit

class UITableTableViewController: UITableViewController {
    
    var countries: [String] = []
    var flag: [Flag] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flag Viewer"
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        flag = createArray()
        
        // setImage(UIImage(named: countries[0]))

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func createArray() -> [Flag] {
        
        var tempFlagArray: [Flag] = []
        var country = 0
        
        for _ in countries {
            
            let flagCell = Flag(image: UIImage(named: countries[country])!, title: countries[country].uppercased())
            
            tempFlagArray.append(flagCell)
            
            country += 1
        }
        
        return tempFlagArray
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let flagCell = flag[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell") as! FlagCell

        // Configure the cell...
        cell.setFlag(flag: flagCell)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = flag[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
