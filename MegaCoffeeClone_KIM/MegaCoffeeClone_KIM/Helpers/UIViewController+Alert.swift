//
//  UIViewController+Alert.swift
//  MegaCoffeeClone_KIM
//
//  Created by 김성호 on 2022/12/23.
//

import UIKit

extension UIViewController {
    
    // MARK: [Alert] - Cancel, Ok
    func alert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) {
            [ weak self ] (action) in
            
            guard let self = self else { return }
            self.dismiss(animated: true)
            
            
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }

    
    
    // MARK: [Alert] - Ok
    func alertOK(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }


    
    
    
    // MARK: [.actionSheet]
    func alertCall() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let callImage = UIImage(systemName: "phone.fill")
        let call = UIAlertAction(title: "       통화 1588-8298", style: .default, handler: nil)
        // hander가 이걸 눌렀을 때 실행할 함수를 넣는거라고 함.
        call.setValue(callImage, forKey: "image")
        call.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        // 이미지 변경 및, 텍스트 위치 변경

        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(call)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
}

