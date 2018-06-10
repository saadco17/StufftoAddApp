//  GamesTableViewController.swift
//  StuffInHand
//
//  Created by Saad Sikandar on 04/06/2018.
//  Copyright © 2018 Saad Sikandar. All rights reserved.
//

import UIKit

class GamesTableViewController: UIViewController {

    @IBOutlet weak var gamesTable: UITableView!

    @IBAction func backtoHomeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamesTable.delegate = self
        gamesTable.dataSource = self
    }
}

extension GamesTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell")
        cell?.textLabel?.text = game[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game.count
    }
}
