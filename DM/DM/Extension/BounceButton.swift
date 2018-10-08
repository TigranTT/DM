//
//  BounceButton.swift
//  DM
//
//  Created by Tigran Tshorokhyan on 10/7/18.
//  Copyright © 2018 Tigran Tshorokhyan. All rights reserved.
//

import Foundation
import UIKit

class BounceButton: CustomButton {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
        
        super.touchesBegan(touches, with: event)
    }
}

