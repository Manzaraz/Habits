//
//  FollowedUserCollectionViewCell.swift
//  Habits
//
//  Created by Christian Manzaraz on 06/08/2023.
//

import UIKit

class FollowedUserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var primaryTextLabel: UILabel!
    @IBOutlet var secondaryTextLabel: UILabel!
    @IBOutlet var separatorLineView: UIView!
    @IBOutlet var separatorLineHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        separatorLineHeightConstraint.constant = 1 / UITraitCollection.current.displayScale
    }
    
}
