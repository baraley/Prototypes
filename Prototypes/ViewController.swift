//
//  ViewController.swift
//  Prototypes
//
//  Created by Alexander Baraley on 06.04.2021.
//

import UIKit

class ViewController: UIViewController {

	private lazy var canvasView: UIView = CanvasView(frame: view.bounds)

	override func viewDidLoad() {
		super.viewDidLoad()

		canvasView.center = view.center
		canvasView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

		view.addSubview(canvasView)
	}
}

extension UIColor {
	static var random: UIColor {
		return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
	}
}
