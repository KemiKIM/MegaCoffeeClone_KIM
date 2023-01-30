//
//  AlertLogoutVC.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2023/01/04.
//

import UIKit

final class AlertLogoutVC: CustomAlertBaseViewController {
    
    
    // MARK: [var]
    lazy var logoutStackView: UIStackView = {
        let stackView = UIStackView()
        
        
        stackView.addArrangedSubview(self.logoutTitleLabel)
        stackView.addArrangedSubview(self.logoutInfoLabel)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        stackView.clipsToBounds = true
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 7
        stackView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        
        return stackView
    }()
    
    
    
    private lazy var logoutTitleLabel: UILabel = {
        let title = UILabel(frame: .zero)
        
        title.text = "로그아웃"
        title.font = .boldSystemFont(ofSize: 20)
        title.textAlignment = .center
        
        return title
    }()
    
    
    
    private lazy var logoutInfoLabel: UILabel = {
        let logoutInfo = UILabel()
        
        logoutInfo.text = "로그아웃 하시겠습니까?"
        logoutInfo.textAlignment = .center
        
        return logoutInfo
    }()
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]






// MARK: [Layout]
extension AlertLogoutVC {
    
    @objc func layoutLogout() {
        layoutLogoutOverride()
        layoutLogStackView()
    }
    
    // Override
    private func layoutLogoutOverride() {
        self.contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.23).isActive = true
        
        self.confirmBtn.setTitle("로그아웃", for: .normal)
    }
    
    // StackView
    private func layoutLogStackView() {
        self.contentView.addSubview(self.logoutStackView)
        
        self.logoutStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.logoutStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 30),
            self.logoutStackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.logoutStackView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.45)
        ])
    }
    
    
    
}
