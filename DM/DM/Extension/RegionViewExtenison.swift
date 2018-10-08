//
//  RegionViewExtenison.swift
//  DM
//
//  Created by Tigran Tshorokhyan on 10/7/18.
//  Copyright © 2018 Tigran Tshorokhyan. All rights reserved.
//

import Foundation
import UIKit

class RegionViewExtension: UIView {
    
    override func awakeFromNib() {
        super .awakeFromNib()
        layer.borderWidth = 1.0
        layer.borderColor = #colorLiteral(red: 0, green: 0.463690877, blue: 0.6937961578, alpha: 1)
        layer.shadowOpacity = 0.4
        layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
}
