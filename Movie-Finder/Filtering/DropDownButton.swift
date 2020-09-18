//
//  DropDownButton.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/19/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class DropDownButton: UIButton {
   let dropDownView = DropDownView()
    var height = NSLayoutConstraint()
    var isOpen = false
    
    let dropDownArrow: UIImageView = {
        let image = UIImage(named: "Arrow")
        let arrow = UIImageView(image: image)
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        dropDownView.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = UIColor.accentColor
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 5
        
//        self.layer.shadowColor = UIColor.lightGray.cgColor
//        self.layer.shadowOffset = CGSize(width: 2, height: 2)
//        self.layer.shadowRadius = 2
//        self.layer.shadowOpacity = 0.75
        
        self.setTitle("    Sort by", for: .normal)
        //self.setTitleColor(.black, for: .normal)
        self.contentHorizontalAlignment = .left
        self.titleLabel?.font =  UIFont(name: "HelveticaNeue-Medium", size: 12)

        setup()
        setupImage()
    }
    
    func setup() {
        self.addSubview(dropDownView)
        dropDownView.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true
        dropDownView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropDownView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropDownView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    func setupImage() {
        addSubview(dropDownArrow)
        
        dropDownArrow.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        dropDownArrow.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            isOpen = true
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 220
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                self.dropDownView.layoutIfNeeded()
                self.dropDownView.center.y += self.dropDownView.frame.height / 2
            }, completion: nil)

        } else {
            isOpen = false
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                self.dropDownView.center.y -= self.dropDownView.frame.height / 2
                self.dropDownView.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
