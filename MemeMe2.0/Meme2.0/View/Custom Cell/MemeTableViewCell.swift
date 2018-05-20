//
//  MemeTableViewCell.swift
//  Meme2.0
//
//  Created by Ion M on 5/19/18.
//  Copyright © 2018 Ion M. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var memeIcon: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func layoutSubviews() {
        memeIcon.contentMode = UIViewContentMode.scaleAspectFill
        memeIcon.layer.cornerRadius = memeIcon.frame.size.width/2
        memeIcon.clipsToBounds = true
    }

}
