//
//  WebVC.swift
//  DM
//
//  Created by Tigran Tshorokhyan on 10/29/18.
//  Copyright © 2018 Tigran Tshorokhyan. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController, UIWebViewDelegate, WKNavigationDelegate, WKUIDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var homeButton: UIBarButtonItem!
    
    var urlAddress = URL(string: "html link")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        activityIndicator.startAnimating()
        webView.navigationDelegate = self
        let request = URLRequest(url: urlAddress!)
        if Reachability.isConnectedToNetwork() == false {
            self.showAlert("Error Message", message: "Please check internet connection")
        }else{
            webView.load(request)
        }
 
    }
    
    //implementing Activity Indicator to start animating while browser is loading and stop animating after the wbesite finished loading
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    

    @IBAction func homeButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
        present(vc, animated: true, completion: nil)
    }
    
}
