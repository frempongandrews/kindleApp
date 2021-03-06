//
//  BookPagerViewController.swift
//  kindleApp
//
//  Created by Andrews Frempong on 01/10/2017.
//  Copyright © 2017 Andrews Frempong. All rights reserved.
//

import UIKit

class BookPagerCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        navigationItem.title = "Book"
        
        //Add to Anki
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleCloseBook))
        
        //registering cell
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
        
        
        //need to access collectionViewLayout parameter
        
        //!!NB: downcast collectionViewLayout parameter to UICollectionViewFlowLayout
        //otherwise there is no acces to scrollDirection property on the layout below
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
        collectionView?.isPagingEnabled = true
        
    }
    
    //back to book list
    func handleCloseBook () {
        dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        pageCell.pageContentLabel.text = "SOME DUMMY TEXT SOME DUMMY TEXT SOME DUMMY TEXT SOME DUMMY TEXT SOME DUMMY TEXT SOME DUMMY TEXT"
        
//        if indexPath.item % 2 == 0 {
//            cell.backgroundColor = .gray
//        } else {
//            cell.backgroundColor = .red
//        }
        
        return pageCell
        
    }
    
    //size for item only with UICollectionViewDelegateFlowLayout protocol
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 20 - 44)
    }
    
}
