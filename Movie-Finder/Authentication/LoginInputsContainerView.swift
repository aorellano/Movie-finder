//
//  LoginInputsContainerView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/11/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class LoginInputsContainerView: UIView {
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    let nameTextField: UITextField = {
         let textField = UITextField()
         textField.placeholder = "Name"
         textField.backgroundColor = UIColor.accentColor
         textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.25)])
         textField.translatesAutoresizingMaskIntoConstraints = false
         return textField
     }()
     
     let emailTextField: UITextField = {
         let textField = UITextField()
         textField.placeholder = "Email"
         textField.backgroundColor = UIColor.accentColor
         textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.25)])
         textField.translatesAutoresizingMaskIntoConstraints = false
         return textField
     }()
     
     let passwordTextField: UITextField = {
         let textField = UITextField()
         textField.placeholder = "Password"
         textField.backgroundColor = UIColor.accentColor
         textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.25)])
         textField.isSecureTextEntry = true
         textField.translatesAutoresizingMaskIntoConstraints = false
         return textField
     }()
     
     let nameSeperatorView: UIView = {
         let view = UIView()
         view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.15)
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
     
     let emailSeperatorView: UIView = {
         let view = UIView()
         view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.15)
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInputsContainerView()
    }

    func setupInputsContainerView() {
        styleContainerView()
        addContainerViewSubviews()
        placeNameTextField()
        placeEmailTextField()
        placePasswordTextField()
      }
    
    func styleContainerView() {
        backgroundColor = UIColor.accentColor
        layer.cornerRadius = 6
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addContainerViewSubviews() {
        addSubview(nameTextField)
        addSubview(nameSeperatorView)
        addSubview(emailTextField)
        addSubview(emailSeperatorView)
        addSubview(passwordTextField)
    }
    
    func placeNameTextField() {
        nameTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        
        nameSeperatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        nameSeperatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeperatorView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        nameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func placeEmailTextField() {
        emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameSeperatorView.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
                 
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3)
        emailTextFieldHeightAnchor?.isActive = true
                 
        emailSeperatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        emailSeperatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeperatorView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        emailSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func placePasswordTextField() {
        passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailSeperatorView.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

