//
//  OHDetailVC.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/23.
//

import UIKit

enum orderDetailList {
    case detail1([OrderDetailModel])
    case detail2([OrderDetailModel])
    case detail3([OrderDetailModel])
    case detail4([OrderDetailModel])
}


final class OHDetailVC: UIViewController {
    var dataSource = [orderDetailList]()
    
    
    // MARK: [var]
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(OHDetail1TVC.self, forCellReuseIdentifier: OHDetail1TVC.identifier)
        tableView.register(OHDetail2TVC.self, forCellReuseIdentifier: OHDetail2TVC.identifier)
        tableView.register(OHDetail3TVC.self, forCellReuseIdentifier: OHDetail3TVC.identifier)
        tableView.register(OHDetail4TVC.self, forCellReuseIdentifier: OHDetail4TVC.identifier)

        tableView.sectionFooterHeight = 0
        
        
        return tableView
    }()
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionCell()
        
        layout()
    }
    
    
    
    
    
    // MARK: [Func]
    private func sectionCell() {
        let detailNum1 = OrderDetailModel()
        let this1 = orderDetailList.detail1([detailNum1])
        
        let detailNum2 = OrderDetailModel()
        let this2 = orderDetailList.detail2([detailNum2])
        
        let detailNum3 = OrderDetailModel()
        let this3 = orderDetailList.detail3([detailNum3])
        
        let detailNum4 = OrderDetailModel()
        let this4 = orderDetailList.detail4([detailNum4])
        
        
        
        self.dataSource = [
            this1, this2, this3, this4
        ]
        
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]








// MARK: [TableView - DataSource]
extension OHDetailVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.systemGray6
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch self.dataSource[indexPath.section] {
            
        case .detail1: return 300
        case .detail2: return 130
        case .detail3: return 170
        case .detail4: return 80
            
        }
        
    }
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch self.dataSource[section] {
            
        case let .detail1(num1):
            return num1.count
        case let .detail2(num2):
            return num2.count
        case let .detail3(num3):
            return num3.count
        case let .detail4(num4):
            return num4.count
        }
        
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch self.dataSource[indexPath.section] {
            
        case .detail1:
            guard let cell1 = tableView.dequeueReusableCell(withIdentifier: OHDetail1TVC.identifier, for: indexPath) as? OHDetail1TVC else { return UITableViewCell() }
            
            
            cell1.label1.text = weekData[indexPath.row].storeLabel
            cell1.label2.text = weekData[indexPath.row].orderNumberLabel
            cell1.label3.text = weekData[indexPath.row].detailDateLabel
            
            
            return cell1
            
            
            
        case .detail2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OHDetail2TVC.identifier, for: indexPath) as? OHDetail2TVC else { return UITableViewCell() }
            
            
            //
            
            
            return cell
            
            
            
        case .detail3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OHDetail3TVC.identifier, for: indexPath) as? OHDetail3TVC else { return UITableViewCell() }
            
            
            //
            
            
            return cell
            
            
            
        case .detail4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OHDetail4TVC.identifier, for: indexPath) as? OHDetail4TVC else { return UITableViewCell() }
            
            
            //
            
            
            return cell
        }
    }
    
}



// MARK: [TableView - Delegate]
extension OHDetailVC: UITableViewDelegate {
    
}






// MARK: [Layout]
extension OHDetailVC {
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        naviCustom()
        
        layoutTableView()
        
    }
    
    // Navi Custom
    private func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
       
        
        self.navigationItem.title = "주문 내역"
        self.navigationItem.largeTitleDisplayMode = .never
    }

    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        tableView.backgroundColor = .systemBackground
        tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
    
    
        
}


