//
//  GameTableViewCell.swift
//  StuffInHandV2
//
//  Created by Saad Sikandar on 08/06/2018.
//  Copyright © 2018 Saad Sikandar. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelYear: UILabel!
    
    @IBOutlet weak var labelConsole: UILabel!
    
    func callGameData(game: Game) {
        labelTitle.text = game.title
        labelYear.text = "\(game.releaseYear)"
        //labelYear.text = String(game.releaseYear)
        labelConsole.text = game.console
    }
}
