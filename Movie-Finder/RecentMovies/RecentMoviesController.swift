//
//  RecentMoviesController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/24/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class RecentMoviesController: UIViewController {
    let recentMoviesView = RecentMoviesView()
    let dataSource = MoviesDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tab 1"
        recentMoviesView.recentMoviesCollectionView.dataSource = self
        recentMoviesView.recentMoviesCollectionView.delegate = self
        
        recentMoviesView.recentMoviesStackView.nowPlayingButton.addTarget(self, action: #selector(nowPlayingButtonPressed), for: .touchDown)
        recentMoviesView.recentMoviesStackView.comingSoonButton.addTarget(self, action: #selector(comingSoonButtonPressed), for: .touchDown)
    }
    
    @objc func nowPlayingButtonPressed() {
        buttonPressed(button: recentMoviesView.recentMoviesStackView.nowPlayingButton)
    }
    
    @objc func comingSoonButtonPressed() {
        buttonPressed(button: recentMoviesView.recentMoviesStackView.comingSoonButton)
     
    }
    
    func buttonPressed(button: UIButton) {
        let highlightedColor = [NSAttributedString.Key.font: UIFont.genreFont, NSAttributedString.Key.foregroundColor: UIColor.highlightColor]
        let regularColor = [NSAttributedString.Key.font: UIFont.genreFont, NSAttributedString.Key.foregroundColor: UIColor.white]
        if button.tag == 0 {
            recentMoviesView.recentMoviesStackView.firstUnderline.isHidden = false
            recentMoviesView.recentMoviesStackView.secondUnderline.isHidden = true
            
            button.setAttributedTitle(NSAttributedString(string: (button.titleLabel?.text)!, attributes: highlightedColor), for: .normal)
            recentMoviesView.recentMoviesStackView.comingSoonButton.setAttributedTitle(NSAttributedString(string: "Coming Soon", attributes: regularColor), for: .normal)
        } else {
            print("there")
            recentMoviesView.recentMoviesStackView.firstUnderline.isHidden = true
            recentMoviesView.recentMoviesStackView.secondUnderline.isHidden = false
            
            button.setAttributedTitle(NSAttributedString(string: (button.titleLabel?.text)!, attributes: highlightedColor), for: .normal)
            recentMoviesView.recentMoviesStackView.nowPlayingButton.setAttributedTitle(NSAttributedString(string: "Now Playing", attributes: regularColor), for: .normal)
     
            
            //button.titleLabel?.textColor = UIColor.highlightColor
            //recentMoviesView.recentMoviesStackView.nowPlayingButton.setTitleColor(.white, for: .normal)
        }
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        recentMoviesView.recentMoviesStackView.secondUnderline.isHidden = true
    }
    

    override func loadView() {
        view = recentMoviesView
    }
}

extension RecentMoviesController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yo", for: indexPath) as! MovieCell
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width/2.1), height: 300)
    }
}


