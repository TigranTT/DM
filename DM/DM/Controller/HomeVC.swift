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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        urlString = "https://www.firstinspires.org"
        performSegue(withIdentifier: "segueToWebVC", sender: view)
    }
    
    @IBAction func eventButtonPressed(_ sender: Any) {
        urlString = "https://www.yahoo.com"
        performSegue(withIdentifier: "segueToWebVC", sender: view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToWebVC" {
            let webVC = segue.destination as! WebVC
            guard let url = URL(string: urlString)
                else{return}
            webVC.urlAddress = url
        }
    }
    


}

