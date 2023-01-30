//
//  UnRegisterVC.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/27.
//

import UIKit

final class UnRegisterVC: UIViewController {
    let customBrownColor = UIColor(r: 74, g: 44, b: 42)
    
    // MARK: [var] [0]: Frame
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.alwaysBounceVertical = true
        scrollView.contentSize = CGSize(width: self.contentView.frame.width, height: self.contentView.frame.height)
        
        
        return scrollView
    }()
    
    private lazy var contentView = UIView()
    
    
    
    // MARK: [var] [1]: Top
    private lazy var mainLabel: UILabel = {
        let main = UILabel()
        
        
        main.text = "정말로 탈퇴하시겠습니까?"
        main.textColor = .black
        main.font = .boldSystemFont(ofSize: 23)
        
        
        return main
    }()
    
    
    private lazy var subLabel: UILabel = {
        let sub = UILabel()
        
        
        sub.text = "한 번 삭제된 정보는 복구가 불가능합니다.\n카카오 계정 연결 해지를 위해 카카오톡 로그인이 필요할\n수 있습니다.\n재가입은 탈퇴일로부터 30일 후 가능합니다."
        sub.numberOfLines = 0
        sub.textColor = .black
        sub.font = .systemFont(ofSize: 15)
        
        
        return sub
    }()
    
    
    
    private lazy var backView: UIView = {
        let back = UIView()
        
        back.layer.cornerRadius = 6
        
        return back
    }()
    
    
    
    
    // MARK: [var] [2]: Receives Data (L)
    private lazy var leftMegaCardMoney: UILabel = {
       let mega = UILabel()
        
        mega.text = "메가카드 장수(금액)"
        mega.font = .systemFont(ofSize: 15)
        
        return mega
    }()
    
    private lazy var leftReceivedGift: UILabel = {
       let gift = UILabel()
        
        gift.text = "받은 선물"
        gift.font = .systemFont(ofSize: 15)
        
        return gift
    }()
    
    private lazy var leftStamp: UILabel = {
       let stamp = UILabel()
        
        stamp.text = "보유 스탬프"
        stamp.font = .systemFont(ofSize: 15)
        
        return stamp
    }()
    
    private lazy var leftCoupon: UILabel = {
       let coupon = UILabel()
        
        coupon.text = "보유 쿠폰"
        coupon.font = .systemFont(ofSize: 15)
        
        return coupon
    }()
    
    private lazy var leftReceivedGiftOld: UILabel = {
       let giftOld = UILabel()
        
        giftOld.text = "받은 선물(구)"
        giftOld.font = .systemFont(ofSize: 15)
        
        return giftOld
    }()
    
    
    private lazy var leftStackView: UIStackView = {
        let stackView = UIStackView()
        
        
        stackView.addArrangedSubview(leftMegaCardMoney)
        stackView.addArrangedSubview(leftReceivedGift)
        stackView.addArrangedSubview(leftStamp)
        stackView.addArrangedSubview(leftCoupon)
        stackView.addArrangedSubview(leftReceivedGiftOld)
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        
        
        return stackView
    }()
    
    
    
    
    
    // MARK: [var] [3]: Receives Data (R)
    private lazy var rightMegaCardMoney: UILabel = {
       let rMoney = UILabel()
        
        rMoney.text = "0장 (0원)"
        rMoney.font = .boldSystemFont(ofSize: 15)
        rMoney.textAlignment = .right
        
        return rMoney
    }()
    
    private lazy var rightReceivedGift: UILabel = {
       let rGift = UILabel()
        
        rGift.text = "0장"
        rGift.font = .boldSystemFont(ofSize: 15)
        rGift.textAlignment = .right
        
        return rGift
    }()
    
    private lazy var rightStamp: UILabel = {
       let rStamp = UILabel()
        
        rStamp.text = "0개"
        rStamp.font = .boldSystemFont(ofSize: 15)
        rStamp.textAlignment = .right
        
        return rStamp
    }()
    
    private lazy var rightCoupon: UILabel = {
       let rCoupon = UILabel()
        
        rCoupon.text = "0개"
        rCoupon.font = .boldSystemFont(ofSize: 15)
        rCoupon.textAlignment = .right
        
        return rCoupon
    }()
    
    private lazy var rightReceivedGiftOld: UILabel = {
       let rGiftOld = UILabel()
        
        rGiftOld.text = "0장"
        rGiftOld.font = .boldSystemFont(ofSize: 15)
        rGiftOld.textAlignment = .right
        
        return rGiftOld
    }()
    
    
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView()
        
        
        stackView.addArrangedSubview(rightMegaCardMoney)
        stackView.addArrangedSubview(rightReceivedGift)
        stackView.addArrangedSubview(rightStamp)
        stackView.addArrangedSubview(rightCoupon)
        stackView.addArrangedSubview(rightReceivedGiftOld)
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        
        
        return stackView
    }()
    
    
    // MARK: [var] [4]: Bottom
    
    private lazy var noCheckMarkButton: UIButton = {
        let noCheck = UIButton(type: .system)
        
        
        noCheck.setImage(UIImage(systemName: "checkmark.circle")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        noCheck.contentHorizontalAlignment = .left
        
        noCheck.addTarget(self, action: #selector(noCheckMarkTapped(_:)), for: .touchUpInside)
        
        
        return noCheck
    }()
    
    
    private lazy var checkMarkButton: UIButton = {
        let check = UIButton(type: .system)
        
        
        check.setImage(UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.green, renderingMode: .alwaysOriginal), for: .normal)
        check.contentHorizontalAlignment = .left
        
        check.isHidden = true
        
        check.addTarget(self, action: #selector(checkMarkTapped(_:)), for: .touchUpInside)
        
        
        return check
    }()
    
    
    
    private lazy var checkMarkLabel: UILabel = {
       let label = UILabel()
        
        label.text = "내용을 확인했습니다."
        
        return label
    }()
    
    
    
    private lazy var confirmButton: UIButton = {
        let confirm = UIButton(type: .system)
        
        confirm.setTitle("내용을 확인했습니다.", for: .normal)
        confirm.setTitleColor(.black, for: .normal)
        
        
        return confirm
    }()
    
    
    private lazy var nonGoodbyeButton: UIButton = {
        let nongoodbye = UIButton(type: .system)
        
        
        nongoodbye.setTitle("탈퇴", for: .normal)
        nongoodbye.setTitleColor(.white, for: .normal)
        nongoodbye.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        nongoodbye.layer.cornerRadius = 6
        
        nongoodbye.isEnabled = false
        
        
        return nongoodbye
    }()
    
    
    
    
    
    private lazy var goodbyeButton: UIButton = {
        let goodbye = UIButton(type: .system)
        
        
        goodbye.setTitle("탈퇴", for: .normal)
        goodbye.setTitleColor(.white, for: .normal)
        goodbye.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        goodbye.layer.cornerRadius = 6
        
        goodbye.isEnabled = false
        goodbye.isHidden = true
        
        goodbye.addTarget(self, action: #selector(goodByeButtonTapped(_:)), for: .touchUpInside)
        
        
        return goodbye
    }()
    
    
    
    
    

    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    
    
    
    
    
    // MARK: [Action]
    @objc func noCheckMarkTapped(_ sender: UIButton) {
        noCheckMarkButton.isHidden = true
        checkMarkButton.isHidden = false
        
        goodbyeButton.isEnabled = true
        goodbyeButton.isHidden = false
    }
    
    @objc func checkMarkTapped(_ sender: UIButton) {
        noCheckMarkButton.isHidden = false
        checkMarkButton.isHidden = true
        
        goodbyeButton.isEnabled = false
        goodbyeButton.isHidden = true
    }
    
    @objc func goodByeButtonTapped(_ sender: UIButton) {
        alert(message: "회원탈퇴를 진행하시겠습니까?")
    }
    
    
    
    
    
    
    

// MARK: [Class End]
    
}

// MARK: [Class End]




// MARK: [Layout]
extension UnRegisterVC {
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        
        naviCustom()
        
        layoutFrame()
        //
        layoutTop()
        layoutCenter()
        layoutBottom()
    }
    
    // Navi Custom
    private func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    
    
    private func layoutFrame() {
        layoutScrollView()
        layoutContentView()
    }
    
    
    private func layoutTop() {
        layoutMainLabel()
        layoutSubLabel()
    }
    
    private func layoutCenter() {
        layoutBackView()
        layoutLeftStackView()
        layoutRightStackView()
    }
    
    private func layoutBottom() {
        layoutNoCheckAndCheckMarkButton()
        layoutCheckMarkLabel()

        layoutNonGoodByeButton()
        layoutGoodByeButton()
    }
    
    
    
    // ScrollView
    private func layoutScrollView() {
        self.view.addSubview(self.scrollView)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
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
            self.contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        ])
        
    }
    
    
    
    // MainLabel
    private func layoutMainLabel() {
        self.contentView.addSubview(self.mainLabel)
        
        self.mainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.mainLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            self.mainLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.mainLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.mainLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // SubLabel
    private func layoutSubLabel() {
        self.contentView.addSubview(self.subLabel)
        
        self.subLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.subLabel.topAnchor.constraint(equalTo: self.mainLabel.bottomAnchor),
            self.subLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.subLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.subLabel.heightAnchor.constraint(equalToConstant: 90)
        ])
        
    }
    
    // BackView
    private func layoutBackView() {
        self.contentView.addSubview(self.backView)
        
        self.backView.backgroundColor = .systemGray6
        
        self.backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.backView.topAnchor.constraint(equalTo: self.subLabel.bottomAnchor, constant: 50),
            self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.backView.heightAnchor.constraint(equalToConstant: 330)
        ])
    }
    
    
    // Left StackView
    private func layoutLeftStackView() {
        self.backView.addSubview(self.leftStackView)
        
        self.leftStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leftStackView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 40),
            self.leftStackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 20),
            self.leftStackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -40),
            self.leftStackView.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    
    // Right StackView
    private func layoutRightStackView() {
        self.backView.addSubview(self.rightStackView)
        
        self.rightStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.rightStackView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 40),
            self.rightStackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -20),
            self.rightStackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -40),
            self.rightStackView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }

    
    
    
    // No Check Mark And Check Mark
    private func layoutNoCheckAndCheckMarkButton() {
        self.contentView.addSubview(self.noCheckMarkButton)
        self.contentView.addSubview(self.checkMarkButton)
        
        self.noCheckMarkButton.translatesAutoresizingMaskIntoConstraints = false
        self.checkMarkButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.noCheckMarkButton.topAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: 50),
            self.noCheckMarkButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.noCheckMarkButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.noCheckMarkButton.heightAnchor.constraint(equalToConstant: 30),
  

            
            self.checkMarkButton.topAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: 50),
            self.checkMarkButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.checkMarkButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.checkMarkButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    
    // Check Mark Right Ment
    private func layoutCheckMarkLabel() {
        self.contentView.addSubview(self.checkMarkLabel)
       
        self.checkMarkLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.checkMarkLabel.topAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: 50),
            self.checkMarkLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            self.checkMarkLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -100),
            self.checkMarkLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    // Non-GoodByeButton
    private func layoutNonGoodByeButton() {
        self.contentView.addSubview(self.nonGoodbyeButton)
        
        self.nonGoodbyeButton.backgroundColor = .lightGray
        
        self.nonGoodbyeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nonGoodbyeButton.topAnchor.constraint(equalTo: self.noCheckMarkButton.bottomAnchor, constant: 10),
            self.nonGoodbyeButton.topAnchor.constraint(equalTo: self.checkMarkButton.bottomAnchor, constant: 10),
            self.nonGoodbyeButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.nonGoodbyeButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.nonGoodbyeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    // GoodByeButton
    private func layoutGoodByeButton() {
        self.contentView.addSubview(self.goodbyeButton)
        
        self.goodbyeButton.backgroundColor = customBrownColor
        
        self.goodbyeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.goodbyeButton.topAnchor.constraint(equalTo: self.noCheckMarkButton.bottomAnchor, constant: 10),
            self.goodbyeButton.topAnchor.constraint(equalTo: self.checkMarkButton.bottomAnchor, constant: 10),
            self.goodbyeButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.goodbyeButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.goodbyeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

