//
//  PageCell.swift
//  kindleApp
//
//  Created by Andrews Frempong on 02/10/2017.
//  Copyright © 2017 Andrews Frempong. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let pageContentLabel: UILabel = {
       
        let label = UILabel()
        
        //avoid text truncation
        label.numberOfLines = 0
        
        //deactivate frame layout
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        //print("initializing page cell")
        
        //adding to view
        
        addSubview(pageContentLabel)
        
        //setting constraints
        
        pageContentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        pageContentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        pageContentLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
