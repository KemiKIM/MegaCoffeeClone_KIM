//
//  OrderHistroyVC.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/23.
//

import UIKit

// MARK: [Enum]
enum History {
    case week
    case month1
    case month3
    case total
}


class OrderHistroyVC: UIViewController {
    var history = History.week
    let headerView = OrderCustomHeaderView()
    
    
    // MARK: [var]
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WeekTVC.self, forCellReuseIdentifier: WeekTVC.identifier)
        tableView.register(Month1TVC.self, forCellReuseIdentifier: Month1TVC.identifier)
        tableView.register(Month3TVC.self, forCellReuseIdentifier: Month3TVC.identifier)
        tableView.register(TotalTVC.self, forCellReuseIdentifier: TotalTVC.identifier)
        
        tableView.rowHeight = 100
        
        
        return tableView
    }()
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(OrderCustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "OrderCustomHeaderView")
        
        layout()
    }
    
   
    
    
    
    
    // MARK: [Action]
    @objc func tapListButton(_ sender: UITableViewCell) {

        switch sender.tag {
            
        case 1: history = .week
        case 2: history = .month1
        case 3: history = .month3
        case 4: history = .total

        default: break
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
     
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]







// MARK: [TableView - DataSource]
extension OrderHistroyVC: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.white
    }
    
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "OrderCustomHeaderView") as? OrderCustomHeaderView else { return UITableViewHeaderFooterView() }
        
        
        view.week1Button.setTitle("1주일", for: .normal)
        view.month1Button.setTitle("1개월", for: .normal)
        view.month3Button.setTitle("3개월", for: .normal)
        view.totalButton.setTitle("전체", for: .normal)
        
        view.week1Button.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        view.month1Button.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        view.month3Button.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        view.totalButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        
        
        return view
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch history {
            
        case .week: return weekData.count
        case .month1: return 2
        case .month3: return 3
        case .total: return 4
            
        }
  
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch history {
            
        case .week:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeekTVC.identifier, for: indexPath) as? WeekTVC else { return UITableViewCell() }
            
            
            cell.stateLabel.text = weekData[indexPath.row].stateLabel
            cell.storeLabel.text = weekData[indexPath.row].storeLabel
            cell.menuLabel.text = weekData[indexPath.row].menuLabel
            cell.menuCountLabel.text = weekData[indexPath.row].menuCountLabel
            cell.centerLabel.text = "|"
            cell.dateLabel.text = weekData[indexPath.row].dateLabel

            
            return cell
            
            
            
        case .month1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Month1TVC.identifier, for: indexPath) as? Month1TVC else { return UITableViewCell() }
            
            
            //
            
            
            return cell
           
            
            
        case .month3:
            guard let cell3 = tableView.dequeueReusableCell(withIdentifier: Month3TVC.identifier, for: indexPath) as? Month3TVC else { return UITableViewCell() }
            
            
            //
            
            
            return cell3
            
            
            
        case .total:
            guard let cell3 = tableView.dequeueReusableCell(withIdentifier: TotalTVC.identifier, for: indexPath) as? TotalTVC else { return UITableViewCell() }
            
         
            //
            
            
            return cell3
        }
        
    }
    
}




// MARK: [TableView - Delegate]
extension OrderHistroyVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch history {
            
        case .week:
            let vc = OHDetailVC()
            self.navigationController?.pushViewController(vc, animated: false)
            
            
        case .month1: print("")
        case .month3: print("")
        case .total: print("")
            
            
        }
        
    }
    
    
}




// MARK: [Layout]
extension OrderHistroyVC {
    
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
       
        
        self.navigationItem.title = "주문내역"
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

