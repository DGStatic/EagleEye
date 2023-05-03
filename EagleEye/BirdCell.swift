//
//  BirdCell.swift
//  EagleEye
//
//  Created by Dylan Sharp on 11/14/22.
//

import UIKit

class BirdCell: UITableViewCell {
    
    @IBOutlet weak var comNameLabel: UILabel!
    @IBOutlet weak var sciNameLabel: UILabel!
    @IBOutlet weak var locNameLabel: UILabel!
    @IBOutlet weak var obsDateLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0))
    }
    
}
