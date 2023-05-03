//
//  BirdDataSource.swift
//  EagleEye
//
//  Created by Dylan Sharp on 11/14/22.
//

import UIKit

class BirdDataSource: NSObject, UITableViewDataSource {

    var birds = [Bird]()
    
    func tableView(_ tableView: UITableView,
            numberOfRowsInSection section: Int) -> Int {
        return birds.count
    }
    
    func tableView(_ tableView: UITableView,
            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BirdCell", for: indexPath) as! BirdCell
        let bird = birds[indexPath.row]

        cell.comNameLabel.text = bird.comName
        cell.sciNameLabel.text = bird.sciName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        cell.obsDateLabel.text = dateFormatter.string(from: bird.obsDt)
        cell.locNameLabel.text = bird.locName
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        

        return cell
    }

}
