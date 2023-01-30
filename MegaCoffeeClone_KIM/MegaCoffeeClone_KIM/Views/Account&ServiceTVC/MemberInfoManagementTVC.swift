//
//  MemberInfoManagementTVC.swift.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/23.
//

import UIKit

class MemberInfoManagementTableViewCell: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
    
}
