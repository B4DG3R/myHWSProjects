//
//  TableViewController.swift
//  Project4
//
//  Created by Matthew Hollyhead on 07/08/2020.
//

import UIKit

class TableViewController: UITableViewController {
    
    var websiteList: [Website] = []
    var sites: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        sites += ["hackingwithswift.com", "apple.com"]
        
        websiteList = createArray()
        
        
    }
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return websiteList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let websiteCell = websiteList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WebsiteCell") as! TableViewCell

        // Configure the cell...
        
        cell.setLabel(website: websiteCell)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let indexPath = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
//
//        //let currentCell = tableView.cellForRow(at: indexPath!) as UITableViewCell?
//
//        let cell = tableView.cellForRow(at: indexPath!) as! TableViewCell
//        print("cell - \(cell.textLabel?.text)")
//
//        //print(currentCell?.textLabel!.text!)
        
        let websiteURL = websiteList[indexPath.row]
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebView") as? WebViewController {
            vc.website = websiteURL.url
//            vc.pictures = pictures
//            vc.imagePosition = indexPath.row + 1
            
            
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    func createArray() -> [Website] {
        
        var tempArray: [Website] = []
        
        for site in sites {
            let website = Website(url: site)
            tempArray.append(website)
        }
        
        return tempArray
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
