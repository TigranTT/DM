//
//  WebVC.swift
//  DM
//
//  Created by Tigran Tshorokhyan on 10/29/18.
//  Copyright © 2018 Tigran Tshorokhyan. All rights reserved.
//

import UIKit
import WebKit
import PDFKit

class WebVC: UIViewController, UIWebViewDelegate, WKNavigationDelegate, WKUIDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    var urlAddress = URL(string: "html link")
    var navigationBarTitle = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = navigationBarTitle
        activityIndicator.startAnimating()
        webView.navigationDelegate = self
        let request = URLRequest(url: urlAddress!)
        if Reachability.isConnectedToNetwork() == false {
            self.showAlert("Error Message", message: "Please check internet connection")
        }else{
            webView.load(request)
            //view.addSubview(pdfView)
        }
 
    }
    
    //implementing Activity Indicator to start animating while browser is loading and stop animating after the wbesite finished loading
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        guard let url = urlAddress else { return }
        let pdfView = PDFView(frame: view.frame)
        let pdfDocument = PDFDocument(url: url)
        pdfView.document = pdfDocument
        guard let data = pdfDocument!.dataRepresentation() else { return }
        let activityController = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
    

//    @IBAction func homeButtonPressed(_ sender: Any) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
//        present(vc, animated: true, completion: nil)
//    }
    
}
