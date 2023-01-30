//
//  UIViewController+IndicatorVIew.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2023/01/04.
//

import UIKit

extension UIViewController {
    
    // MARK: [Custom Delay Indicator]
    func customDelayIndicator(_ delay: TimeInterval, callback: @escaping ()->()) {
        let activityIndicator = CustomIndicatorView(view: view,
                                                    navigationController: self.navigationController,
                                                    tabBarController: nil)
        let delay = delay * Double(NSEC_PER_SEC)
        let popTime = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        
        
        activityIndicator.showActivityIndicator()
        DispatchQueue.main.asyncAfter(deadline: popTime, execute: {
            callback()
            activityIndicator.stopActivityIndicator()
        })
    }
    
    
    // MARK: [Delay]
    func delay(_ delay: TimeInterval, callback: @escaping ()->()) {
        let delay = delay * Double(NSEC_PER_SEC)
        let popTime = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC);
        DispatchQueue.main.asyncAfter(deadline: popTime, execute: {
            callback()
        })
    }
    
    
    
    
    // MARK: [Indicator]
    struct CustomIndicatorView {
        
        let view: UIView
        let backgroundView = UIView()
        let viewForShowIndicator = UIView()
        let ShowIndicatorView = UIActivityIndicatorView()
        
        
        let navigationController: UINavigationController?
        let tabBarController: UITabBarController?
        
        var navigationBarHeight: CGFloat { return navigationController?.navigationBar.frame.size.height ?? 0.0 }
        var tabBarHeight: CGFloat { return tabBarController?.tabBar.frame.height ?? 0.0 }
        

        
        // Show Activity Indicator
        func showActivityIndicator() {
            
            
            // Background
            backgroundView.frame = CGRect(x: 0,
                                          y: 0,
                                          width: UIScreen.main.bounds.size.width,
                                          height: UIScreen.main.bounds.size.height)
            backgroundView.backgroundColor = .white
            
            
            
            
            // View For Activity Indicator
            viewForShowIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 80, height: 80)
            viewForShowIndicator.center = CGPoint(x: self.view.frame.size.width / 2.0,
                                                      y: (self.view.frame.size.height - tabBarHeight - navigationBarHeight) / 2.0)
            viewForShowIndicator.layer.cornerRadius = 10
            viewForShowIndicator.backgroundColor = .systemGray4
            
            
            
            
            // Activity Indicator
            ShowIndicatorView.center = CGPoint(x: viewForShowIndicator.frame.size.width / 2.0,
                                                   y: (viewForShowIndicator.frame.size.height) / 2.0)
            
            
            ShowIndicatorView.hidesWhenStopped = false
            ShowIndicatorView.style = .large
            ShowIndicatorView.color = .white
            
        
            
            // Add
            view.addSubview(backgroundView)
            backgroundView.addSubview(viewForShowIndicator)
            viewForShowIndicator.addSubview(ShowIndicatorView)
            
            ShowIndicatorView.startAnimating()
        }
        
        
        
        
        
        // Stop Activity Indicator
        func stopActivityIndicator() {
            backgroundView.removeFromSuperview()
            viewForShowIndicator.removeFromSuperview()
            ShowIndicatorView.removeFromSuperview()
            ShowIndicatorView.stopAnimating()
        }
        
        
        
        
        
        
    }
    
}
