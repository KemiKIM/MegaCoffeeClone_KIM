//
//  UIViewController+Ext.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2023/01/04.
//

import UIKit

extension UIViewController {
    
    
    // MARK: [Keyboard]
    func hideKeyboardWhenTappedBackground() {
         let tapEvent = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
         tapEvent.cancelsTouchesInView = false
         view.addGestureRecognizer(tapEvent)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
}
