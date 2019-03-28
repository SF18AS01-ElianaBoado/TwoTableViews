//
//  TwoTableViewController.swift
//  TwoTableViews
//
//  Created by Eliana Boado on 3/1/19.
//  Copyright © 2019 Eliana Boado. All rights reserved.
//

import UIKit

class TwoTableViewController: UITableViewController {
    
    var foods: [String] = [   //the model
        "Cereal",
        "Milk",
        "Apple",
        "Sandwich",
        "Salad",
        "Pizza"
    ];
    
    var tableViews: [UITableView] = [UITableView](); //will be an array of 2 UITableView's
   
    var titles: [String] = [              //for navigationItem of each UITableView
        "Table View with 3 Sections",
        "Table View with 2 Sections"
    ];
    
    var headers: [[String]] =  [
        ["Breakfast", "Lunch", "Dinner"], //UITableView with 3 sections
        ["Morning", "Afternoon"]          //UITableView with 2 sections
    ];
    
    var currentTableView: Int = 0;        //in the range 0 ..< tableViews.count

    override func viewDidLoad() {
        super.viewDidLoad();
        
        tableViews.append(tableView);
        let secondTableView: UITableView = UITableView(frame: tableView.frame, style: .grouped);
        secondTableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier1");
        secondTableView.rowHeight = 56.0;
        tableViews.append(secondTableView);

        navigationItem.title = titles[currentTableView];
    }

    @IBAction func swapButtonPressed(_ sender: UIBarButtonItem) {
        //Make the next tableView the current one.
        currentTableView += 1;
        currentTableView %= tableViews.count;
        
        tableView = tableViews[currentTableView];
        navigationItem.title = titles[currentTableView];
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return headers[currentTableView].count;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentTableView {
        case 0:
            return 2;
        case 1:
            return 3;
        default:
            fatalError("There is no tableView number \(currentTableView).");
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier\(currentTableView)", for: indexPath)

        // Configure the cell...
        let i: Int;   //Which food is displayed in this cell?
        
        switch currentTableView {
        case 0:
            i = 2 * indexPath.section + indexPath.row;
        case 1:
            i = 3 * indexPath.section + indexPath.row;
        default:
            fatalError("There is no tableView number \(currentTableView).");
        }

        cell.textLabel?.text = foods[i];
        cell.detailTextLabel?.text = "\(foods[i]) (food \(i) of \(foods.count)) is cell \(indexPath.row) in section \(indexPath.section).";
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[currentTableView][section];
    }

}
