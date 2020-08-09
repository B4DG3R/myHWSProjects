//
//  ViewController.swift
//  Project4
//
//  Created by Matthew Hollyhead on 06/08/2020.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var progressView: UIProgressView!
    var websites = ["hackingwithswift.com", "apple.com"]
    var website: String?
    
    override func loadView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        //  creates an instance of UIProgressView
        progressView = UIProgressView(progressViewStyle: .default)
        
        // sets the layout size to fit its contents fully
        progressView.sizeToFit()
        
        // uses the customView initialiser to wrap and make the barButton
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        //let url = URL(string: "https://" + websites[0])!
        let url = URL(string: "https://\(website!)")!
        
        print(url)
        
        // This wraps the url in a URL request
        webView.load(URLRequest(url: url))
        
        // This allows a property on the webView that allows the users to swipe back and forth.
        
        webView.allowsBackForwardNavigationGestures = true
        
    }
    
    
    @IBAction func goBackButtonTapped(_ sender: UIButton) {
        
        webView.goBack()
    }
    
    @IBAction func goForwardButtonTapped(_ sender: UIButton) {
        
        webView.goForward()
    }
    
//    @objc func openTapped() {
//
//        let ac = UIAlertController(title: "Open Page...", message: nil, preferredStyle: .actionSheet)
//
//        for website in websites {
//            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
//        }
//
//        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//
//        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
//        present(ac, animated: true)
//    }
    
//    func openPage(action: UIAlertAction) {
//
//        guard let actionTitle = action.title else { return }
//        guard let url = URL(string: "https://" + actionTitle) else { return }
//        webView.load(URLRequest(url: url))
//
//    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//
//        let url = navigationAction.request.url
//
//        if let host = url?.host {
//            for website in websites {
//                if host.contains(website) {
//                    decisionHandler(.allow)
//                    return
//                }
//            }
//        } else {
//
//            decisionHandler(.cancel)
//
//            let ac = UIAlertController(title: "Site Blocked", message: "This website is not allowed", preferredStyle: .alert)
//
//            // This puts a button on the alert
//            ac.addAction(UIAlertAction(title: "Cencel", style: .cancel))
//
//            // This presents the alert
//            present(ac, animated: true)
//
//        }
//
//
//    }

}

