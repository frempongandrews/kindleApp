//
//  ViewController.swift
//  kindleApp
//
//  Created by Andrews Frempong on 16/09/2017.
//  Copyright © 2017 Andrews Frempong. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cell"
    
    var booksArr: [Book]?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let books = self.booksArr {
            let count = books.count
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .green
        cell.selectionStyle = .none
        
        guard let books = self.booksArr else {return cell}
        
        cell.textLabel?.text = "Hello"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Kindle"
//        view.backgroundColor = .blue
        
        //registering cell
        
        tableView.register(CustomBookCell.self, forCellReuseIdentifier: cellId)
        
        setupBooks()
        
        
    } //end viewDidLoad
    
    func setupBooks () {
        
        let book1 = Book(title: "Steve Jobs", author: "Walter Isaacson", pages: [])
        
        let book1Page1 = Page(number: 1, text: "This is the first page of book1")
        book1.pages.append(book1Page1)
        
        //print(book1.pages[0].number ,book1.pages[0].text)
        
        let book2 = Book(title: "Bill Gates: A Biography", author: "Micheal Becraft", pages: [])
        book2.pages.append(Page(number: 1, text: "This is the first page of book 2"))
        book2.pages.append(Page(number: 2, text: "This is the second page of book2"))
        
        
        //list of books
        self.booksArr = [book1, book2]
        
    }


}

//<!--  Custom cell class-->

class CustomBookCell: UITableViewCell {
    
    let bookCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        
        //removing frame layout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let bookTitleLabel: UILabel = {
        let label = UILabel()
        
        //removing frame layout
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //print("inizializing custom cell")
        
        //adding cover to view
        addSubview(bookCoverImageView)
        
        bookCoverImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        bookCoverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        bookCoverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        bookCoverImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

