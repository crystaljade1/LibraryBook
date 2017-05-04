//
//  Book.swift
//  LibraryBook
//
//  Created by Crystal Jade Allen-Washington on 5/3/17.
//  Copyright © 2017 Crystal Jade Allen-Washington. All rights reserved.
//

import Foundation

class Library {
    
    struct Book {
        var checkedOut: Bool
        var title: String
        var author: String
        var genre: String
        var user: String {
            var userName: String
            var firstName: String
            var lastName: String
            var id: Int
            
            return self.user
        }
        
       public init(checkedOut: Bool,
                   title: String,
                   author: String,
                   genre: String,
                   user: String?) {
            self.checkedOut = checkedOut
            self.title = title
            self.author = author
            self.genre = genre
        }
    }
}

extension Library {
    convenience init?(jsonDictionary: [String: Any]) {
        return nil
    }
    
    var jsonDictionary: [String: Any] {
        return [:]
    }
}

extension Library.Book {
    
    init?(jsonDictionary: [String: Any]) {
        guard let checkedOut = jsonDictionary[Library.Book.checkedOutKey] as? Bool,
            let title = jsonDictionary[Library.Book.titleKey] as? String,
            let author = jsonDictionary[Library.Book.authorKey] as? String,
            let genre = jsonDictionary[Library.Book.genreKey] as? String,
            let user = jsonDictionary[Library.Book.userKey] as? String
            else {
                return nil
        }
        
        self.init(checkedOut: checkedOut,
                  title: title,
                  author: author,
                  genre: genre,
                  user: user)
    }
    
    var jsonDictionary: [String: Any] {
        var back: [String: Any] = [
            Library.Book.checkedOutKey: checkedOut,
            Library.Book.titleKey: title,
            Library.Book.authorKey: author,
            Library.Book.genreKey: genre,
            Library.Book.userKey: user
        ]
        
        return back
    }
    
    
    internal static var checkedOutKey: String = "checked_out"
    internal static var titleKey: String = "title"
    internal static var authorKey: String = "author_key"
    internal static var genreKey: String = "genre"
    internal static var userKey: String = "user"
    
}


































