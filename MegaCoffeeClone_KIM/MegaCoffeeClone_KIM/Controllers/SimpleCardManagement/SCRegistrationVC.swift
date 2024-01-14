//
//  SCRegistrationVC.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/23.
//

import UIKit

// MARK: [Enum]
enum cardList {
    case cardName([CardModel])
    case cardNumber([CardModel])
    case cardExpirationPeriod([CardModel])
    case cardPassword([CardModel])
    case cardDivision([CardModel])
}




class SCRegistrationVC: UIViewController {
    var dataSource = [cardList]()
    var keyHeight: CGFloat = 0.0
   
    
    
    // MARK: [변수 선언]
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CardNameTVC.self, forCellReuseIdentifier: CardNameTVC.identifier)
        tableView.register(CardNumberTVC.self, forCellReuseIdentifier: CardNumberTVC.identifier)
        tableView.register(CardExpirationPeriodTVC.self, forCellReuseIdentifier: CardExpirationPeriodTVC.identifier)
        tableView.register(CardPWTVC.self, forCellReuseIdentifier: CardPWTVC.identifier)
        tableView.register(CardDivisionTVC.self, forCellReuseIdentifier: CardDivisionTVC.identifier)
    
        
        tableView.separatorStyle = .none

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.sectionFooterHeight = 0
        
        tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        
        return tableView
    }()
    
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        sectionCell()
        
        layout()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
         
    }
    
  
    
    
    
    // MARK: [Keyboard]
    @objc func keyboardWillShow(_ sender: NSNotification) {
        
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + self.tableView.frame.height / 5, right: 0)
        }
        
    }
    
    @objc func keyboardWillHide(_ sender: NSNotification) {
        self.tableView.contentInset = .zero
    }
    
    
    
    
    
    
    
    
    
    // MARK: [Func]
    private func sectionCell() {
        let cardNa = CardModel()
        let sectionCardNa = cardList.cardName([cardNa])
        
        let cardNum = CardModel()
        let sectionCardNum = cardList.cardNumber([cardNum])
        
        let cardExp = CardModel()
        let sectionCardExp = cardList.cardExpirationPeriod([cardExp])
        
        let cardPW = CardModel()
        let sectionCardPW = cardList.cardPassword([cardPW])
        
        let cardDiv = CardModel()
        let sectionCardDiv = cardList.cardDivision([cardDiv])
        
        
        self.dataSource = [
            sectionCardNa, sectionCardNum, sectionCardExp, sectionCardPW, sectionCardDiv
        ]
        
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
    }
    
    
    
    
    
    
    
    


}



// MARK: [TableView - DataSource]
extension SCRegistrationVC: UITableViewDataSource {
    
    
    // height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        switch self.dataSource[indexPath.section] {
        
        case .cardName: return 130
        case .cardNumber: return 130
        case .cardExpirationPeriod: return 130
        case .cardPassword: return 130
        case .cardDivision: return 250
        
        
        }
      
    }
    
    // number of [section]
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    
    
    // number of [row section]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch self.dataSource[section] {
            
        case let .cardName(cardNames):
            return cardNames.count
        case let .cardNumber(cardNumbers):
            return cardNumbers.count
        case let .cardExpirationPeriod(cardExpirationPeriods):
            return cardExpirationPeriods.count
        case let .cardPassword(cardPasswords):
            return cardPasswords.count
        case let .cardDivision(cardDivisions):
            return cardDivisions.count
            
        }
        
        
    }
  

    // header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    
    // header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
 
    // header background
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.systemGray6
    }
     
     
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch self.dataSource[indexPath.section] {
       
            
        // (1) Card Name
        case .cardName:
            let cell = tableView.dequeueReusableCell(withIdentifier: CardNameTVC.identifier, for: indexPath) as! CardNameTVC
           
            
            cell.titleLabel.text = "카드 이름"
            cell.countLabel.text = "0/20"
            cell.bottomLabel.text = "카드이름은 간편카드 페이지에서 변경하실 수 있습니다"
            
            return cell
            
            
            
            
        // (2) Card Number
        case .cardNumber:
            let cell = tableView.dequeueReusableCell(withIdentifier: CardNumberTVC.identifier, for: indexPath) as! CardNumberTVC
            
            
            cell.titleLabel.text = "카드 번호"
            
            return cell
            
            
        // (3) Card Expiration Period
        case .cardExpirationPeriod:
            let cell = tableView.dequeueReusableCell(withIdentifier: CardExpirationPeriodTVC.identifier, for: indexPath) as! CardExpirationPeriodTVC
         
            
            cell.titleLabel.text = "카드 유효기간"
            cell.centerNonButton.setTitle("/", for: .normal)
            
            return cell
            
            
            
        // (4) Card PassWord
        case .cardPassword:
            let cell = tableView.dequeueReusableCell(withIdentifier: CardPWTVC.identifier, for: indexPath) as! CardPWTVC
            
            
            cell.titleLabel.text = "카드 비밀번호 (앞 2자리)"
            cell.starLabel1.text = "*"
            cell.starLabel2.text = "*"
            
            return cell
            
            
            
        // (5) Card Division
        case .cardDivision:
            let cell = tableView.dequeueReusableCell(withIdentifier: CardDivisionTVC.identifier, for: indexPath) as! CardDivisionTVC
            
           
            
            cell.titleLabel.text = "고객 구분"
            
            cell.personalCardButton1.setTitle("개인카드", for: .normal)
            cell.personalCardButton2.setTitle("개인카드", for: .normal)
            cell.corporationCardButton1.setTitle("법인카드", for: .normal)
            cell.corporationCardButton2.setTitle("법인카드", for: .normal)

            cell.registrationButton.setTitle("결제비밀번호 등록", for: .normal)
            cell.rejectRegistrationButton.setTitle("결제비밀번호 등록", for: .normal)
            
            
            return cell

        }
        
    }
}





// MARK: [TableView - Delegate]
extension SCRegistrationVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch self.dataSource[indexPath.section] {
        
        case .cardName: print("")
        case .cardNumber: print("")
        case .cardExpirationPeriod: print("")
        case .cardPassword: print("")
        case .cardDivision: print("")
        
        }
                
    }
     
}





// MARK: [Layout]
extension SCRegistrationVC {
    
    
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
       
        
        self.navigationItem.title = "간편카드 등록"
        self.navigationItem.largeTitleDisplayMode = .never
    }

    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        tableView.backgroundColor = .systemBackground
       
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
}




