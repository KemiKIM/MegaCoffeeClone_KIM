//
//  MemberInfoManagementVC.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/27.
//

import UIKit

class MemberInfoManagementVC: UIViewController {
    var titleList = ["닉네임","생년월일\n\n휴대전화번호","회원탈퇴"]
    
    
    // MARK: [var]
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MemberInfoManagementTableViewCell.self, forCellReuseIdentifier: MemberInfoManagementTableViewCell.identifier)
       
        tableView.separatorStyle = .none

        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionFooterHeight = 0
        
        
        return tableView
    }()
    
    
    
    

    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "회원정보 관리"
    }

   

    
    
// MARK: [Class End]
        
}

// MARK: [Class End]







// MARK: [TableView - DataSource]
extension MemberInfoManagementVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return titleList.count
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemberInfoManagementTableViewCell.identifier) else { return UITableViewCell() }

        
        cell.textLabel?.text = titleList[indexPath.section]
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.textColor = .black
        cell.selectionStyle = .none
        
        
        // 닉네임
        if indexPath.section == 0 {
            
            let img = UIImageView(image: UIImage(systemName: "arrow.2.circlepath"))
            img.tintColor = .black
            cell.accessoryView = img
            cell.detailTextLabel?.text = "Mega"
            
            
        // 생년월일, 휴대전화번호
        } else if indexPath.section == 1 {
            cell.detailTextLabel?.text = "0000년 00월 00일\n\n010-1234-5678"
            cell.detailTextLabel?.numberOfLines = 0
            cell.isUserInteractionEnabled = false
            
            
            
        // 회원탈퇴
        } else if indexPath.section == 2 {
            let img = UIImageView(image: UIImage(systemName: "chevron.right"))
            img.tintColor = .black
            cell.accessoryView = img
            
            
        }

        return cell
    }
    
}






// MARK: [TableView - Delegate]
extension MemberInfoManagementVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath.section {
        
        // 닉네임
        case 0 :
            let vc = AlertNickNameVC()
            vc.modalPresentationStyle = .overFullScreen
            
            self.present(vc, animated: false) {
                vc.layoutNickName()
            }
            
        // 생년월일, 휴대전화번호
        case 1:
            print("None")
            
            
        // 회원탈퇴
        case 2:
            let vc = UnRegisterVC()
            self.navigationController?.pushViewController(vc, animated: true)
            
            
            
        default:
            fatalError()
        }
        
        
    }
    
}






// MARK: [Layout]
extension MemberInfoManagementVC {
    private func layout() {
        self.view.backgroundColor = .systemBackground
        
        naviCustom()
        layoutTableView()
    }
    
    // navi
    private func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backItem?.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        self.navigationItem.largeTitleDisplayMode = .never
    }

    
    
    
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        tableView.backgroundColor = .systemBackground
        tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
        
        
    }
    
}


