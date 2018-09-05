//
//  AnnotatedPhotoCell.swift
//  GridListFlowLayout
//
//  Created by Thành Lã on 9/5/18.
//  Copyright © 2018 MonstarLab. All rights reserved.
//

import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
    }
}
