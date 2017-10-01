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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomBookCell
        
        cell.selectionStyle = .none
        
        if let books = self.booksArr {
           let book = books[indexPath.row]
            cell.bookTitleLabel.text = book.title
            cell.bookCoverImageView.image = book.coverImage
            cell.bookAuthorLabel.text = book.author
        }
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("hello")
        let layout = UICollectionViewFlowLayout()

        let bookPagerCollectionViewController = BookPagerCollectionViewController(collectionViewLayout: layout)
        let navigationController = UINavigationController(rootViewController: bookPagerCollectionViewController)
        present(navigationController, animated: true, completion: nil)
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
        
        let book1 = Book(title: "Steve Jobs", author: "Walter Isaacson", pages: [], coverImage: #imageLiteral(resourceName: "steve_jobs"))
        
        let book1Page1 = Page(number: 1, text: "This is the first page of book1")
        book1.pages.append(book1Page1)
        
        //print(book1.pages[0].number ,book1.pages[0].text)
        
        let book2 = Book(title: "Bill Gates: A Biography", author: "Micheal Becraft", pages: [], coverImage: #imageLiteral(resourceName: "bill_gates"))
        book2.pages.append(Page(number: 1, text: "This is the first page of book 2"))
        book2.pages.append(Page(number: 2, text: "This is the second page of book2"))
        
        
        //list of books
        self.booksArr = [book1, book2]
        
    }


} //<-- End of books table view controller -->


//<-- --------------------------------------------------- -->


//<!--  Custom cell class-->

class CustomBookCell: UITableViewCell {
    
    let bookCoverImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
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
    
    let bookAuthorLabel: UILabel = {
        let label = UILabel()
        
        
        //disable frame layout
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //print("inizializing custom cell")
        
        //adding ui elements(cover image, title) to view
        
        addSubview(bookCoverImageView)
        addSubview(bookTitleLabel)
        addSubview(bookAuthorLabel)
        
        //book cover constraints
        bookCoverImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        bookCoverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        bookCoverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        bookCoverImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        //book title constraints
        bookTitleLabel.leftAnchor.constraint(equalTo: bookCoverImageView.rightAnchor, constant: 8).isActive = true
        bookTitleLabel.centerYAnchor.constraint(equalTo: bookCoverImageView.centerYAnchor , constant: -10).isActive = true
        
        //book author constraints
        bookAuthorLabel.leftAnchor.constraint(equalTo: bookTitleLabel.leftAnchor, constant: 0).isActive = true
        bookAuthorLabel.topAnchor.constraint(equalTo: bookTitleLabel.bottomAnchor, constant: 4).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

