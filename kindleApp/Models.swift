//
//  Models.swift
//  kindleApp
//
//  Created by Andrews Frempong on 16/09/2017.
//  Copyright © 2017 Andrews Frempong. All rights reserved.
//

import UIKit

class Book {
    var title: String
    var author: String
    var pages: [Page]
    var coverImage: UIImage
    
    
    init(title: String, author: String, pages:[Page], coverImage: UIImage) {
        self.title = title
        self.author = author
        self.pages = pages
        self.coverImage = coverImage
    }
}//end Book class

class Page {
    
    var number: Int
    var text: String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
} //end Page class
