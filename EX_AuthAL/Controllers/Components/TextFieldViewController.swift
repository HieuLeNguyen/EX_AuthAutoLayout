//
//  TextFieldViewController.swift
//  EX_AuthAL
//
//  Created by Nguyễn Văn Hiếu on 30/9/24.
//

import UIKit

 class TextFieldViewController: UIViewController {
    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func configTextField(_ withPlaceholder: String) -> UITextField {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: withPlaceholder, attributes: [.foregroundColor: accentColor])
        textField.backgroundColor = textFieldColor
        textField.layer.cornerRadius = 10
        return textField
    }
}
