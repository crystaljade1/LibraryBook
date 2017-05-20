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
        var user: User?
        
        
        public init(checkedOut: Bool,
                    title: String,
                    author: String,
                    genre: String,
                    user: User?) {
            self.checkedOut = checkedOut
            self.title = title
            self.author = author
            self.genre = genre
            self.user = user
        }
        
    }
    
    struct User {
        var userName: String
        var firstName: String
        var lastName: String
        var id: Int
        
        public init(userName: String,
                    firstName: String,
                    lastName: String,
                    id: Int) {
            self.userName = userName
            self.firstName = firstName
            self.lastName = lastName
            self.id = id
        }
    }
    
}


extension Library.Book {
    
    init?(jsonDictionary: [String: Any]) {
        guard let checkedOut = jsonDictionary[Library.Book.checkedOutKey] as? Bool,
            let title = jsonDictionary[Library.Book.titleKey] as? String,
            let author = jsonDictionary[Library.Book.authorKey] as? String,
            let genre = jsonDictionary[Library.Book.genreKey] as? String
            else {
                return nil
        }
        
        let _user: Library.User?
        
        if let userDictionary = jsonDictionary[Library.Book.userKey] as? [String: Any] {
            _user = Library.User(jsonDictionary: userDictionary)
        } else {
            _user = nil
        }
        
        self.init(checkedOut: checkedOut,
                  title: title,
                  author: author,
                  genre: genre,
                  user: _user)
    }
    
    internal static var checkedOutKey: String = "checkedOut"
    internal static var titleKey: String = "title"
    internal static var authorKey: String = "author"
    internal static var genreKey: String = "genre"
    internal static var userKey: String = "user"
}

extension Library.User {
    
    init?(jsonDictionary: [String: Any]) {
        guard let userName = jsonDictionary[Library.User.userNameKey] as? String,
            let firstName = jsonDictionary[Library.User.firstNameKey] as? String,
            let lastName = jsonDictionary[Library.User.lastNameKey] as? String,
            let id = jsonDictionary[Library.User.idKey] as? Int
            else {
                return nil
        }
        
        self.init(userName: userName,
                  firstName: firstName,
                  lastName: lastName,
                  id: id)
    }
    
    internal static var userNameKey: String = "userName"
    internal static var firstNameKey: String = "firstName"
    internal static var lastNameKey: String = "lastName"
    internal static var idKey: String = "id"
}
