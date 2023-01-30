//
//  UIColor+.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/27.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
