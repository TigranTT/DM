//
//  ViewController.swift
//  DM
//
//  Created by Tigran Tshorokhyan on 9/28/18.
//  Copyright © 2018 Tigran Tshorokhyan. All rights reserved.
//

import UIKit
import MessageUI

class HomeVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var eventButton: UIBarButtonItem!
    @IBOutlet weak var menuView: UIView!
    
    
    
    var urlAddress = URL(string: "")
    var urlString = ""
    var navigationBarTitle = ""
    
    var viewIsShowing = true
    var shareButtonIsEnabled = false
    var darkMatterFormButtonIsHiiden = true
    
    //let pathToSponsorhipFormPDF = Bundle.main.path(forResource: "SponsorshipForm", ofType: "pdf")
    let pathToSponsorhipFormPDF = Bundle.main.url(forResource: "SponsorshipForm", withExtension: "pdf")
    let pathToSponsorshipLevels = Bundle.main.url(forResource: "SponsorshipLevels", withExtension: "rtf")
    let pathToAboutUs = Bundle.main.url(forResource: "AboutUs", withExtension: "rtf")
    let pathToSponsorsImage = Bundle.main.url(forResource: "Sponsors", withExtension: "png")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        showMenuView(false)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector (hideMenuView))
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    func showMenuView(_ show: Bool) {
        UIView.animate(withDuration: 0.4, animations: {
            if show {
                self.menuButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.menuView.transform = CGAffineTransform(translationX: 0, y: 7)
            }else{
                self.menuButton.tintColor = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)
                self.menuView.transform = CGAffineTransform(translationX: 0, y: -80)
            }
        })
    }
    
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        if viewIsShowing {
            showMenuView(true)
            viewIsShowing = false
        } else {
            showMenuView(false)
            viewIsShowing = true
        }
    }
    
    @objc func hideMenuView(gestureRecognizer: UIGestureRecognizer) {
        viewIsShowing = true
        showMenuView(false)
    }
    
    
    @IBAction func eventButtonPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func aboutFirstButtonPressed(_ sender: Any) {
//        viewIsShowing = true
//        showMenuView(false)
        shareButtonIsEnabled = false
        darkMatterFormButtonIsHiiden = true
        navigationBarTitle = "About FIRST"
        urlString = "https://www.firstinspires.org"
        urlAddress = URL(string: urlString)
        performSegue(withIdentifier: "segueToWebVC", sender: view)
    }
    
    @IBAction func aboutUsButtonPressed(_ sender: Any) {
        shareButtonIsEnabled = false
        darkMatterFormButtonIsHiiden = true
        navigationBarTitle = "About us"
        urlAddress = pathToAboutUs
        performSegue(withIdentifier: "segueToWebVC", sender: view)
    }
    
    @IBAction func ourSponsorsButtonPressed(_ sender: Any) {
        shareButtonIsEnabled = false
        darkMatterFormButtonIsHiiden = true
        navigationBarTitle = "About us"
        urlAddress = pathToSponsorsImage
        performSegue(withIdentifier: "segueToWebVC", sender: view)
    }
    
    
    @IBAction func supportUsButtonPressed(_ sender: Any) {
        shareButtonIsEnabled = false
        darkMatterFormButtonIsHiiden = false
        navigationBarTitle = "Support Us"
        urlAddress = pathToSponsorshipLevels
        performSegue(withIdentifier: "segueToWebVC", sender: view)
    }
    
    
    @IBAction func contactUsButtonPressed(_ sender: Any) {
        let mailView = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailView, animated: true, completion: nil)
        }else{
            showAlert("Error", message: "eMail is not setup")
        }
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["darkmatter14374@gmail.com"])
        mailComposerVC.setSubject("DarkMatter (Mobile app)")
        mailComposerVC.setMessageBody("Message for DarkMatter.", isHTML: false)
        
        return mailComposerVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToWebVC" {
            let vc = segue.destination as! WebVC
            guard let urlAddress = urlAddress else{return}
            vc.urlAddress = urlAddress
            vc.navigationBarTitle = navigationBarTitle
            vc.shareButtonIsEnabled = shareButtonIsEnabled
            vc.darkMatterFormButtonIsHiiden = darkMatterFormButtonIsHiiden
        }
    }
    


}

