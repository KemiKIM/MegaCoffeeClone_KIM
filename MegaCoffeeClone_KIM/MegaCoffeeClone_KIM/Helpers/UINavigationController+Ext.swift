//
//  UINavigationController+Ext.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/31.
//

import UIKit

extension UINavigationController {
    
    // MARK: Navigation Clousure
    func pushViewController(viewController: UIViewController, animated:Bool = true,  completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    func popViewControllerWithHandler(animated:Bool = true, completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: animated)
        CATransaction.commit()
    }

}
