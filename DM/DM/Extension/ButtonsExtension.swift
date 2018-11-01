//
//  ButtonsExtension.swift
//  DM
//
//  Created by Tigran Tshorokhyan on 10/7/18.
//  Copyright © 2018 Tigran Tshorokhyan. All rights reserved.
//

import Foundation
import UIKit

//class to use for Buttons on the MainVC
class CustomButton: UIButton {
    
    override func awakeFromNib() {
        super .awakeFromNib()
        layer.borderWidth = 1.0
        layer.borderColor = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)
        layer.cornerRadius = 3.0
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: -1.0, height: -1.0)
        layer.shadowColor = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)
        //layer.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
}
