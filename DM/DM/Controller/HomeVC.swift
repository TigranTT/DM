//
//  ViewController.swift
//  DM
//
//  Created by Tigran Tshorokhyan on 9/28/18.
//  Copyright © 2018 Tigran Tshorokhyan. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var eventButton: UIBarButtonItem!
    @IBOutlet weak var menuView: UIView!
    
    var urlString = ""
    var textString = ""
    var navigationBarTitle = ""
    
    var viewIsShowing = true
    var shareButton = Bool()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        showMenuView(false)
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
    
    
    @IBAction func eventButtonPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func aboutFirstButtonPressed(_ sender: Any) {
        viewIsShowing = true
        showMenuView(false)
        navigationBarTitle = "About FIRST"
        urlString = "https://www.firstinspires.org"
        shareButton = false
        performSegue(withIdentifier: "segueToWebVC", sender: view)
    }
    
    @IBAction func aboutUsButtonPressed(_ sender: Any) {
        viewIsShowing = true
        showMenuView(false)
        navigationBarTitle = "About us"
        textString = "https://www.yahoo.com"
        performSegue(withIdentifier: "segueToTextVC", sender: view)
    }
    
    
    @IBAction func supportUsButtonPressed(_ sender: Any) {
        navigationBarTitle = "Support Us"
        shareButton = true
        urlString = "http://darkmatter14374.org/wp-content/uploads/2018/06/SCAN_DM-Sponsorship-Form.pdf"
        performSegue(withIdentifier: "segueToWebVC", sender: view)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToWebVC" {
            let vc = segue.destination as! WebVC
            guard let url = URL(string: urlString)
                else{return}
            vc.urlAddress = url
            vc.navigationBarTitle = navigationBarTitle
            vc.shareButton.isEnabled = shareButton
        } else if segue.identifier == "segueToTextVC" {
            let vc = segue.destination as! TextVC
            vc.navigationBarTitle = navigationBarTitle
        }
    }
    


}

