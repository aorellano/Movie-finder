//
//  AuthenticationTextField.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/11/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class AuthenticationTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textFieldLayout()
    }
    
    func textFieldLayout() {
        self.borderStyle = .roundedRect
        self.backgroundColor = UIColor.accentColor
        self.layer.borderColor = UIColor.accentColor.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryTextColor])
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

