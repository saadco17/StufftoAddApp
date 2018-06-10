//
//  BooksTableViewController.swift
//  StuffInHand
//
//  Created by Saad Sikandar on 05/06/2018.
//  Copyright © 2018 Saad Sikandar. All rights reserved.
//

import UIKit

class BooksTableViewController: UIViewController {

    @IBOutlet weak var booksTable: UITableView!

    @IBAction func backHomeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        booksTable.delegate = self
        booksTable.dataSource = self
    }
}

extension BooksTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return book.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell")
        cell?.textLabel?.text = books[indexPath.row]
        return cell!
    }
}
