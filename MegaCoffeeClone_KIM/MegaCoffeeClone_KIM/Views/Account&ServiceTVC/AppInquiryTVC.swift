//
//  AppInquiryTVC.swift
//  CollectionView_Code
//
//  Created by 김성호 on 2022/12/13.
//

import UIKit

class AppInquiryTVC: UITableViewCell {
    static var identifier: String { return String(describing: self) }

    let customBrownColor = UIColor(r: 74, g: 44, b: 42)

    
    
    // MARK: [var] [1]
    let choiceInquiryTypeButton: UIButton = {
        let choiceButton = UIButton(type: .system)
        
        
        choiceButton.setTitle("문의 유형을 선택해주세요", for: .normal)
        choiceButton.setTitleColor(.black, for: .normal)
        
        choiceButton.contentHorizontalAlignment = .left
        choiceButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
     
        choiceButton.layer.cornerRadius = 7
        choiceButton.layer.borderWidth = 1
        choiceButton.layer.borderColor = UIColor.gray.cgColor
        
        
        return choiceButton
    }()
    
    
    
    
    let choiceInquiryTypeButtonLabel: UILabel = {
        let label = UILabel()
        let attachment = NSTextAttachment()
        
        
        attachment.image = UIImage(systemName: "chevron.down")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let attachmentString = NSAttributedString(attachment: attachment)
        let contentString = NSMutableAttributedString(string: "")
        contentString.append(attachmentString)
        
        label.attributedText = contentString
        
        
        return label
    }()
    
    
    
    
    
    // MARK: [var] [2] Write View
    let writeContentBackView: UIView = {
        let writeView = UIView(frame: .zero)
        
        
        writeView.layer.cornerRadius = 7
        writeView.layer.borderWidth = 1
        writeView.layer.borderColor = UIColor.gray.cgColor
        
        
        return writeView
    }()
    
    
    let titleTextField: UITextField = {
        let text = UITextField()
        
        text.placeholder = "제목을 입력해 주세요. (50자이내)"
        
        
        return text
    }()
    
    let titleTextFieldBottomLineView = UIView()
    let textView: UITextView = {
        let textView = UITextView()
        
        textView.font = .systemFont(ofSize: 17)
        
        return textView
    }()
    
    
    
    
    
    // MARK: [var] [3]
    let imageLabel: UILabel = {
        let imageLabel = UILabel()
        
        
        imageLabel.layer.cornerRadius = 7
        imageLabel.layer.borderWidth = 1
        imageLabel.layer.borderColor = UIColor.gray.cgColor
        imageLabel.numberOfLines = 0
        
        
        return imageLabel
    }()
    
    
    
    let photoRegistrationButton: UIButton = {
        let photo = UIButton(type: .system)
        
        
        photo.setTitle("사진 등록", for: .normal)
        photo.setTitleColor(UIColor(r: 74, g: 44, b: 42), for: .normal)
        
        photo.titleLabel?.font = .boldSystemFont(ofSize: 18)
        photo.layer.cornerRadius = 7
        
        photo.showsMenuAsPrimaryAction = true
        
        
        return photo
    }()
    
    let fileInforLabel: UILabel = {
        let file = UILabel()
        
        
        file.text = "파일첨부는 아래의 파일만 등록이 가능하며\n최대2개(1개당 최대10MB), 총 20MB까지 등록이\n가능합니다.\n(등록 가능 확장자: jpg, jpeg, png, gif)"
        file.numberOfLines = 0
        
        
        return file
    }()
    
    
    // MARK: [var] [4] thisthisthisthisthisthisthis
    
    let inquiryRegistrationButton: UIButton = {
        let inquiry = UIButton(type: .system)
        
        
        inquiry.setTitle("문의 등록", for: .normal)
        inquiry.setTitleColor(UIColor.white, for: .normal)
        
        inquiry.titleLabel?.font = .boldSystemFont(ofSize: 18)
        inquiry.layer.cornerRadius = 7
        
        
        return inquiry
    }()
    
    
    
    
    
    let contentInitializationButton: UIButton = {
        let content = UIButton()
        
        
        content.setTitle("내용 초기화", for: .normal)
        content.setTitleColor(UIColor(r: 74, g: 44, b: 42), for: .normal)
    
        content.backgroundColor = UIColor(r: 241, g: 224, b: 172)
        content.titleLabel?.font = .boldSystemFont(ofSize: 18)
        
        content.layer.cornerRadius = 7

        
        return content
    }()
    
    
    
    
    
    
    
    
    
    // MARK: [Override]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        
        titleTextField.delegate = self
        
        notiSetting()
        
        
        addSubView()
        layout()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("")
        
    }
    

    
    
    
  
    
    
    
    
    
    // MARK: [Add View]
    func addSubView() {
        self.contentView.addSubview(self.choiceInquiryTypeButton)
        self.choiceInquiryTypeButton.addSubview(self.choiceInquiryTypeButtonLabel)
        
        self.contentView.addSubview(self.writeContentBackView)
        self.writeContentBackView.addSubview(self.titleTextField)
        self.writeContentBackView.addSubview(self.titleTextFieldBottomLineView)
        self.writeContentBackView.addSubview(self.textView)
        
        self.contentView.addSubview(self.imageLabel)
        self.contentView.addSubview(self.photoRegistrationButton)
        self.contentView.addSubview(self.fileInforLabel)
        
        self.contentView.addSubview(self.inquiryRegistrationButton)
        self.contentView.addSubview(self.contentInitializationButton)
    }
    
    
    
    
    
    // MARK: [Layout - Total]
    private func layout() {
        
        
        layoutChoiceInquiryType()
        layoutWriteContentView()
        layoutMarkImage()
        layoutFileInfoAndButton()
    }
    
    
    
    // [3]
    private func layoutChoiceInquiryType() {
        layoutChoiceInquiryTypeButton()
        layoutChoiceInquiryTypeButtonLabel()
    }
    
    
    // [4]
    private func layoutWriteContentView() {
        layoutWriteContentBackView()
        layoutTitleTextField()
        layoutTextFieldBottomLineView()
        layoutTextView()
    }
    
    // [5]
    private func layoutMarkImage() {
        layoutImageLabel()
        layoutPhotoRegistrationButton()
    }
    
    // [6]
    private func layoutFileInfoAndButton() {
        layoutFileInforLabel()
        layoutInquiryRegistrationButton()
        layoutContentInitializationButtonButton()
    }
    
    
    
    
    
    
    
    
    // ChoiceInquiryTypeButton
    func layoutChoiceInquiryTypeButton() {
        self.choiceInquiryTypeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.choiceInquiryTypeButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            self.choiceInquiryTypeButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.choiceInquiryTypeButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.choiceInquiryTypeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    
    // ChoiceInquiryTypeButton Right Label
    private func layoutChoiceInquiryTypeButtonLabel() {
        self.choiceInquiryTypeButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.choiceInquiryTypeButtonLabel.topAnchor.constraint(equalTo: self.choiceInquiryTypeButton.topAnchor),
            self.choiceInquiryTypeButtonLabel.trailingAnchor.constraint(equalTo: self.choiceInquiryTypeButton.trailingAnchor, constant: -15),
            self.choiceInquiryTypeButtonLabel.bottomAnchor.constraint(equalTo: self.choiceInquiryTypeButton.bottomAnchor)
            
            ])
    }
    
    
    
    
    
    
    // TextField BackView
    private func layoutWriteContentBackView() {
        self.writeContentBackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.writeContentBackView.topAnchor.constraint(equalTo: self.choiceInquiryTypeButton.bottomAnchor, constant: 20),
            self.writeContentBackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.writeContentBackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.writeContentBackView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
    
    
    
    // TextField
    private func layoutTitleTextField() {
        self.titleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.titleTextField.topAnchor.constraint(equalTo: self.writeContentBackView.topAnchor, constant: 5),
            self.titleTextField.leadingAnchor.constraint(equalTo: self.writeContentBackView.leadingAnchor, constant: 10),
            self.titleTextField.trailingAnchor.constraint(equalTo: self.writeContentBackView.trailingAnchor, constant: -10),
            self.titleTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // TextField - BottomLine
    private func layoutTextFieldBottomLineView() {
        self.titleTextFieldBottomLineView.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleTextFieldBottomLineView.backgroundColor = .gray
        
        NSLayoutConstraint.activate([
            self.titleTextFieldBottomLineView.topAnchor.constraint(equalTo: self.titleTextField.bottomAnchor),
            self.titleTextFieldBottomLineView.leadingAnchor.constraint(equalTo: self.writeContentBackView.leadingAnchor),
            self.titleTextFieldBottomLineView.trailingAnchor.constraint(equalTo: self.writeContentBackView.trailingAnchor),
            self.titleTextFieldBottomLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    
    
    // TextView
    private func layoutTextView() {
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.textView.topAnchor.constraint(equalTo: self.titleTextFieldBottomLineView.bottomAnchor, constant: 5),
            self.textView.leadingAnchor.constraint(equalTo: self.writeContentBackView.leadingAnchor, constant: 5),
            self.textView.trailingAnchor.constraint(equalTo: self.writeContentBackView.trailingAnchor,constant: -5),
            self.textView.bottomAnchor.constraint(equalTo: self.writeContentBackView.bottomAnchor, constant: -5)
        ])
    }
    
    
    
    
    
    
    // ImageLabel
    private func layoutImageLabel() {
        self.imageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageLabel.topAnchor.constraint(equalTo: self.writeContentBackView.bottomAnchor, constant: 20),
            self.imageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.imageLabel.widthAnchor.constraint(equalTo: self.writeContentBackView.widthAnchor, multiplier: 0.7),
            self.imageLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    // PhotoRegistrationButton
    private func layoutPhotoRegistrationButton() {
        self.photoRegistrationButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.photoRegistrationButton.backgroundColor = UIColor(r: 241, g: 224, b: 172)
        
        NSLayoutConstraint.activate([
            self.photoRegistrationButton.topAnchor.constraint(equalTo: self.writeContentBackView.bottomAnchor, constant: 20),
            self.photoRegistrationButton.leadingAnchor.constraint(equalTo: self.imageLabel.trailingAnchor, constant: 10),
            self.photoRegistrationButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.photoRegistrationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
    
    
    
    // FileInforLabel
    private func layoutFileInforLabel() {
        self.fileInforLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.fileInforLabel.topAnchor.constraint(equalTo: self.imageLabel.bottomAnchor, constant: 10),
            self.fileInforLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.fileInforLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.fileInforLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    
    
    // InquiryRegistrationButton
    private func layoutInquiryRegistrationButton() {
        self.inquiryRegistrationButton.translatesAutoresizingMaskIntoConstraints = false

        self.inquiryRegistrationButton.backgroundColor = .systemGray4
        
        NSLayoutConstraint.activate([
            self.inquiryRegistrationButton.topAnchor.constraint(equalTo: self.fileInforLabel.bottomAnchor, constant: 15),
            self.inquiryRegistrationButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.inquiryRegistrationButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.inquiryRegistrationButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    
    // ContentInitializationButtonButton
    private func layoutContentInitializationButtonButton() {
       self.contentInitializationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.contentInitializationButton.topAnchor.constraint(equalTo: self.inquiryRegistrationButton.bottomAnchor, constant: 10),
            self.contentInitializationButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.contentInitializationButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.contentInitializationButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]








// MARK: [Notification]

extension AppInquiryTVC {
    
    
    func notiSetting() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(choiceStampData), name: ChoiceInquiryTypeVC.notiStamp, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(choiceCouponData), name: ChoiceInquiryTypeVC.notiCoupon, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(choiceMegaCardRefundData), name: ChoiceInquiryTypeVC.notiMegaCardRefund, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(choiceErrorData), name: ChoiceInquiryTypeVC.notiErrorButton, object: nil)
   
        NotificationCenter.default.addObserver(self, selector: #selector(choiceUserInfoData), name: ChoiceInquiryTypeVC.notiUserInfo, object: nil)
        
    }
    
    
    
    // MARK: [Action] Noti
    @objc func choiceStampData() {
        self.choiceInquiryTypeButton.setTitle("스탬프", for: .normal)
        saveTextView()
    }
    
    
    @objc func choiceCouponData() {
        choiceInquiryTypeButton.setTitle("쿠폰", for: .normal)
        saveTextView()
    }
    
    
    @objc func choiceMegaCardRefundData() {
        choiceInquiryTypeButton.setTitle("메가선불카드 환불", for: .normal)
        self.textView.text = """
                            * 앱을 이용한 일반카드결제는 매장에서 취소 해주시길 바랍니다.
                            * 일반선물하기 취소건은 카카오톡채널(ID: 발트루스트)로 문의해주세요.
                            
                            성함 :
                            연락처 :
                            받는사람 연락처(선물하기의 경우) :
                            카드 바코드번호 :
                            환불사유 :
                            """
    }
    
    
    @objc func choiceErrorData() {
        choiceInquiryTypeButton.setTitle("오류", for: .normal)
        saveTextView()
    }
    
    
    @objc func choiceUserInfoData() {
        choiceInquiryTypeButton.setTitle("회원정보", for: .normal)
        saveTextView()
    }
    
    
    
    
    @objc func saveTextView() {
        self.textView.text = """
                            이용매장 :
                            방문시기 :
                            주문번호 :
                            연락처 :
                            문의내용 :
                            """
    }
    
    
   
}

 
 

// MARK: [TextField - Delegate]
extension AppInquiryTVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        //
        if range.location == 0 && range.length != 0 {
            
            
            self.inquiryRegistrationButton.backgroundColor = .systemGray4
            
        } else {
    
            self.inquiryRegistrationButton.backgroundColor = customBrownColor
        }
        
        
        
        return true
    }
    
    
}

// textField랑 textView랑 둘 다 적을 때 바꿔야해서 내가 일부러 이걸 만들어놨었구나...

extension AppInquiryTVC: UITextViewDelegate {
    
    
}












