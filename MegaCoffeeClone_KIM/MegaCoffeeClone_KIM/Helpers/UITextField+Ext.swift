//
//  UITextField+Ext.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/23.
//

import UIKit

extension UITextField {
    
    // MARK: Keyboard Toolbar
    func addDoneButtonOnKeyboard() {
        let doneToolBar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolBar.barStyle = .default
        
        
        let up: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:
                                                                    "chevron.up"), style: .plain, target: self, action: #selector(previousAction(_:)))
        let down: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:
                                                                    "chevron.down"), style: .plain, target: self, action: #selector(nextAction(_:)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
       
        let done: UIBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        
        
        let items = [up, down, flexSpace, done]
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        
        self.inputAccessoryView = doneToolBar
    }
    
    
    
    
    
    // MARK: [Action] Keyboard Toolbar
    @objc func previousAction(_ sender: UIButton) {
        self.becomeFirstResponder()
        print("Up Tapped")
    }
    
    @objc func nextAction(_ sender: UIButton) {
        self.becomeFirstResponder()
        print("Down Tapped")
    }
  
    
    
    @objc func doneButtonAction() {
        self.endEditing(true)
        print("완료버튼 Tapped")
    }
    
    
    
}



