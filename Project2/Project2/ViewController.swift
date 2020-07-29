//
//  ViewController.swift
//  Project2
//
//  Created by Matthew Hollyhead on 27/07/2020.
//  Copyright © 2020 Matthew Hollyhead. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Video is 25:54 in
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        //  This puts a 1 point boarder around the button
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // Changes border colour
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    @objc func shareTapped() {
        
//        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else
//            {
//            print("No image found")
//            return
//        }
        
//        let vc = UIActivityViewController(activityItems: [image, selectedImage!], applicationActivities: [])
//
//        // App will crash on ipad without this line of code
//        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
//
//        present(vc, animated: true)
        
        let ac = UIAlertController(title: "Your Score: \(score) points scored", message: "Question \(questionsAsked) out of 10 questions.", preferredStyle: .alert)
        
        // This puts a button on the alert
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        
        // This presents the alert
        present(ac, animated: true)
    }
    
    func askQuestion(action: UIAlertAction!) {
        
        
        questionsAsked += 1
        
        // shuffles the countries array
        countries.shuffle()
        
        // choses a random Integer between 0 and 2 and stores it in correctAnswer
        // It uses the range operator
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // This takes the country at position correctAnswer and uses it for the title
        // .uppercased capitalises the whole title
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
        
        if questionsAsked == 11 {
            
            // This shows an on screen alert to the user
            let ac = UIAlertController(title: "Final Score: \(score) out of 10", message: "You have answered 10 questions!", preferredStyle: .alert)
            
            // This puts a button on the alert
            ac.addAction(UIAlertAction(title: "Start Again", style: .default, handler: askQuestion))
            
            // This presents the alert
            present(ac, animated: true)
            
            questionsAsked = 0
            score = 0
            
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong that flag belongs to \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        // This shows an on screen alert to the user
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        // This puts a button on the alert
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        // This presents the alert
        present(ac, animated: true)
    }
    
    
    
}

