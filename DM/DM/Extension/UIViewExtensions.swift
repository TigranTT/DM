//
//  UIViewExtensions.swift
//  DM
//
//  Created by Tigran Tshorokhyan on 10/7/18.
//  Copyright © 2018 Tigran Tshorokhyan. All rights reserved.
//

import Foundation
import UIKit

//extension to bind the view to keyboard.
//extension UIView {
//    func bindToKeyboard() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
//    }
//
//    @objc func keyboardWillChange(_ notification: NSNotification) {
//        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
//        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
//        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
//        let endingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        let deltaY = endingFrame.origin.y - startingFrame.origin.y
//
//        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
//            self.frame.origin.y += deltaY
//        }, completion: nil)
//    }
//}

//extension to hide the keyboard and share the showAlert function throughout the app.
extension UIViewController {
    
    //function to hide the keyboard when tapped outside the editable area
    func hideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.tapRecognizer())
    }
    
    private func tapRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector (self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
    
    //private function to show custom Alert
    func showAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
