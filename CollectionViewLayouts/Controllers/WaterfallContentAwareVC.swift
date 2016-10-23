//
//  WaterfallContentAwareVC.swift
//  CollectionViewLayouts
//
//  Created by Melissa Yung on 22/10/16.
//  Copyright © 2016 MY. All rights reserved.
//

import UIKit

final class WaterfallContentAwareVC: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var datasource: NotesDatasource = NotesDatasource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView?.collectionViewLayout as? WaterfallLayout {
            layout.delegate = self
        }
        collectionView.register(UINib(nibName: NoteCVCell.NibName, bundle: nil), forCellWithReuseIdentifier: NoteCVCell.ReuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension WaterfallContentAwareVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoteCVCell.ReuseIdentifier, for: indexPath) as! NoteCVCell
        cell.configure(withTitle: datasource.title(atIndex: indexPath.row), text: datasource.text(atIndex: indexPath.row))
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.numberOfItems
    }
}

extension WaterfallContentAwareVC: WaterfallLayoutDelegate {
    
    func collectionView(collectionView: UICollectionView, heightForCellAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        
        let title = datasource.title(atIndex: indexPath.row)
        let text = datasource.text(atIndex: indexPath.row)
        
        let titleRect = NSString(string: title).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: NoteCVCell.TitleFont], context: nil)
        let textRect = NSString(string: text).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: NoteCVCell.TextFont], context: nil)
        
        return ceil(titleRect.height) + ceil(textRect.height) + CGFloat(NoteCVCell.TotalVerticalSpacing)
    }
}
