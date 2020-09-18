//
//  ViewController.swift
//  Project7
//
//  Created by Matthew Hollyhead on 04/09/2020.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    var filterWord: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(credits))
        
        navigationItem.leftBarButtonItem = (UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filter)))
        
        performSelector(inBackground: #selector(fetchJSON), with: nil)
    }
    
    @objc func fetchJSON() {
        let urlString: String
            
        if navigationController?.tabBarItem.tag == 0 {
            //urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        } else {
            //urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        
        performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
    }
    
    @objc func credits() {
        let ac = UIAlertController(title: "Credits", message: "All of the information in this App comes from the White House API.", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func filter() {
        let ac = UIAlertController(title: "Enter Filter Word", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let filterAction = UIAlertAction(title: "Search", style: .default) {
            [weak self, weak ac] action in
            guard let filterWord = ac?.textFields?[0].text?.lowercased() else { return }
            self?.filterAnswer(filterWord)
            }
        ac.addAction(filterAction)
        tableView.reloadData()
        present(ac, animated: true)
    }
    
    func filterAnswer(_ answer: String) {
//        filterWord = answer
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//            let petition = petitions[indexPath.row]
//    //        cell.textLabel?.text = petition.title
//    //        cell.detailTextLabel?.text = petition.body
//
//            for title in petition.title {
//                if
//            }
//
//            if petition.title.contains(filterWord!) {
//                cell.textLabel?.text = petition.title
//                cell.detailTextLabel?.text = petition.body
//            }
//
//            return cell
//        }

    }
    
    @objc func showError() {
        let ac = UIAlertController(title: "LoadingError", message: "There was a problem loading feed: Please check connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        } else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }


}

