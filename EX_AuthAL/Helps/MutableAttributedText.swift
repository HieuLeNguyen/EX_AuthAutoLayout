//
//  AttributedText.swift
//  EX_AuthAL
//
//  Created by Nguyễn Văn Hiếu on 1/10/24.
//

import UIKit

protocol AttributedTextConfigurable {
    func setAttributedText(_ attributedString: NSAttributedString)
}

extension UILabel: AttributedTextConfigurable {
    func setAttributedText(_ attributedString: NSAttributedString) {
        self.a
    }
}
extension UITextView: AttributedTextConfigurable {}

extension AttributedTextConfigurable {
    
    //MARK: - Configure Message
    func configureMessage(
        message: String,
        _ texts: [String],
        font: UIFont = .boldSystemFont(ofSize: 14),
        textColor: UIColor = accentColor
    ) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: message)
        
        for text in texts {
            let textRange = (message as NSString).range(of: text)
            if textRange.location != NSNotFound { // Kiểm tra xem chuỗi có tồn tại trong message không
                attributedString.addAttribute(.font, value: font, range: textRange)
                attributedString.addAttribute(.foregroundColor, value: textColor, range: textRange)
            }
        }
        
        return attributedString
    }
}
