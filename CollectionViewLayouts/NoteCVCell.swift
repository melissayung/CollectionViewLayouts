//
//  NoteCVCell.swift
//  CollectionViewLayouts
//
//  Created by Melissa Yung on 22/10/16.
//  Copyright © 2016 MY. All rights reserved.
//

import UIKit

final class NoteCVCell: UICollectionViewCell {

    static let ReuseIdentifier = "NoteCVCell"
    static let NibName = "NoteCVCell"
    
    static let InnerCellPadding = 10 + 10 // This is the horizontal inner cell padding
    static let TotalVerticalSpacing = 10 + 10 + 10 // This is the total vertical spacing i.e. spacing between the top of the cell and the title label + spacing between the title and text label + spacing between the text label and the bottom of the cell
    
    static let TitleFont = UIFont.systemFont(ofSize: 17)
    static let TextFont = UIFont.systemFont(ofSize: 14)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = NoteCVCell.TitleFont
        textLabel.font = NoteCVCell.TextFont
    }
    
    func configure(withTitle title:String, text:String) {
        titleLabel.text = title
        textLabel.text = text
    }
}
