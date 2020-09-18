//
//  FilterController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/19/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class FilterController: UITableViewController {
    //let filterView = FilterView()
    var dropDownOptions  = ["popularity.desc", "popularity.asc", "release_date.desc", "release.asc", "vote_average.desc", "vote_average.asc"]
    
    var currentFilter: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.backgroundColor
        tableView.separatorColor = .darkGray
        tableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "filterCell")
        //filterView.dropDownButton.dropDownView.tableView.delegate = self
        //filterView.dropDownButton.dropDownView.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.backgroundColor
    }
    
    @objc func cancelButtonPressed() {
        
    }
}

extension FilterController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath)
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        cell.backgroundColor = UIColor(red: 49/255, green: 48/255, blue: 58/255, alpha: 1.0)
        cell.textLabel?.textColor = .white
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(dropDownOptions[indexPath.row])
//    }
//
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dropDownOptions[indexPath.row])
        let vc = MovieRecommendationController()
        vc.filter = dropDownOptions[indexPath.row]
        navigationController?.popViewController(animated: true)
    }

}
