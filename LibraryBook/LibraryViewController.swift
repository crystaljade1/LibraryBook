//
//  LibraryViewController.swift
//  LibraryBook
//
//  Created by Crystal Jade Allen-Washington on 5/3/17.
//  Copyright © 2017 Crystal Jade Allen-Washington. All rights reserved.
//

import UIKit


class LibraryViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    var libraryBooks: [Library.Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        titleLabel.text = Library.Book.titleKey
        authorLabel.text = Library.Book.authorKey
        genreLabel.text = Library.Book.genreKey
        statusLabel.text = Library.Book.checkedOutKey
    }
    
    
    
}
