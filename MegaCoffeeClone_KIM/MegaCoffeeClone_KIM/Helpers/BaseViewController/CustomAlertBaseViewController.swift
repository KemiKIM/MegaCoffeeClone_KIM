//
//  CustomAlertBaseViewController.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/30.
//

import UIKit

class CustomAlertBaseViewController: UIViewController {
    let customBrownColor = UIColor(r: 74, g: 44, b: 42)
    
    
    
    
    // MARK: [var] [0]: Frame
    private lazy var backViewBtn: UIButton = {
        let back = UIButton()
        
        back.alpha = 0.5
        
        back.addTarget(self, action: #selector(cancelTapped(sender:)), for: .touchUpInside)
        
        return back
    }()
    
    
    // MARK: [var] [1]: Center
    lazy var contentView: UIView = {
        let content = UIView()
        
        
        content.alpha = 1
        content.layer.cornerRadius = 8
        
        
        return content
    }()
    
    
    
    // MARK: [var] [2]: Bottom
    private lazy var bottomStackView: UIStackView = {
        let bottom = UIStackView()
        
        
        bottom.addArrangedSubview(self.cancelBtn)
        bottom.addArrangedSubview(self.confirmBtn)
        
        bottom.distribution = .fillEqually
        
        bottom.clipsToBounds = true
        bottom.layer.masksToBounds = true
        bottom.layer.cornerRadius = 8
        bottom.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        
        return bottom
    }()

    
    
    private lazy var cancelBtn: UIButton = {
        let cancel = UIButton()
        
        
        cancel.setTitle("취소", for: .normal)
        cancel.setTitleColor(customBrownColor, for: .normal)
        
        cancel.addTarget(self, action: #selector(cancelTapped(sender:)), for: .touchUpInside)
        
        
        return cancel
    }()
    
    
    
    
    lazy var confirmBtn: UIButton = {
        let confirm = UIButton()
        
        confirm.setTitleColor(.white, for: .normal)
        
        return confirm
    }()
    
    

    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    
    
    // MARK: [Action]
    @objc func cancelTapped(sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]









// MARK: [Layout]
extension CustomAlertBaseViewController {
    
    private func layout() {
        layoutBackViewButton()
        layoutContentView()
        layoutBottomStackView()
    }
    
    
    
    
    // BackView Btn
    private func layoutBackViewButton() {
        self.view.addSubview(self.backViewBtn)
        
        self.backViewBtn.backgroundColor = .black
        
        self.backViewBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.backViewBtn.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backViewBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backViewBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.backViewBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    
    
    
    
    // ContentView
    @objc func layoutContentView() {
        self.view.addSubview(self.contentView)
        
        self.contentView.backgroundColor = .white
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85)
        ])
    }
    
    
    @objc func layoutBottomStackView() {
        self.contentView.addSubview(self.bottomStackView)
        
        self.cancelBtn.backgroundColor = .systemGray6
        self.confirmBtn.backgroundColor = customBrownColor
        
        self.bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.bottomStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.bottomStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.bottomStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.bottomStackView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.25)
            
        ])
    }
    
    
}
