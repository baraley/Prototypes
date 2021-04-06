//
//  SMLeftAlignedFlowLayout.swift
//  spothunter_ios
//
//  Created by mac on 27.02.2020.
//  Copyright © 2020 VRGSoft. All rights reserved.
//

import UIKit


final class LeftAlignedFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }

		var result: [UICollectionViewLayoutAttributes] = []

        var currentX: CGFloat = sectionInset.left

        for attribute in attributes {
			let attributeCopy = attribute.copy() as! UICollectionViewLayoutAttributes

            if currentX < attributeCopy.frame.origin.x {

				attributeCopy.frame.origin.x = currentX
            }

            currentX = attributeCopy.frame.maxX + minimumInteritemSpacing

			result.append(attributeCopy)
        }

        return result
    }
}
