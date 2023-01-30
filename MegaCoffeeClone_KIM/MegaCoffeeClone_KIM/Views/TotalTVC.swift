//
//  TotalTVC.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/23.
//

import UIKit

class TotalTVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
}

