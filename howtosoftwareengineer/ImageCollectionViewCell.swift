//
//  ImageCollectionViewCell.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 11/30/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
}
