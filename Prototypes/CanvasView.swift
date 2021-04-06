//
//  CanvasView.swift
//  Gallery
//
//  Created by Alexander Baraley on 14.01.2020.
//  Copyright © 2020 Alexander Baraley. All rights reserved.
//

import UIKit

protocol PaintingViewProtocol: UIView {

	var containerLayer: CALayer? { get }
}

class CanvasView: UIView {

	// MARK: - Initialization

	private let paintingView: PaintingViewProtocol
	private let scrollView: UIScrollView = UIScrollView(frame: .zero)

	private var paintingViewContentSize: CGSize {
		return paintingView.containerLayer?.frame.size ?? .zero
	}

	init(frame: CGRect, paintingView: PaintingViewProtocol = GroupTreeView()) {

		self.paintingView = paintingView

		super.init(frame: frame)

		initialSetup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Overridden

	override func layoutSubviews() {
		super.layoutSubviews()

		scrollView.frame = bounds

		updateZoomScales()
		centerPaintingView()
	}

	// MARK: - Public
}

// MARK: - Private
private extension CanvasView {

	// MARK: - Setups

	func initialSetup() {

		paintingView.frame.size = paintingViewContentSize

		scrollView.contentSize = paintingViewContentSize
		scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.showsVerticalScrollIndicator = false
		scrollView.contentInsetAdjustmentBehavior = .never
		scrollView.delegate = self

		scrollView.addSubview(paintingView)

		addSubview(scrollView)
	}

	func centerPaintingView() {

		let canvasSize = scrollView.frame.size
		let	contentSize = scrollView.contentSize

		var hInset: CGFloat = (canvasSize.width - contentSize.width) / 2
		var vInset: CGFloat = (canvasSize.height - contentSize.height) / 2

		hInset = hInset > 0 ? hInset : 0
		vInset = vInset > 0 ? vInset : 0

		scrollView.contentInset = UIEdgeInsets(top: vInset, left: hInset, bottom: vInset, right: hInset)
	}

	func updateZoomScales() {
		
		let widthScale = bounds.size.width / paintingViewContentSize.width
		let heightScale = bounds.size.height / paintingViewContentSize.height

		let minScale = min(widthScale, heightScale)

		scrollView.minimumZoomScale = minScale
		scrollView.maximumZoomScale = minScale * 2
		scrollView.zoomScale = minScale
	}
}

// MARK: - UIScrollViewDelegate
extension CanvasView: UIScrollViewDelegate {

	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		paintingView
	}
}
