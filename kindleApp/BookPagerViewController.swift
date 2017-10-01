//
//  BookPagerViewController.swift
//  kindleApp
//
//  Created by Andrews Frempong on 01/10/2017.
//  Copyright © 2017 Andrews Frempong. All rights reserved.
//

import UIKit

class BookPagerCollectionViewController: UICollectionViewController {
    
    let cellId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        navigationItem.title = "Book"
        
        //Add to Anki
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        
        //registering cell
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //back to book list
    func goBack () {
        dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .gray
        return cell
        
    }
    
}
