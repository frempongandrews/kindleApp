//
//  Models.swift
//  kindleApp
//
//  Created by Andrews Frempong on 16/09/2017.
//  Copyright © 2017 Andrews Frempong. All rights reserved.
//

import Foundation

class Book {
    var title: String
    var author: String
    var pages: [Page]
    
    
    init(title: String, author: String, pages:[Page]) {
        self.title = title
        self.author = author
        self.pages = pages
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
