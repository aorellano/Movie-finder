//
//  LoginView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/11/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class LoginView: UIView {
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .white
        label.font = UIFont.titleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginRegisterSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Login", "Sign Up"])
        segmentedControl.backgroundColor = UIColor.accentColor
        segmentedControl.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    let inputsContainerView = LoginInputsContainerView()
    
    lazy var loginRegisterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.tintColor
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor
        
        setupHeaderLabel()
        setupInputsContainerView()
        setupLoginSegmentedControl()
        setupLoginRegisterButton()
    }
    
    func setupHeaderLabel() {
        addSubview(headerLabel)
           
        headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
       }
    
    func setupInputsContainerView() {
        addSubview(inputsContainerView)
        inputsContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, constant: -24).isActive = true
        
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 180)
               
        inputsContainerViewHeightAnchor?.isActive = true
    }
    
    func setupLoginSegmentedControl() {
        addSubview(loginRegisterSegmentedControl)
           
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -20).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
       }
    
    func setupLoginRegisterButton() {
        addSubview(loginRegisterButton)
        loginRegisterButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 20).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleLoginRegisterChange() {
        let title = loginRegisterSegmentedControl.titleForSegment(at: (loginRegisterSegmentedControl.selectedSegmentIndex))
        loginRegisterButton.setTitle(title, for: .normal)
        headerLabel.text = title

        inputsContainerViewHeightAnchor?.constant = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 120 : 180

        inputsContainerView.nameTextFieldHeightAnchor?.isActive = false
        inputsContainerView.nameTextFieldHeightAnchor = inputsContainerView.nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        inputsContainerView.nameTextFieldHeightAnchor?.isActive = true

        inputsContainerView.emailTextFieldHeightAnchor?.isActive = false
        inputsContainerView.emailTextFieldHeightAnchor = inputsContainerView.emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)

        inputsContainerView.emailTextFieldHeightAnchor?.isActive = true

        inputsContainerView.passwordTextFieldHeightAnchor?.isActive = false
        inputsContainerView.passwordTextFieldHeightAnchor = inputsContainerView.passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)

        inputsContainerView.passwordTextFieldHeightAnchor?.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
