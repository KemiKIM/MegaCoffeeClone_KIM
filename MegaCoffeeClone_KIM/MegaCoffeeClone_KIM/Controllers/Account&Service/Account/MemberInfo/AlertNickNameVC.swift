//
//  AlertNickNameVC.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2023/01/04.
//

import UIKit

final class AlertNickNameVC: CustomAlertBaseViewController {
    
    // MARK: [var] [0]: Frame
    lazy var nicknameStackView: UIStackView = {
        let stackView = UIStackView()
        
        
        stackView.addArrangedSubview(self.nicknameTitleLabel)
        stackView.addArrangedSubview(self.textFieldBackView)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        stackView.clipsToBounds = true
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 7
        stackView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        
        return stackView
    }()
    
    
    
    // MARK: [var] [1] Center
    lazy var nicknameTitleLabel: UILabel = {
        let title = UILabel(frame: .zero)
        
        
        title.text = "닉네임 변경"
        title.font = .boldSystemFont(ofSize: 20)
        title.textAlignment = .center
        
        
        return title
    }()
    
    
    
    // MARK: [var] [2] TextField
    private lazy var textFieldView: UIView = {
        let view = UIView()
        
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.cornerRadius = 7
        
        self.textField.delegate = self
        
        
        return view
        
    }()

    
    private lazy var textFieldBackView = UIView()
    private lazy var textField: UITextField = {
        let textfield = UITextField()

        
        textfield.font = .systemFont(ofSize: 18)
        textfield.placeholder = ""
        
        
        return textfield
    }()
    
    private lazy var textFieldLabel: UILabel = {
        let label = UILabel()
        
        
        label.text = "0/20"
        label.textColor = .systemGray
        
        
        return label
    }()
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]








// MARK: [TextField - Delegate]
extension AlertNickNameVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        textFieldLabel.text = "\(range.location)/20"
        textFieldLabel.textColor = .systemGray
        
        return updatedText.count <= 20
        
    }
}





// MARK: [Layout]
extension AlertNickNameVC {
    
    @objc func layoutNickName() {
        layoutNickNameOverride()
        
        layoutNickNameStackView()
        layoutTextFieldView()
        layoutTextField()
        layoutTextFieldLabel()
    }
    
    
    // Override
    private func layoutNickNameOverride() {
        self.contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
        
        self.confirmBtn.setTitle("변경", for: .normal)
    }
    
    
    // StackView
    private func layoutNickNameStackView() {
        self.contentView.addSubview(self.nicknameStackView)
        
        self.nicknameStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nicknameStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 30),
            self.nicknameStackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.nicknameStackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            self.nicknameStackView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.45)
        ])
    }
    
  
    // TextField BackView, TextField View
    private func layoutTextFieldView() {
        self.textFieldBackView.addSubview(self.textFieldView)
        
        self.textFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.textFieldView.topAnchor.constraint(equalTo: self.textFieldBackView.topAnchor),
            self.textFieldView.leadingAnchor.constraint(equalTo: self.textFieldBackView.leadingAnchor, constant: 20),
            self.textFieldView.trailingAnchor.constraint(equalTo: self.textFieldBackView.trailingAnchor, constant: -20),
            self.textFieldView.bottomAnchor.constraint(equalTo: self.textFieldBackView.bottomAnchor)
        ])
    }
    
    // TextField
    private func layoutTextField() {
        self.textFieldView.addSubview(self.textField)
        
        self.textFieldView.backgroundColor = .white
        
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.textField.topAnchor.constraint(equalTo: self.textFieldView.topAnchor),
            self.textField.leadingAnchor.constraint(equalTo: self.textFieldView.leadingAnchor, constant: 15),
            self.textField.bottomAnchor.constraint(equalTo: self.textFieldView.bottomAnchor),
            self.textField.widthAnchor.constraint(equalTo: self.textFieldView.widthAnchor, multiplier: 0.8)
        ])
    }
    
    
    // TextFieldLabel
    private func layoutTextFieldLabel() {
        self.textFieldView.addSubview(self.textFieldLabel)
        
        self.textFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.textFieldLabel.topAnchor.constraint(equalTo: self.textFieldView.topAnchor),
            self.textFieldLabel.trailingAnchor.constraint(equalTo: self.textFieldView.trailingAnchor, constant: -5),
            self.textFieldLabel.bottomAnchor.constraint(equalTo: self.textFieldView.bottomAnchor)
        ])
    }
    
}
