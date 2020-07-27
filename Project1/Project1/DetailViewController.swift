//
//  DetailViewController.swift
//  Project1
//
//  Created by Matthew Hollyhead on 14/07/2020.
//  Copyright © 2020 Matthew Hollyhead. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedImage: String?
    var pictures: [String]?
    var imagePosition: Int?
    
    // IBOutlet for UI Image View
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title = selectedImage
        title = "Picture \(imagePosition ?? 0) of \(String(describing: pictures!.count))"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
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
