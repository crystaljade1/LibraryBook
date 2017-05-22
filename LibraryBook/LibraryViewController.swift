//
//  LibraryViewController.swift
//  LibraryBook
//
//  Created by Crystal Jade Allen-Washington on 5/3/17.
//  Copyright © 2017 Crystal Jade Allen-Washington. All rights reserved.
//

import UIKit


public class LibraryViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var libraryBooks: [Library.Book] = []
    var users: [Library.User] = []
    
    var libraryBookIndex: Int = 0 {
        didSet {
            if libraryBookIndex >= libraryBooks.count {
                libraryBookIndex %= libraryBooks.count
            }
            while libraryBookIndex < 0 {
                libraryBookIndex += libraryBooks.count
            }
        }
    }
    
    var currentBook: Library.Book {
        return libraryBooks[libraryBookIndex]
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        updateView(bookIndex: libraryBookIndex)
    }
    
    
    @IBAction func previousBook(_ sender: UIButton) {
        let previousLibraryBookIndex = libraryBookIndex - 1
        updateView(bookIndex: previousLibraryBookIndex)
    }
    
    @IBAction func nextBook(_ sender: UIButton) {
        let nextLibraryBookIndex = libraryBookIndex + 1
        updateView(bookIndex: nextLibraryBookIndex)
    }
    
    
    func updateView(bookIndex: Int) {
        titleLabel.text = Library.Book.titleKey
        authorLabel.text = Library.Book.authorKey
        genreLabel.text = Library.Book.genreKey
        statusLabel.text = Library.Book.checkedOutKey
    }
    
}
