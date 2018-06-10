//  ViewController.swift
//  StuffInHand
//
//  Created by Saad Sikandar on 04/06/2018.
//  Copyright © 2018 Saad Sikandar. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var gameCountLabel: UILabel!
    
    @IBOutlet weak var bookCountLabel: UILabel!
    
    @IBOutlet weak var gadgetCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameCountLabel.text = "Total Games: \(game.count)"
        bookCountLabel.text = "Total Books: \(book.count)"
        gadgetCountLabel.text = "Total Gadgets \(gadget.count)"
    }

    // Function to call custom delegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Game Counter Delegate
        if let game_Counter = segue.destination as? AddGamesVC {
            game_Counter.gameCounterDelegate = self
        }
        
        // Book Counter Delgate
        if let book_Counter = segue.destination as? AddBooksVC {
            book_Counter.bookCounterDelegate = self
        }
        
        // Gadget Counter Delegate
        if let gadget_Counter = segue.destination as? AddGadgetsVC {
            gadget_Counter.gadgetCounterDelegate = self
        }
    }
}

extension ViewController: GameCounter {
    // Data parse from AddBooksVC
    func countGames(counter: Int) {
        gameCountLabel.text = "Total Games: \(String(counter))"
    }
}

extension ViewController: BookCounter {
    // Data parse from AddBooksVC
    func countBooks(counter: Int) {
        bookCountLabel.text = "Total Books: \(String(counter))"
    }
}

extension ViewController: GadgetCounter {
    // Data parse from AddGadgetVC
    func countGadgets(counter: Int) {
        gadgetCountLabel.text = "Total Gadgets \(String(counter))"
    }
}
