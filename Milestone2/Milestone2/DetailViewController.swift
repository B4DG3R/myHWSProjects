//
//  DetailViewController.swift
//  Milestone2
//
//  Created by Matthew Hollyhead on 30/07/2020.
//  Copyright © 2020 Matthew Hollyhead. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var selectedImage: Flag?
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage?.title.uppercased()
        navigationItem.largeTitleDisplayMode = .never
        
        if selectedImage != nil {
            imageView.image = selectedImage?.image
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
    }
    
    @objc func shareTapped() {
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else
        {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, selectedImage?.title as Any], applicationActivities: [])
        
        // App will crash on ipad without this line of code
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc, animated: true)
    }
}
