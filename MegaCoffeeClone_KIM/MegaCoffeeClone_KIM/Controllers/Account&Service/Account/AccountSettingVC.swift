//
//  AccountSettingVC.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/27.
//

import UIKit

class AccountSettingVC: UIViewController {
    var accountList = ["회원정보 관리","권한설정", "로그아웃"]
    
    // MARK: [var]
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.separatorStyle = .none
        
        tableView.rowHeight = 60
        tableView.sectionFooterHeight = 0
        
        
        return tableView
    }()
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    

    
    
    
    
// MARK: [Class End]
        
}

// MARK: [Class End]







// MARK: [TableView - DataSource]
extension AccountSettingVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return accountList.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
  
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
 
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.systemGray6
    }
     
     
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        
        
        cell.selectionStyle = .none
        cell.textLabel?.text = accountList[indexPath.section]
        cell.accessoryType = .disclosureIndicator
        
        
        let img = UIImageView(image: UIImage(systemName: "chevron.right"))
        img.tintColor = .black
        cell.accessoryView = img
        
        
        return cell
    }
    
}








// MARK: [TableView - Delegate]
extension AccountSettingVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
            
        // 회원정보 관리
        case 0 :
            let vc = MemberInfoManagementVC()
            self.navigationController?.pushViewController(vc, animated: false)
            
            
            
        // 권한설정
        case 1:
            let vc = PermissionSettingVC()
            self.navigationController?.pushViewController(vc, animated: false)
            
            
            
        // 로그아웃
        case 2:
            
            let vc = AlertLogoutVC()
            vc.modalPresentationStyle = .overFullScreen
            
            self.present(vc, animated: false) {
                vc.layoutLogout()
            }
            
            
            
        default:
            fatalError()
        }
        
    }
    
}







// MARK: [Layout]
extension AccountSettingVC {
    func layout() {
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
        
        self.navigationItem.title = "계정 설정"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let titleAttributes: [NSAttributedString.Key: Any] = [ .font: UIFont.systemFont(ofSize: 23, weight: .bold) ]
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = titleAttributes
        
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






