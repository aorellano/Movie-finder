//
//  SearchView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
//    var searchBar : UISearchBar = {
//        let search = UISearchBar()
//            search.placeholder = "Search Timeline"
//            search.delegate = self
//            s.tintColor = .white
//            search.barTintColor = UIColor.backgroundColor
//            //s.barStyle = .default
//            search.sizeToFit()
//        return search
//    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
