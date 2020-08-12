//
//  LoginController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/11/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//
import UIKit
import Firebase

class LoginController: UIViewController {
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonTargets()
    }
    
    func addButtonTargets() {
        loginView.loginRegisterButton.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
    }
    
    @objc func handleLoginRegister() {
        if loginView.loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }
    
    func handleLogin() {
        guard let email = loginView.inputsContainerView.emailTextField.text, let password = loginView.inputsContainerView.passwordTextField.text else {
            print("Form is not valid")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: { (currentUser, error) in
            if error != nil {
                print(error)
            }
            let homeVC = HomeController()
            self.navigationController?.pushViewController(homeVC, animated: true)
        })
    }
    
    @objc func handleRegister() {
        guard let name = loginView.inputsContainerView.nameTextField.text, let email = loginView.inputsContainerView.emailTextField.text, let password = loginView.inputsContainerView.passwordTextField.text else {
            print("Form is not valid")
            return
        }

        Auth.auth().createUser(withEmail: email, password: password, completion: { (currentUser, error) in
            if error != nil {
                print(error as Any)
                return
            }
            guard let uid = currentUser?.user.uid else {
                return
            }
            let ref = Database.database().reference(fromURL: "https://moviefinder-edef6.firebaseio.com/")
            let usersReference = ref.child("users").child(uid)
            let values = ["name": name, "email": email]
            usersReference.updateChildValues(values, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print(error as Any)
                    return
                }
                let homeVC = HomeController()
                self.navigationController?.pushViewController(homeVC, animated: true)
            })
        })
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func loadView() {
        view = loginView
    }
}
