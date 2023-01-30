//
//  AppInquiryHistoryTVC.swift
//  CollectionView_Code
//
//  Created by 김성호 on 2022/12/13.
//


import UIKit

class AppInquiryHistoryTVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        
        /*
        addSubView()
        layout()
    */
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]




