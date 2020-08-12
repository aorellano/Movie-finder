//
//  AuthenticationButton.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/11/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//
import UIKit

class AuthenticationButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buttonLayout()
    }
    
    func buttonLayout(){
        self.backgroundColor = UIColor.tintColor
        self.setTitle("Login ", for: .normal)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 55).isActive = true
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
