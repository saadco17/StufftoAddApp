//
//  Data.swift
//  StuffInHand
//
//  Created by Saad Sikandar on 04/06/2018.
//  Copyright © 2018 Saad Sikandar. All rights reserved.
//

import Foundation
import UIKit

class Game {
    
    var title: String
    var releaseYear: String
    var console: String

    init(title: String, releaseYear: String, console: String) {
        self.title = title
        self.releaseYear = releaseYear
        self.console = console
    }
}


class Book {
    
    var bookTitle: String?
    var author: String?
    var pages: Int?
    var category: String?
    var publishedDate: String?
    
    init(title: String, author: String, pages: Int, category: String, date: String) {
        self.bookTitle = title
        self.author = author
        self.pages = pages
        self.category = category
        self.publishedDate = date
    }
}

class Gadget {
    
    var model: String
    var type: String
    var year: Int
    
    init(model: String, type: String, year: Int) {
        self.model = model
        self.type = type
        self.year = year
    }
    
}

// Array of Games
var game = [Game]()

var book = [Book]()

var gadget = [Gadget]()

var selectedGameInPickerView: String?

var games = ["God of War", "Tomb Raider"]
var game_releaseYear = [Int]()
var game_console = [String]()

var consoles = ["Play Station 4", "X Box 1", "Nintendo"]

var books = ["Art of War", "4 Hours Work a Week"]

var gadgets = ["iPhone 6", "Apple Watch"]
