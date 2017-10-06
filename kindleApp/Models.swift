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
    
    
    //secondary constructor for fetching books
    
    init (dictionary: [String: Any]) {
        
        self.title = dictionary["title"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        self.pages = [Page]()
        
        if let pages = dictionary["pages"] as? [[String: Any]] {
            
            for page in pages {
                
                if let bookPageContent = page["text"] as? String {
                    let bookPages = Page(number: 1, text: bookPageContent)
                    
                    //setting pages
                    self.pages.append(bookPages)
                }
                
            }//<!-- end for loop -->
            
        }// <!-- end if let pages -->
        
        self.coverImage = #imageLiteral(resourceName: "steve_jobs")
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
