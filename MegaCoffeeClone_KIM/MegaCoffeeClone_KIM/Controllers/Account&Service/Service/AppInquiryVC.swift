//
//  AppInquiryVC.swift
//  CollectionView_Code
//
//  Created by 김성호 on 2022/12/13.
//

import UIKit

// MARK: [Enum]
enum AppInquiry {
    case inquiry
    case history
}


class AppInquiryVC: UIViewController {
    var appInquiry = AppInquiry.inquiry
    let uiImagePC = UIImagePickerController()
    
   
    
    // MARK: [var] [0] Frame
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AppInquiryHeaderView.self, forHeaderFooterViewReuseIdentifier: "AppInquiryHeaderView")
        tableView.register(AppInquiryTVC.self, forCellReuseIdentifier: AppInquiryTVC.identifier)
        tableView.register(AppInquiryHistoryTVC.self, forCellReuseIdentifier: AppInquiryHistoryTVC.identifier)
        
        
        tableView.bounces = false
        
        /*
        if #available (iOS 15.0, *) {
            self.tableView.sectionHeaderTopPadding = 0
        } else {
            self.tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        }
        */
        
        
        return tableView
    }()
    
    // MARK: [var] [1] Photo UIMenu
    private lazy var photoMenuItems: [UIAction] = {
        return [
            // (1)
            UIAction(title: "사진 보관함",
                     image: UIImage(systemName: "photo.on.rectangle"))
                { _ in
                    print("사진 보관함 실행")
                    self.openPhoto()
                },
            // (2)
            UIAction(title: "사진 찍기",
                     image: UIImage(systemName: "camera"))
                { _ in
                    print("사진 찍기 실행")
                    self.openCamera()
                },
            
            // (3)
            UIAction(title: "파일 선택",
                     image: UIImage(systemName: "folder"))
                { _ in
                    print("파일 선택 실행")
                    self.openFolder()
                }
            
        ]
    }()
    
    
    private lazy var photoMenu: UIMenu = {
        return UIMenu(title: "",
                      image: UIImage(systemName: ""),
                      identifier: nil,
                      options: .displayInline,
                      children: photoMenuItems)
    }()
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedBackground()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        layout()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: [Action] HeaderView
    @objc func tapListButton(_ sender: UITableViewCell) {
        
        switch sender.tag {
            
        case 1: appInquiry = .inquiry
        case 2: appInquiry = .history
            
        default: break
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    
    
    // MARK: [Action] - Choice Inquiry Type
    @objc private func choiceInquiryTypeButtonTapped(_ sender: UIButton) {
        let vc = ChoiceInquiryTypeVC()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }

    
    
    
    // MARK: [Action] - Inquiry Res Btn
    @objc func inquiryRegistrationButtonTapped(_ sender: UIButton) { //9
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AppInquiryTVC {
            
            let btnText = cell.choiceInquiryTypeButton.titleLabel?.text
            let textFieldText = cell.titleTextField.text
        
            
            
            // 문의유형, 제목 중 하나라도 존재하지 않는다면
            if (btnText == "문의 유형을 선택해주세요") && textFieldText == "" {
                alertOK(message: "문의유형을 선택해주세요.")
                
            // 문의유형이 선택되어 있지 않고, 제목이 작성되어있다면
            } else if (btnText == "문의 유형을 선택해주세요") && textFieldText != "" {
                
                alertOK(message: "문의유형을 선택해주세요.")
                
            // 문의유형은 선택되어 있으나, 제목은 작성하지 않았다면
            } else if (btnText != "문의 유형을 선택해주세요") && textFieldText == "" {
                
                alertOK(message: "제목을 입력해주세요.")
                
            } else {
                alert(message: "등록하시겠습니까?")
            }
            
            
        }
        
    }
    
    
    
    
    // MARK: [Func] - Photo UIMenu
    private func openCamera() {
        
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            
            uiImagePC.sourceType = .camera
            uiImagePC.allowsEditing = true
            
            present(uiImagePC, animated: true)
            
        } else {
            alertOK(message: "실행 완료")
        }
        
    }
    
    
    private func openPhoto() {
        uiImagePC.sourceType = .photoLibrary
        uiImagePC.allowsEditing = true
        
        present(uiImagePC, animated: true)
    }
    
 
    
    
    private func openFolder() {
        let documentPicker = UIDocumentPickerViewController(documentTypes: [String(kUnknownType)], in: .import)
        documentPicker.delegate = self

        present(documentPicker, animated: true, completion: nil)
    }
    
    
    


    
    
    
  
    
    
    
    
    // MARK: [Func] - Init Button
    // Init Button
    @objc func contentInitializationButtonTapped(_ sender: UIButton) {
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AppInquiryTVC {
            
            // 모두 비어있으면,
            if cell.titleTextField.text == "" && cell.textView.text == "" {
                return
            } else {
                alertRemoveAll()
            }
            
        }
       
    }
    
    
    
    
    private func alertRemoveAll() {
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AppInquiryTVC {
            let alert = UIAlertController(title: "", message: "작성 내용을 초기화 하시겠습니까?", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default)
            { [ weak self ] (action) in
                
                
                cell.choiceInquiryTypeButton.setTitle("문의 유형을 선택해주세요", for: .normal)
                cell.titleTextField.text = ""
                cell.textView.text = ""
                
            }
            
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
            
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    }
  
    
    
    @objc func keyboardWillShow(_ sender: NSNotification) {
        
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + self.tableView.frame.height / 5, right: 0)
            
        }
        
    }
    
    @objc func keyboardWillHide(_ sender: NSNotification) {
        self.tableView.contentInset = .zero
    }
    
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]










// MARK: [TableView - DataSource]
extension AppInquiryVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.systemBackground
    }
    
    
    
    // Custom Header View
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "AppInquiryHeaderView") as? AppInquiryHeaderView else { return UITableViewHeaderFooterView() }
        
        
        view.inquiryButton.setTitle("문의하기", for: .normal)
        view.historyButton.setTitle("문의내역", for: .normal)
        
        view.inquiryButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        view.historyButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
    
        
        return view
    }
    
    
    // height For Row At
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch appInquiry {
            
        case .inquiry: return 700
        case .history: return 90
            
            
        }
        
    }
    
    
    // number Of Rows In Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch appInquiry {
            
        case .inquiry: return 1
        case .history: return 1
            
            
        }
        
    }
    
    // cell For Row At
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch appInquiry {
            
        case .inquiry:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AppInquiryTVC.identifier, for: indexPath) as? AppInquiryTVC else { return UITableViewCell() }
            
            
            cell.choiceInquiryTypeButton.addTarget(self, action: #selector(choiceInquiryTypeButtonTapped(_:)), for: .touchUpInside)
            cell.photoRegistrationButton.menu = photoMenu

            cell.inquiryRegistrationButton.addTarget(self, action: #selector(inquiryRegistrationButtonTapped(_:)), for: .touchUpInside)
            cell.contentInitializationButton.addTarget(self, action: #selector(contentInitializationButtonTapped(_:)), for: .touchUpInside)
           
            
            return cell
            
            
        case .history:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AppInquiryHistoryTVC.identifier, for: indexPath) as? AppInquiryHistoryTVC else { return UITableViewCell() }
            
            
            return cell
            
        }
        
    }
   
    
    
    // ⭐️ tableviewcell에 uimenu를 추가하기 위해. ⭐️
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: nil)
                                            { _ in
                                                    return self.photoMenu
                                            }
    }
    
        
    
}





// MARK: [TableView - Delegate]
extension AppInquiryVC: UITableViewDelegate {

    
}










// MARK: [Layout]

extension AppInquiryVC {
    
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
        
        
        self.navigationItem.title = "앱 관련 문의"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.largeTitleDisplayMode = .never
         
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        self.tableView.backgroundColor = .white
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
}


// MARK: [UIDocumentPickerDelegate]
extension AppInquiryVC: UIDocumentPickerDelegate {
    
    private func documentPicker(_ controller: UIViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else { return }
        guard url.startAccessingSecurityScopedResource() else {
            print("unable to access security scoped resource: \(url.absoluteString)")
            return
        }
        defer { url.stopAccessingSecurityScopedResource() }

        let fileCoord = NSFileCoordinator.init()
        fileCoord.coordinate(readingItemAt: url, options: .immediatelyAvailableMetadataOnly, error: nil) { (url) in
            if let res = try? url.resourceValues(forKeys: [.ubiquitousItemContainerDisplayNameKey]),
               let name = res.ubiquitousItemContainerDisplayName {
                
                let tvc = AppInquiryTVC()
                tvc.imageLabel.text = name
                // imageLabel.text = name
                
                   print("\(name)")
               } else {
                   print("no name found")
               }
        }
    }
}

