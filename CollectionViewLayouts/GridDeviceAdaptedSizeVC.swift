//
//  GridDeviceAdaptedSizeVC.swift
//  CollectionViewLayouts
//
//  Created by Melissa Yung on 22/10/16.
//  Copyright © 2016 MY. All rights reserved.
//

import UIKit

final class GridDeviceAdaptedSizeVC: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var datasource: NotesDatasource = NotesDatasource()
    fileprivate var squareCellDimension: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: NoteCVCell.NibName, bundle: nil), forCellWithReuseIdentifier: NoteCVCell.ReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // A. We calculate the cellWidth as required. For example we want to make the the cell as wide as the device width will allow
        squareCellDimension = 0.75 * UIScreen.main.bounds.width
    }
}

// B. We return the item size from the UICollectionViewDelegateFlowLayout delegate method. We also want the cell to be a square
extension GridDeviceAdaptedSizeVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: squareCellDimension, height: squareCellDimension)
    }
}

extension GridDeviceAdaptedSizeVC: UICollectionViewDataSource {
    
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
