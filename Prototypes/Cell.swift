//
//  Cell.swift
//  CollectionView
//
//  Created by Alexander Baraley on 20.04.2021.
//

import UIKit

class Cell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = 15

        updateSelectionState()
    }

    override var isSelected: Bool {
        didSet {
            updateSelectionState()
        }
    }

    private func updateSelectionState() {

        layer.borderWidth = isSelected ? 3 : 1
        layer.borderColor = isSelected ? UIColor.systemGreen.cgColor : UIColor.lightGray.cgColor
    }
}
