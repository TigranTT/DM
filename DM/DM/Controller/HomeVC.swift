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
    
    var urlString = ""
    var textString = ""
    var navigationTitle = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        navigationTitle = "About FIRST"
        urlString = "https://www.firstinspires.org"
        performSegue(withIdentifier: "segueToWebVC", sender: view)
    }
    
    @IBAction func eventButtonPressed(_ sender: Any) {
        navigationTitle = "About us"
        textString = "https://www.yahoo.com"
        performSegue(withIdentifier: "segueToTextVC", sender: view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToWebVC" {
            let webVC = segue.destination as! WebVC
            guard let url = URL(string: urlString)
                else{return}
            webVC.urlAddress = url
            webVC.navigationTitle = navigationTitle
        } else if segue.identifier == "segueToTextVC" {
            let webVC = segue.destination as! TextVC
            webVC.navigationTitle = navigationTitle
        }
    }
    


}

