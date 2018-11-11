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
    @IBOutlet weak var buttonDarkMatterForm: UIButton!
    
    
    var urlAddress = URL(string: "html link")
    var navigationBarTitle = ""
    var shareButtonIsEnabled = false
    var darkMatterFormButtonIsHiiden = true
    
    var pathToSponsorhipFormPDF = Bundle.main.url(forResource: "SponsorshipForm", withExtension: "pdf")

    override func viewDidLoad() {
        super.viewDidLoad()
        shareButton.isEnabled = shareButtonIsEnabled
        buttonDarkMatterForm.isHidden = darkMatterFormButtonIsHiiden
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
    
    @IBAction func darkMatterFormButtonPressed(_ sender: Any) {
        guard let url = pathToSponsorhipFormPDF else { return }
        let request = URLRequest(url: url)
        urlAddress = url
        webView.load(request)
        shareButton.isEnabled = true
        buttonDarkMatterForm.isHidden = true
    }
    

    
    @IBAction func shareButtonPressed(_ sender: Any) {
        shareButton.isEnabled = false
        guard let url = urlAddress else { return }
        let pdfView = PDFView(frame: view.frame)
        let pdfDocument = PDFDocument(url: url)
        pdfView.document = pdfDocument
        guard let data = pdfDocument!.dataRepresentation() else { return }
        let activityController = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
        shareButton.isEnabled = true
    }
    

//    @IBAction func homeButtonPressed(_ sender: Any) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
//        present(vc, animated: true, completion: nil)
//    }
    
}
