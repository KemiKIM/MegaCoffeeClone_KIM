//
//  PermissionSettingVC.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/27.
//

import UIKit

final class PermissionSettingVC: UIViewController {
   var permissionList = ["위치 정보 서비스 이용약관 동의","마케팅 활용 동의"]
    
    // MARK: [var]
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        
        
        return tableView
    }()
    
    
  
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    
    
    
    // MARK: [Action]
    @objc func switchChanged(_ sender: UISwitch) {
        print(sender.tag)
        print(sender.isOn ? "ON" : "OFF")
    }

    
    
    

// MARK: [Class End]
            
}

// MARK: [Class End]







// MARK: [TableView - DataSource]
extension PermissionSettingVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return permissionList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        
        
        cell.selectionStyle = .none
        cell.textLabel?.text = permissionList[indexPath.row]
        
        
        let switchView = UISwitch()
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        cell.accessoryView = switchView
        
        
        return cell
    }
    
    
    
    
    
}




// MARK: [TableView - Delegate]
extension PermissionSettingVC: UITableViewDelegate {

}









// MARK: [Layout]
extension PermissionSettingVC {
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
       
        self.navigationItem.title = "권한 설정"
        self.navigationItem.largeTitleDisplayMode = .never
    }

    
    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        tableView.backgroundColor = .systemBackground
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
        
    }
    
}


