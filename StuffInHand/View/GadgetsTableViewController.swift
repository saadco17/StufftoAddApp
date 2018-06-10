//
//  GadgetsTableViewController.swift
//  StuffInHand
//
//  Created by Saad Sikandar on 05/06/2018.
//  Copyright © 2018 Saad Sikandar. All rights reserved.
//

import UIKit

class GadgetsTableViewController: UIViewController {
    
    @IBOutlet weak var gadgetsTable: UITableView!
    
    @IBAction func backHomeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gadgetsTable.delegate = self
        gadgetsTable.dataSource = self
    }
}

extension GadgetsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gadget.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gadgetCell")
        cell?.textLabel?.text = gadgets[indexPath.row]
        return cell!
    }
}
