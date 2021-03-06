//
//  ViewController.swift
//  Project1
//
//  Created by Matthew Hollyhead on 13/07/2020.
//  Copyright © 2020 Matthew Hollyhead. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
                
        print(pictures)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        performSelector(inBackground: #selector(loadImages), with: nil)
        
    }
    
    @objc func loadImages() {
        // FileManager is a built in system type that works with files
        let fm = FileManager.default
        // This is the location of the images
        let path = Bundle.main.resourcePath!
        // This is a collection of the item names found at the path
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // This is a loop that iterates through the items found in path
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // This sorts the pictures array into ascending order
        pictures.sort()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.pictures = pictures
            vc.imagePosition = indexPath.row + 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func shareTapped() {
        
        let vc = UIActivityViewController(activityItems: ["Share this App"], applicationActivities: [])
        
        // App will crash on ipad without this line of code
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc, animated: true)
    }

}

