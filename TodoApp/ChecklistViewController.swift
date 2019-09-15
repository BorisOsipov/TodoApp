//
//  ViewController.swift
//  TodoApp
//
//  Created by Admin on 08/09/2019.
//  Copyright © 2019 Boris Osipov. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        if let label = cell.viewWithTag(1000) as? UILabel {

            if(indexPath.row % 5 == 0) {
                label.text = "Take a dog"
            } else if(indexPath.row % 4 == 0) {
                label.text = "Watch a movie"
            } else if(indexPath.row % 3 == 0) {
                label.text = "Code an app"
            } else if(indexPath.row % 2 == 0) {
                label.text = "Walk a dog"
            } else if(indexPath.row % 1 == 0) {
                label.text = "Code an app"
            }

        }

        return cell;
    }
}

