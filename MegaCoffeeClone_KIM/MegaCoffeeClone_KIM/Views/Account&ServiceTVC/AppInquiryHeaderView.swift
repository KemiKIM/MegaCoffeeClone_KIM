//
//  MainHeaderView.swift
//  CollectionView_Code
//
//  Created by 김성호 on 2022/12/13.
//

import UIKit

class AppInquiryHeaderView: UITableViewHeaderFooterView {
    
    
    // MARK: [변수 선언]
    lazy var inquiryButton: UIButton = {
        let inquiry = UIButton(type: .system)
        
        inquiry.setTitleColor(UIColor.black, for: .normal)
        inquiry.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        inquiry.tag = 1
        
        inquiry.addTarget(self, action: #selector(inquiryButtonTapped(_sender:)), for: .touchUpInside)
        
        return inquiry
    }()
    
    
    
    lazy var historyButton: UIButton = {
        let history = UIButton(type: .system)

        history.setTitleColor(UIColor.black, for: .normal)
        history.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        history.tag = 2
        
        history.addTarget(self, action: #selector(historyButtonTapped(_sender:)), for: .touchUpInside)
        
        return history
        
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    
    lazy var underBar1: UIView = {
        let bar = UIView()
        
        bar.backgroundColor = .black
        bar.layer.cornerRadius = 3
        
        return bar
    }()
    
    lazy var underBar2: UIView = {
        let bar = UIView()
        
        bar.backgroundColor = .black
        bar.layer.cornerRadius = 3
        
        
        return bar
    }()
    
    
    lazy var underLine: UIView = {
        let line = UIView()
        
        line.backgroundColor = .systemGray
        
        return line
    }()
    
    
    
    
    
    // MARK: [Override]
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
       
        underBar1.isHidden = false
        underBar2.isHidden = true
        

        addSubView()
        layout()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        //configureLayout()
    }
    
    
    
    
    
    // MARK: [Action]
    @objc func inquiryButtonTapped(_sender: UIButton) {
        
        underBar1.isHidden = false
        inquiryButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        
        underBar2.isHidden = true
        historyButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
       
    }
    
    @objc func historyButtonTapped(_sender: UIButton) {
        
        underBar1.isHidden = true
        inquiryButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
        underBar2.isHidden = false
        historyButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        
    }
    
    
    
    // MARK: [Layout]
    func addSubView() {
        self.contentView.addSubview(self.stackView)
        
        self.contentView.addSubview(self.underBar1)
        self.contentView.addSubview(self.underBar2)
  
        
        self.contentView.addSubview(self.underLine)
        
        
        self.stackView.addArrangedSubview(self.inquiryButton)
        self.stackView.addArrangedSubview(self.historyButton)
        
    }
    
    
    func layout() {
        layoutStackView()
        
        layoutUnderBar1()
        layoutUnderBar2()
       
        
        layoutUnderLine()
    }
    
    func layoutStackView() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.4),
            self.stackView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.99)
            ])
    }
    
    func layoutUnderBar1() {
        self.underBar1.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.underBar1.leadingAnchor.constraint(equalTo: self.inquiryButton.titleLabel!.leadingAnchor),
            self.underBar1.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -5),
            
            self.underBar1.widthAnchor.constraint(equalTo: self.inquiryButton.titleLabel!.widthAnchor),
            self.underBar1.heightAnchor.constraint(equalToConstant: 5)
        ])
        
    }
    
    
    func layoutUnderBar2() {
        self.underBar2.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.underBar2.leadingAnchor.constraint(equalTo: self.historyButton.titleLabel!.leadingAnchor),
            self.underBar2.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -5),
            
            self.underBar2.widthAnchor.constraint(equalTo: self.historyButton.titleLabel!.widthAnchor),
            self.underBar2.heightAnchor.constraint(equalToConstant: 5)
        ])
        
    }

    
    func layoutUnderLine() {
        self.underLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.underLine.topAnchor.constraint(equalTo: self.stackView.bottomAnchor),
            //
            self.underLine.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.underLine.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.underLine.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.underLine.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.01)
        ])
    }
    
    
    
    
    
    
    
}
