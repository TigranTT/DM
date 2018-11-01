//
//  TextVC.swift
//  DM
//
//  Created by Tigran Tshorokhyan on 10/30/18.
//  Copyright © 2018 Tigran Tshorokhyan. All rights reserved.
//

import UIKit

class TextVC: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var navigationBarTitle = ""
    
//    var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = navigationBarTitle
//        textView.text = text
        
    }
    
    @IBAction func homeButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
        present(vc, animated: true, completion: nil)
    }

}
