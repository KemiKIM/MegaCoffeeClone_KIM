//
//  EventAndNoticeVC.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/23.
//

import UIKit

// MARK: [Enum]
enum NewNotice {
    case event
    case notice
    case rankingEvent
}


final class EventAndNoticeVC: UIViewController {
    var newNotice = NewNotice.event
    
    
    // MARK: [var]
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EventAndRankingEventTVC.self, forCellReuseIdentifier: EventAndRankingEventTVC.identifier)
        tableView.register(NoticeTVC.self, forCellReuseIdentifier: NoticeTVC.identifier)
        tableView.register(EventCustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "EventCustomHeaderView")
        
        tableView.sectionHeaderTopPadding = 0
        
        
        return tableView
    }()
    
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    
 
    
    
    
    
    
    
    
    
    // MARK: [Action]
    @objc func tapListButton(_ sender: UITableViewCell) {
        
        switch sender.tag {
            
        case 1: newNotice = .event
        case 2: newNotice = .notice
        case 3: newNotice = .rankingEvent
            
        default: break
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
            self.tableView.scrollToRow(at: IndexPath(row: NSNotFound, section: 0), at: .top, animated: false)
            self.navigationController?.navigationBar.sizeToFit()
        }
        
    }
    
    
    
    // MARK: [Func]
    @objc func moveToNotice() {
        let sender = UITableViewCell()
        
        sender.tag = 2
        newNotice = .notice
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    
    
    
    
// MARK: [Class End]

}

// MARK: [Class End]






// MARK: [TableView - DataSource]

extension EventAndNoticeVC: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.systemBackground
    }
    
    
    
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "EventCustomHeaderView") as? EventCustomHeaderView else { return UITableViewHeaderFooterView() }
        
        
        view.eventButton.setTitle("이벤트", for: .normal)
        view.noticeButton.setTitle("공지사항", for: .normal)
        view.rankingEventButton.setTitle("랭킹이벤트", for: .normal)
        
        view.eventButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        view.noticeButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        view.rankingEventButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        
        
        return view
    }
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch newNotice {
            
        case .event: return 350
        case .notice: return 90
        case .rankingEvent: return 350
            
        }
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch newNotice {
            
        case .event: return eventModel.count
        case .notice: return noticeModel.count
        case .rankingEvent: return rankingEventModel.count
            
        }
  
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch newNotice {
            
        case .event:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EventAndRankingEventTVC.identifier, for: indexPath) as? EventAndRankingEventTVC else { return UITableViewCell() }
            
            
            cell.imgView = eventModel[indexPath.row].titleImgView
            cell.titleLabel.text = eventModel[indexPath.row].titleLabel
            cell.subTitleLabel.text = eventModel[indexPath.row].dateLabel
            
            
            return cell
            
            
            
        case .notice:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NoticeTVC.identifier, for: indexPath) as? NoticeTVC else { return UITableViewCell() }
            
            
            cell.titleLabel.text = noticeModel[indexPath.row].titleLabel
            cell.subTitleLabel.text = noticeModel[indexPath.row].dateLabel
            
            
            return cell
            
            
            
        case .rankingEvent:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EventAndRankingEventTVC.identifier, for: indexPath) as? EventAndRankingEventTVC else { return UITableViewCell() }
            
            
            cell.imgView = rankingEventModel[indexPath.row].titleImgView
            cell.titleLabel.text = rankingEventModel[indexPath.row].titleLabel
            cell.subTitleLabel.text = rankingEventModel[indexPath.row].dateLabel
            
            
            return cell
        }
        
    }
    
    
}



// MARK: [TableView - Delegate]
extension EventAndNoticeVC: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch newNotice {
            
        case .event:
            let vc = EANDetailVC()
            
            vc.titleLabel.text = eventModel[indexPath.row].titleLabel
            vc.dateLabel.text = eventModel[indexPath.row].dateLabel
            
            self.navigationController?.pushViewController(vc, animated: false)
            
            
            
        case .notice:
            let vc = EANDetailVC()
            
            vc.titleLabel.text = noticeModel[indexPath.row].titleLabel
            vc.dateLabel.text = noticeModel[indexPath.row].dateLabel
            
            self.navigationController?.pushViewController(vc, animated: false)
            
            
            
        case .rankingEvent:
            let vc = EANDetailVC()
            
            vc.titleLabel.text = rankingEventModel[indexPath.row].titleLabel
            vc.dateLabel.text = rankingEventModel[indexPath.row].dateLabel
            
            self.navigationController?.pushViewController(vc, animated: false)
            
        }
        
    }
    
    
}








// MARK: [Layout]

extension EventAndNoticeVC {
    
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
        
        
        self.navigationItem.title = "새소식"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
        
            .font: UIFont.systemFont(ofSize: 24, weight: .bold)
        ]
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = titleAttributes
    }
    
    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    
}

