//
//  ServiceCenterVC.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/27.
//

import UIKit

class ServiceCenterVC: UIViewController {
    let customBrownColor = UIColor(r: 74, g: 44, b: 42)
    
    // MARK: [var] [0] : Frame
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        
        
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.alwaysBounceVertical = true
        
        
        return scrollView
    }()
    
    private lazy var contentView = UIView()
    
    
    
    // MARK: [var] [1] : Hello & Calling
    private lazy var helloLabel: UILabel = {
        let hello = UILabel()
        
        
        hello.text = "안녕하세요 \n메가MGC커피 고객센터입니다."
        hello.numberOfLines = 2
        hello.font = .boldSystemFont(ofSize: 23)
        
        
        return hello
    }()
    
    
    private lazy var callingButton: UIButton = {
        let call = UIButton(type: .system)
        
        
        call.setTitle("1588-8298", for: .normal)
        call.setTitleColor(.black, for: .normal)
        call.titleLabel?.font = .boldSystemFont(ofSize: 30)
        
        call.addTarget(self, action: #selector(callingButtonTapped(_:)), for: .touchUpInside)
        
        
        return call
    }()

    
    
    // MARK: [var] [2] : Time & Info Label
    private lazy var timeLabel: UILabel = {
        let time = UILabel()
        
        
        time.text = "운영시간 평일 9:00~18:00 (점심시간 12:00~13:00)"
        time.font = .systemFont(ofSize: 16)
        
        
        return time
    }()
    
    private lazy var inforLabel: UILabel = {
        let info = UILabel()
        
        
        info.text = "운영시간 이외에는 메가MGC커피 고객센터나 \n모바일 앱(APP) 관련 문의를 이용해주세요."
        info.numberOfLines = 2
        info.font = .systemFont(ofSize: 16)
        
        
        return info
    }()
    
    
    
    // MARK: [var] [3] : ServiceCenterLink & AppInquiry Button
    private lazy var serviceCenterLinkButton: UIButton = {
        let link = UIButton(type: .system)
        
        
        link.setTitle("메가MGC커피 고객센터 바로가기", for: .normal)
        link.setTitleColor(customBrownColor, for: .normal)
        link.titleLabel?.font = .boldSystemFont(ofSize: 18)
        
        link.layer.cornerRadius = 7
        
        link.addTarget(self, action: #selector(serviceCenterLinkButtonTapped(_:)), for: .touchUpInside)
        
        
        return link
    }()
   
    
    private lazy var appInquiryButton: UIButton = {
        let inquiry = UIButton(type: .system)
        
        
        inquiry.setTitle("모바일 앱(APP)관련 문의 남기기", for: .normal)
        inquiry.setTitleColor(.white, for: .normal)
        inquiry.titleLabel?.font = .boldSystemFont(ofSize: 18)
        inquiry.layer.cornerRadius = 7
        
        inquiry.addTarget(self, action: #selector(appInquiryButtonTapped), for: .touchUpInside)
        
        
        return inquiry
    }()
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.layout()
        
       
    }
    

    
    
    
    // MARK: [Action]
    
    private func callNumber(phoneNumber: String) {
      if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
    }
    
    
    
    
    @objc private func callingButtonTapped(_ sender: UIButton) {
        alertCall()
    }
    
    
    
    @objc private func serviceCenterLinkButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "https://www.mega-mgccoffee.com/news/voc/") { UIApplication.shared.open(url, options: [:]) }
    }
    
    
    
    @objc
    func appInquiryButtonTapped() {
        DispatchQueue.main.async {
            // let vc = AppInquiryVC()
            let vc = AppInquiryVC2()
            self.navigationController?.pushViewController(vc, animated: true)
        }
       
    }
    
    
    
    
    
    

// MARK: [Class End]
                
}

// MARK: [Class End]











    
 





// MARK: [Layout]
extension ServiceCenterVC {
    
    private func layout() {
        
        layout0Frame()
        layout1Top()
        layout2Center()
        layout2Bottom()
       
    }
    
    
    private func layout0Frame() {
        self.view.backgroundColor = .systemBackground
        naviCustom()
        
        layoutScrollView()
        layoutContentView()
    }
    
    private func layout1Top() {
        layoutHelloLabel()
        layoutCallingButton()
    }
    
    private func layout2Center() {
        layoutTimeLabel()
        layoutInfoLabel()
    }
    
    private func layout2Bottom() {
        layoutServiceCenterLinkButton()
        layoutAppInquiryButton()
    }
    
    
    
    
    
    
    private func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    
    
    // ScrollView
    private func layoutScrollView() {
        self.view.addSubview(self.scrollView)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
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
            self.contentView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    
    
    
    private func layoutHelloLabel() {
        self.contentView.addSubview(self.helloLabel)
        
        self.helloLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.helloLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.helloLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.helloLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.helloLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    

    
    private func layoutCallingButton() {
        self.contentView.addSubview(self.callingButton)

        self.callingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.callingButton.topAnchor.constraint(equalTo: self.helloLabel.bottomAnchor),
            self.callingButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.callingButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.callingButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
     
        self.callingButton.titleLabel?.leadingAnchor.constraint(equalTo: self.callingButton.leadingAnchor).isActive = true
        self.callingButton.titleLabel?.bottomAnchor.constraint(equalTo: self.callingButton.bottomAnchor).isActive = true
    }
    
    
    
    private func layoutTimeLabel() {
        self.contentView.addSubview(self.timeLabel)
        
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.timeLabel.topAnchor.constraint(equalTo: self.callingButton.bottomAnchor, constant: 10),
            self.timeLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.timeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.timeLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func layoutInfoLabel() {
        self.contentView.addSubview(self.inforLabel)
        
        self.inforLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.inforLabel.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 10),
            self.inforLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.inforLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.inforLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func layoutServiceCenterLinkButton() {
        self.contentView.addSubview(self.serviceCenterLinkButton)
        
        self.serviceCenterLinkButton.backgroundColor = .systemYellow
        
        self.serviceCenterLinkButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.serviceCenterLinkButton.topAnchor.constraint(equalTo: self.inforLabel.bottomAnchor, constant: 30),
            self.serviceCenterLinkButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.serviceCenterLinkButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.serviceCenterLinkButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func layoutAppInquiryButton() {
        self.contentView.addSubview(self.appInquiryButton)
        
        self.appInquiryButton.backgroundColor = customBrownColor
        
        self.appInquiryButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.appInquiryButton.topAnchor.constraint(equalTo: self.serviceCenterLinkButton.bottomAnchor, constant: 20),
            self.appInquiryButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.appInquiryButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.appInquiryButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
    
    
    
}





