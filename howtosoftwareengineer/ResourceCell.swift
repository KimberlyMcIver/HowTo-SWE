//
//  ResourceCell.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 11/30/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit

class ResourceCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
