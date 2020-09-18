//
//  FilterView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/19/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class FilterView: UIView {
    //let dropDownButton = DropDownButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor
        //setupDropDownButton()
    }
    
  //  func setupDropDownButton() {
//        addSubview(dropDownButton)
//
//
//        dropDownButton.topAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
//        dropDownButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        dropDownButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
//        dropDownButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
