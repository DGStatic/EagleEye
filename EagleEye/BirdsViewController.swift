//
//  ViewController.swift
//  EagleEye
//
//  Created by Dylan Sharp on 11/7/22.
//

import UIKit

class BirdsViewController: UITableViewController {

    
    var store: BirdStore!
    let dataSource = BirdDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "EagleEye"
        // Do any additional setup after loading the view.
        self.tableView.dataSource = dataSource
        //tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 95
        
        store.fetchBirds {
            (birdsResult) in
            
            switch birdsResult {
            case let .success(birds):
                print("Successfully found \(birds.count) birds.")
                self.dataSource.birds = birds
            case let .failure(error):
                print("Error fetching birds: \(error)")
                self.dataSource.birds.removeAll()
            }
            self.tableView.reloadData()
    
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showBirdLoc":
            if let selectedIndexPath =
                tableView.indexPathForSelectedRow {

                let bird = dataSource.birds[selectedIndexPath.row]

                let destinationVC = segue.destination as! BirdMapController
                destinationVC.bird = bird
                destinationVC.store = store
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    
    
    


}

