//
//  MemeCollectionViewCell.swift
//  Meme2.0
//
//  Created by Ion M on 5/19/18.
//  Copyright © 2018 Ion M. All rights reserved.
//

import UIKit

class MemeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        memeImageView.contentMode = UIViewContentMode.scaleAspectFill
        memeImageView.layer.cornerRadius = memeImageView.frame.size.width/2
        memeImageView.clipsToBounds = true
    }
}
