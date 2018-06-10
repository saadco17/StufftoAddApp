//
//  GamCellViewTable.swift
//  StuffInHandV2
//
//  Created by Saad Sikandar on 08/06/2018.
//  Copyright © 2018 Saad Sikandar. All rights reserved.
//

import UIKit

class GamCellViewTable: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var gameCellTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameCellTable.delegate = self
        gameCellTable.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cellGame") as! GameTableViewCell
        
        let game2 = game[indexPath.row]
        
        cell2.callGameData(game: game2)
        
        return cell2
    }
}
