//
//  SearchFieldView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class SearchFieldView: UITextField {
    let bottomLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.accentColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTextField()
        setupBottomLine()
        delegate = self
        
        //self.addTarget(self, action: #selector(textChanged), for: for: .editingChanged)
    }
    
    func setupTextField() {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray] )
    }
    
    func setupBottomLine() {
        addSubview(bottomLine)
        bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomLine.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchFieldView: UITextFieldDelegate {
//    @objc func textChanged() {
//        
//    }
}
