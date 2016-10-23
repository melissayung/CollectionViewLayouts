//
//  WaterfallLayout.swift
//  CollectionViewLayouts
//
//  From https://www.raywenderlich.com/107439/uicollectionview-custom-layout-tutorial-pinterest
//

import UIKit

protocol WaterfallLayoutDelegate {
    func collectionView(collectionView:UICollectionView, heightForCellAtIndexPath indexPath:IndexPath, withWidth:CGFloat) -> CGFloat
}

final class WaterfallLayout: UICollectionViewLayout {

    var delegate: WaterfallLayoutDelegate!
    
    var numberOfColumns = 2
    var intraCellPadding: CGFloat = 6.0
    
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentHeight: CGFloat  = 0.0
    private var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
    }
    
    override func prepare() {
        
        if cache.isEmpty {
            
            let columnWidth = contentWidth / CGFloat(numberOfColumns)
            var xOffset = [CGFloat]()
            
            // calculate where the cells should start
            for column in 0 ..< numberOfColumns {
                xOffset.append(CGFloat(column) * columnWidth )
            }
            var column = 0
            var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
            
            for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
                
                let indexPath = IndexPath(item: item, section: 0)
                
                let width = columnWidth - intraCellPadding * 2 - CGFloat(NoteCVCell.InnerCellPadding)
                
                let cellHeight = intraCellPadding + delegate.collectionView(collectionView: collectionView!, heightForCellAtIndexPath: indexPath, withWidth:width) + intraCellPadding
                
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: cellHeight)
                let insetFrame = frame.insetBy(dx: intraCellPadding, dy: intraCellPadding)
                
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                cache.append(attributes)
                
                contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + cellHeight
                
                column = column >= (numberOfColumns - 1) ? 0 : (column + 1)
            }
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
}
