//
//  StretchyHeaderLayout.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor Personal on 28/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: LTCollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ attributes in
            if attributes.representedElementKind == UICollectionElementKindSectionHeader &&
                attributes.indexPath.section == 0 {
                
                guard let collectionView = collectionView else {
                    return
                }
                
                let contentOffsetY = collectionView.contentOffset.y
                
                if contentOffsetY > 0 {
                    return
                }
                
                let width = collectionView.frame.width
                let height = attributes.frame.height - contentOffsetY
                
                // Header
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}
