//
//  MenuViewExtension.swift
//  DM
//
//  Created by Tigran Tshorokhyan on 10/7/18.
//  Copyright © 2018 Tigran Tshorokhyan. All rights reserved.
//

import Foundation
import UIKit

class MenuViewExtension: UIView {
    
    override func awakeFromNib() {
        super .awakeFromNib()
        layer.borderWidth = 1.0
        layer.borderColor = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)
        layer.shadowOpacity = 0.4
        layer.shadowColor = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)
    }
}
