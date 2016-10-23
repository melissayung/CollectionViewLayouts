//
//  GridFixedSizeVC.swift
//  CollectionViewLayouts
//
//  Created by Melissa Yung on 22/10/16.
//  Copyright © 2016 MY. All rights reserved.
//

import UIKit

final class GridFixedSizeVC: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var datasource: NotesDatasource = NotesDatasource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: NoteCVCell.NibName, bundle: nil), forCellWithReuseIdentifier: NoteCVCell.ReuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension GridFixedSizeVC: UICollectionViewDataSource {
    
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

