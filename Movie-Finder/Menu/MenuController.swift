//
//  MenuController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/5/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: self.tableView.frame, style: .grouped)
        
        tableView.register(MenuCell.self, forCellReuseIdentifier: "menuCell")
        tableView.backgroundColor = UIColor.backgroundColor
        tableView.separatorColor = .darkGray
        tableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 2
        } else {
            return 3
        }

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
        
        cell.textLabel?.textColor = .white
        
        if indexPath.section == 0 && indexPath.row == 0 {
            cell.textLabel?.text = "My Movies"
            
        } else if indexPath.section == 1 && indexPath.row == 0 {
            cell.textLabel?.text = "About Us"
        } else if indexPath.section == 1 && indexPath.row == 1 {
            cell.textLabel?.text = "Contact Us"
        } else if indexPath.section == 2 && indexPath.row == 0 {
            cell.textLabel?.text = "Shipping & Returns"
        } else if indexPath.section == 2 && indexPath.row == 1 {
            cell.textLabel?.text = "Privacy Policy"
        } else if indexPath.section == 2 && indexPath.row == 2 {
            cell.textLabel?.text = "Terms & Conditions"
        } else {
            cell.textLabel?.text = "Login"
            cell.textLabel?.textAlignment = .center
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            let vc = MovieListController()
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 0 {
            //cell.textLabel?.text = "About Us"
        } else if indexPath.section == 1 && indexPath.row == 1 {
//            let contactController = ContactController()
//            contactController.modalPresentationStyle = .formSheet
//            present(contactController, animated: true)
        } else if indexPath.section == 2 && indexPath.row == 0 {
//            let shippingController = ShippingController()
//            shippingController.modalPresentationStyle = .formSheet
//            self.present(shippingController, animated: true)
        } else if indexPath.section == 2 && indexPath.row == 1 {
//            let policyController = PolicyController()
//            policyController.modalPresentationStyle = .formSheet
//            self.present(policyController, animated: true)
        } else if indexPath.section == 2 && indexPath.row == 2 {
//            let termsController = TermsController()
//            termsController.modalPresentationStyle = .formSheet
//            self.present(termsController, animated: true)
        }
    }
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.backgroundColor
       
        
        tabBarController?.navigationItem.title = "Settings"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.sizeToFit()
        
    }}


