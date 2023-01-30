//
//  MainViewController.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/23.
//

import UIKit

class MainViewController: UIViewController {
    var dummy = MainModel.sectionHeader
    let urlBulkPurchaseOfVouchers = "https://event.multicon.co.kr/survey/megacoffee_b2b?pid=7Y6nRsuYxwbrGE%2BK13zbGQ%3D%3D&curr_time=1666352003&uid=7822996253187061"
   
    
    
    
    
    // MARK: [var] [0] : Frame
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        
        
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.bounces = false
        scrollView.alwaysBounceVertical = true
        
        
        return scrollView
    }()
    
    private lazy var contentView = UIView()
    
    
    
    // MARK: [var] [1] : Account & Service
    private lazy var titleView = UIView()
    
    private lazy var accountSettingButton: UIButton = {
        let left = UIButton(type: .system)
        
        
        left.setTitle("계정설정", for: .normal)
        left.setTitleColor(UIColor.black, for: .normal)
        
        left.addTarget(self, action: #selector(moveToAccountSettingVC(_:)), for: .touchUpInside)
        
        
        return left
    }()
    
    
    private lazy var centerLabel: UILabel = {
        let center = UILabel()
        
        
        center.text = "|"
        center.textColor = .systemGray
        center.font = .systemFont(ofSize: 15)
        
        
        return center
    }()
    

    private lazy var ServiceCenterButton: UIButton = {
        let right = UIButton(type: .system)
        
        
        right.setTitle("고객센터", for: .normal)
        right.setTitleColor(UIColor.black, for: .normal)
        
        right.addTarget(self, action: #selector(moveToServieCenterVC(_:)), for: .touchUpInside)
        
        
        return right
    }()
    
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.addArrangedSubview(accountSettingButton)
        stackView.addArrangedSubview(centerLabel)
        stackView.addArrangedSubview(ServiceCenterButton)
        
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        
        
        return stackView
    }()
    
    
    
    // MARK: [var] [2]: NickName View
    private lazy var titleSubView = UIView()
    
    private lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        
        
        label.text = "Mega 님"
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    
    
    // MARK: [var] [3]: List
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        
        tableView.sectionFooterHeight = 25
        
        
        return tableView
    }()
    
    
    
    
    
    
    
    

   
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    
    
    
    

    // MARK: [Action] Account & Service Button
    @objc func moveToAccountSettingVC(_ sender: UIButton) {
        customDelayIndicator(0.3) {
            let accountVC = AccountSettingVC()
            //accountVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(accountVC, animated: false)
        }
    }
    
    
    @objc func moveToServieCenterVC(_ sender: UIButton) {
        customDelayIndicator(0.3) {
            let serviceVC = ServiceCenterVC()
            //serviceVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(serviceVC, animated: false)
        }
    }
    
    
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]









// MARK: [TableView - DataSource]
extension MainViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return dummy.count
      }


    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dummy[section]
    }
    

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
        header.textLabel?.textColor = .black
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 { return MainModel.sectionList1.count }
        else if section == 1 { return MainModel.sectionList2.count }
        else if section == 2 { return MainModel.sectionList3.count }
        else if section == 3 { return MainModel.sectionList4.count }
        else { return 0 }
        
    }
    


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }

        if indexPath.section == 0 {
            cell.textLabel?.text = "\(MainModel.sectionList1[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(MainModel.sectionList2[indexPath.row])"
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "\(MainModel.sectionList3[indexPath.row])"
        } else if indexPath.section == 3 {
            cell.textLabel?.text = "\(MainModel.sectionList4[indexPath.row])"
        } else {
            return UITableViewCell()
        }
        
        return cell
    }
    
}






// MARK: [TableView - Delegate]
extension MainViewController: UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        // 멤버쉽
        case 0:
            if MainModel.sectionList1[indexPath.row] == "스탬프" {
               alertOK(message: "스탬프 Tab으로 이동합니다.")
            } else {
                alertOK(message: "쿠폰 Tab으로 이동합니다.")
            }
            
            
            
        // 주문
        case 1:
            if MainModel.sectionList2[indexPath.row] == "메가 오더" {
                alertOK(message: "메가오더 Tab으로 이동합니다.")
            }
            
            
            else if MainModel.sectionList2[indexPath.row] == "주문 내역" {
                customDelayIndicator(0.3) {
                    let vc = OrderHistroyVC()
                    vc.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(vc, animated: false)
                }
                
                
            }
            
            else if MainModel.sectionList2[indexPath.row] == "선물하기" {
                alertOK(message: "선물하기 Tab으로 이동합니다.")
            }
            
            else if MainModel.sectionList2[indexPath.row] == "메가선불카드" {
                alertOK(message: "메가선불카드 Tab은 준비중입니다.")
            }
            
            else if MainModel.sectionList2[indexPath.row] == "간편카드 관리" {
                customDelayIndicator(0.3) {
                    let vc = SimpleCardManagementVC()
                    //vc.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(vc, animated: false)
                }
            }
            
            else if MainModel.sectionList2[indexPath.row] == "상품권 대량 구매 신청" {
                if let url = URL(string: urlBulkPurchaseOfVouchers) { UIApplication.shared.open(url, options: [:]) }
            }
            
            
            
        // 새소식
        case 2:
            if MainModel.sectionList3[indexPath.row] == "이벤트" {
                customDelayIndicator(0.3) {
                    let vc = EventAndNoticeVC()
                    //vc.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(vc, animated: false)
                }
            } else {
                customDelayIndicator(0.3) {
                    let vc = EventAndNoticeVC()
                    //vc.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(viewController: vc,
                                                                  animated: false,
                                                                  completion: {
                        vc.moveToNotice()
                        NotificationCenter.default.post(name: MainViewController.noticeCustomHeader, object: nil)
                    })
                }
            }
            
            
        // 약관 및 정책
        case 3:
            customDelayIndicator(0.3) {
                let vc = TermsOfServiceVC()
                //vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: false)
            }
            
            
    
        // default
        default: print("MoreViewController - didSelectRowAt")
        }
        
    }
}




// MARK: [ (S) Protocol] - EventAndNoticeVC
extension MainViewController {
    static let noticeCustomHeader = Notification.Name(rawValue: "noticeCustomHeader")
}










// MARK: [Layout]
extension MainViewController {
    
    private func layout() {
        
        layout0Frame()
        layout1AccountAndServiceButton()
        layout2NickName()
        layoutTableView()
        
    }
    
    
    
    
    
    private func layout0Frame() {
        self.view.backgroundColor = .systemBackground
        layoutScrollView()
        layoutContentView()
    }
    
    
    private func layout1AccountAndServiceButton() {
        layoutTitleView()
        layoutStackView()
    }
    
    
    private func layout2NickName() {
        layoutTitleSubView()
        layoutNicknameLabel()
    }
    
    
    
    
    
    
    
    // ScrollView
    private func layoutScrollView() {
        self.view.addSubview(self.scrollView)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // ContentView
    private func layoutContentView() {
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.contentView.heightAnchor.constraint(equalToConstant: 870)
        ])
    }
    
    // TitleView
    private func layoutTitleView() {
        self.contentView.addSubview(self.titleView)
        
        self.titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.titleView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.titleView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.titleView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    

    // StackView
    private func layoutStackView() {
        self.titleView.addSubview(self.topStackView)
        
        self.topStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topStackView.leadingAnchor.constraint(equalTo: self.titleView.leadingAnchor),
            self.topStackView.bottomAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 5)
        ])
    }
    
    // TitleSubView
    private func layoutTitleSubView() {
        self.contentView.addSubview(self.titleSubView)
        
        self.titleSubView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleSubView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor),
            self.titleSubView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 15),
            self.titleSubView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.titleSubView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    // NicknameLabel
    private func layoutNicknameLabel() {
        self.titleSubView.addSubview(self.nicknameLabel)
        
        self.nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nicknameLabel.leadingAnchor.constraint(equalTo: self.titleSubView.leadingAnchor),
            self.nicknameLabel.bottomAnchor.constraint(equalTo: self.titleSubView.bottomAnchor)
        ])
    }
    
    
    // TableView
    private func layoutTableView() {
        self.contentView.addSubview(self.tableView)
        
        self.tableView.backgroundColor = .white

        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.self.titleSubView.bottomAnchor, constant: 10),
            self.tableView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        
    }
    

    
    
}


