//
//  UILabel.swift
//  Prototypes
//
//  Created by Alexander Baraley on 30.05.2021.
//

import UIKit

extension UILabel {

    func indexOfCharacter(at point: CGPoint) -> Int? {
        guard let attributedText = attributedText else { return nil }

        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: attributedText)

        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        textContainer.lineFragmentPadding = .zero
        textContainer.lineBreakMode = lineBreakMode
        textContainer.maximumNumberOfLines = numberOfLines
        textContainer.size = bounds.size

        let textContainerOffset = textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines).origin
        let locationOfTouchInTextContainer = CGPoint(x: point.x - textContainerOffset.x, y: point.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer,
                                                            in: textContainer,
                                                            fractionOfDistanceBetweenInsertionPoints: nil)
        return indexOfCharacter
    }

}

func labelDidTap(_ sender: UIGestureRecognizer) {

    let tappedLabel = UILabel()

    let message = "sample tapping text"
    let tappingTextRange = (message as NSString).range(of: "clickable")
    let tapLocation = sender.location(in: tappedLabel)

    guard let characterIndex = tappedLabel.indexOfCharacter(at: tapLocation),
          tappingTextRange.contains(characterIndex)
    else { return }

    // Specified text was tapped
}
