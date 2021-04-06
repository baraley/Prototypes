//
//  GroupTreeViews.swift
//  Exported from Kite Compositor for Mac 2.0.2
//
//  Created on 26.03.2021, 11:00.
//


import UIKit

class GroupTreeView: UIView, PaintingViewProtocol {

	var containerLayer: CALayer? {
		layer.sublayers?.first
	}

    // MARK: - Initialization

	init()
	{
		super.init(frame: CGRect(x: 0, y: 0, width: 900, height: 600))
		self.setupLayers()
	}

	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		self.setupLayers()
	}

	// MARK: - Setup Layers

	private func setupLayers()
	{
		// Colors
		//
		let fillColor = UIColor(red: 0.878431, green: 0.878431, blue: 0.878431, alpha: 1)
		let strokeColor = UIColor.black

		// Paths
		//
		let rectanglePath = CGMutablePath()
		rectanglePath.move(to: CGPoint(x: 0, y: 0))
		rectanglePath.addLine(to: CGPoint(x: 59.702999, y: 0))
		rectanglePath.addLine(to: CGPoint(x: 59.702999, y: 59.702999))
		rectanglePath.addLine(to: CGPoint(x: 0, y: 59.702999))
		rectanglePath.addLine(to: CGPoint(x: 0, y: 0))
		rectanglePath.closeSubpath()
		rectanglePath.move(to: CGPoint(x: 0, y: 0))
		rectanglePath.closeSubpath()
		rectanglePath.move(to: CGPoint(x: 0, y: 0))

		let pathPath = CGMutablePath()
		pathPath.move(to: CGPoint(x: 107.945, y: 9.721))
		pathPath.addLine(to: CGPoint(x: 107.945999, y: 9.72))
		pathPath.addCurve(to: CGPoint(x: 131.203003, y: 0.87), control1: CGPoint(x: 113.241997, y: 3.849), control2: CGPoint(x: 122.189003, y: 0.87))
		pathPath.addCurve(to: CGPoint(x: 154.460999, y: 9.72), control1: CGPoint(x: 140.218002, y: 0.87), control2: CGPoint(x: 149.164993, y: 3.849))
		pathPath.addLine(to: CGPoint(x: 154.460999, y: 9.721))
		pathPath.addLine(to: CGPoint(x: 257.59201, y: 123.915001))
		pathPath.addLine(to: CGPoint(x: 257.595001, y: 123.918999))
		pathPath.addCurve(to: CGPoint(x: 261.628998, y: 133.272995), control1: CGPoint(x: 260.372009, y: 126.939003), control2: CGPoint(x: 261.615997, y: 130.156006))
		pathPath.addCurve(to: CGPoint(x: 258.169006, y: 142.184006), control1: CGPoint(x: 261.640991, y: 136.393005), control2: CGPoint(x: 260.417999, y: 139.464005))
		pathPath.addCurve(to: CGPoint(x: 234.335007, y: 151.628998), control1: CGPoint(x: 253.662994, y: 147.632004), control2: CGPoint(x: 245.063004, y: 151.628998))
		pathPath.addLine(to: CGPoint(x: 27.794001, y: 151.628998))
		pathPath.addCurve(to: CGPoint(x: 3.96, y: 142.184998), control1: CGPoint(x: 17.065001, y: 151.628998), control2: CGPoint(x: 8.466, y: 147.632004))
		pathPath.addCurve(to: CGPoint(x: 0.5, y: 133.272995), control1: CGPoint(x: 1.71, y: 139.464005), control2: CGPoint(x: 0.488, y: 136.393005))
		pathPath.addCurve(to: CGPoint(x: 4.534, y: 123.918999), control1: CGPoint(x: 0.513, y: 130.156006), control2: CGPoint(x: 1.757, y: 126.939003))
		pathPath.addLine(to: CGPoint(x: 4.536, y: 123.916))
		pathPath.addLine(to: CGPoint(x: 107.945, y: 9.721))
		pathPath.closeSubpath()
		pathPath.move(to: CGPoint(x: 107.945, y: 9.721))

		let pathPath1 = CGMutablePath()
		pathPath1.move(to: CGPoint(x: 88.401001, y: 8.618))
		pathPath1.addLine(to: CGPoint(x: 88.402, y: 8.617))
		pathPath1.addCurve(to: CGPoint(x: 107.18, y: 1.408), control1: CGPoint(x: 92.670998, y: 3.839), control2: CGPoint(x: 99.891998, y: 1.408))
		pathPath1.addCurve(to: CGPoint(x: 125.959, y: 8.617), control1: CGPoint(x: 114.468002, y: 1.408), control2: CGPoint(x: 121.690002, y: 3.839))
		pathPath1.addLine(to: CGPoint(x: 125.959, y: 8.617))
		pathPath1.addLine(to: CGPoint(x: 209.550003, y: 102.049004))
		pathPath1.addLine(to: CGPoint(x: 209.552994, y: 102.053001))
		pathPath1.addCurve(to: CGPoint(x: 212.798996, y: 109.646004), control1: CGPoint(x: 211.789993, y: 104.509003), control2: CGPoint(x: 212.789001, y: 107.121002))
		pathPath1.addCurve(to: CGPoint(x: 210.014008, y: 116.882004), control1: CGPoint(x: 212.809006, y: 112.176003), control2: CGPoint(x: 211.826996, y: 114.669998))
		pathPath1.addCurve(to: CGPoint(x: 190.770996, y: 124.573997), control1: CGPoint(x: 206.384003, y: 121.311996), control2: CGPoint(x: 199.444, y: 124.573997))
		pathPath1.addLine(to: CGPoint(x: 23.364, y: 124.573997))
		pathPath1.addCurve(to: CGPoint(x: 4.121, y: 116.882004), control1: CGPoint(x: 14.691, y: 124.573997), control2: CGPoint(x: 7.751, y: 121.311996))
		pathPath1.addCurve(to: CGPoint(x: 1.336, y: 109.647003), control1: CGPoint(x: 2.308, y: 114.669998), control2: CGPoint(x: 1.327, y: 112.176003))
		pathPath1.addCurve(to: CGPoint(x: 4.582, y: 102.053001), control1: CGPoint(x: 1.347, y: 107.121002), control2: CGPoint(x: 2.345, y: 104.509003))
		pathPath1.addLine(to: CGPoint(x: 4.585, y: 102.050003))
		pathPath1.addLine(to: CGPoint(x: 88.401001, y: 8.618))
		pathPath1.closeSubpath()
		pathPath1.move(to: CGPoint(x: 88.401001, y: 8.618))

		let pathPath2 = CGMutablePath()
		pathPath2.move(to: CGPoint(x: 65.342003, y: 5.745))
		pathPath2.addLine(to: CGPoint(x: 65.342003, y: 5.744))
		pathPath2.addCurve(to: CGPoint(x: 79.148003, y: 0.5), control1: CGPoint(x: 68.470001, y: 2.276), control2: CGPoint(x: 73.775002, y: 0.5))
		pathPath2.addCurve(to: CGPoint(x: 92.954002, y: 5.744), control1: CGPoint(x: 84.521004, y: 0.5), control2: CGPoint(x: 89.827003, y: 2.276))
		pathPath2.addLine(to: CGPoint(x: 92.954002, y: 5.744))
		pathPath2.addLine(to: CGPoint(x: 154.832993, y: 74.261002))
		pathPath2.addLine(to: CGPoint(x: 154.835999, y: 74.264))
		pathPath2.addCurve(to: CGPoint(x: 157.203003, y: 79.741997), control1: CGPoint(x: 156.473007, y: 76.044998), control2: CGPoint(x: 157.195999, y: 77.929001))
		pathPath2.addCurve(to: CGPoint(x: 155.173004, y: 84.960999), control1: CGPoint(x: 157.210999, y: 81.559998), control2: CGPoint(x: 156.498993, y: 83.358002))
		pathPath2.addCurve(to: CGPoint(x: 141.026993, y: 90.555), control1: CGPoint(x: 152.516006, y: 88.174004), control2: CGPoint(x: 147.419006, y: 90.555))
		pathPath2.addLine(to: CGPoint(x: 17.103001, y: 90.555))
		pathPath2.addCurve(to: CGPoint(x: 2.956, y: 84.960999), control1: CGPoint(x: 10.71, y: 90.555), control2: CGPoint(x: 5.613, y: 88.174004))
		pathPath2.addCurve(to: CGPoint(x: 0.926, y: 79.741997), control1: CGPoint(x: 1.631, y: 83.358002), control2: CGPoint(x: 0.919, y: 81.559998))
		pathPath2.addCurve(to: CGPoint(x: 3.294, y: 74.264999), control1: CGPoint(x: 0.934, y: 77.929001), control2: CGPoint(x: 1.657, y: 76.044998))
		pathPath2.addLine(to: CGPoint(x: 3.296, y: 74.262001))
		pathPath2.addLine(to: CGPoint(x: 65.342003, y: 5.745))
		pathPath2.closeSubpath()
		pathPath2.move(to: CGPoint(x: 65.342003, y: 5.745))

		// Group 861
		//
		let groupLayer = CALayer()
		groupLayer.name = "Group 861"
		groupLayer.bounds = CGRect(x: 0, y: 0, width: 262, height: 298)
		groupLayer.position = CGPoint(x: 0, y: 0)
		groupLayer.anchorPoint = CGPoint(x: 0, y: 0)
		groupLayer.contentsGravity = .center
		groupLayer.contentsScale = 2
		groupLayer.allowsEdgeAntialiasing = true
		groupLayer.allowsGroupOpacity = true

		// Group 861 Sublayers
		//

		// Rectangle
		//
		let rectangleLayer = CAShapeLayer()
		rectangleLayer.name = "Rectangle"
		rectangleLayer.bounds = CGRect(x: 0, y: 0, width: 59.7035, height: 59.7035)
		rectangleLayer.position = CGPoint(x: 102.59, y: 237.797)
		rectangleLayer.anchorPoint = CGPoint(x: 0, y: 0)
		rectangleLayer.contentsGravity = .center
		rectangleLayer.contentsScale = 2
		rectangleLayer.allowsEdgeAntialiasing = true
		rectangleLayer.allowsGroupOpacity = true
		rectangleLayer.path = rectanglePath
		rectangleLayer.fillColor = fillColor.cgColor
		rectangleLayer.strokeColor = strokeColor.cgColor
		rectangleLayer.lineWidth = 1

		groupLayer.addSublayer(rectangleLayer)

		// Path
		//
		let pathLayer = CAShapeLayer()
		pathLayer.name = "Path"
		pathLayer.bounds = CGRect(x: 0, y: 0, width: 261.129064, height: 150.759)
		pathLayer.position = CGPoint(x: 0, y: 110.87)
		pathLayer.anchorPoint = CGPoint(x: 0, y: 0)
		pathLayer.contentsGravity = .center
		pathLayer.contentsScale = 2
		pathLayer.allowsEdgeAntialiasing = true
		pathLayer.allowsGroupOpacity = true
		pathLayer.path = pathPath
		pathLayer.fillColor = fillColor.cgColor
		pathLayer.strokeColor = strokeColor.cgColor
		pathLayer.lineWidth = 1

		groupLayer.addSublayer(pathLayer)

		// Path
		//
		let pathLayer1 = CAShapeLayer()
		pathLayer1.name = "Path"
		pathLayer1.bounds = CGRect(x: 0, y: 0, width: 211.462651, height: 123.1662)
		pathLayer1.position = CGPoint(x: 25.336424, y: 47.4078)
		pathLayer1.anchorPoint = CGPoint(x: 0, y: 0)
		pathLayer1.contentsGravity = .center
		pathLayer1.contentsScale = 2
		pathLayer1.allowsEdgeAntialiasing = true
		pathLayer1.allowsGroupOpacity = true
		pathLayer1.path = pathPath1
		pathLayer1.fillColor = fillColor.cgColor
		pathLayer1.strokeColor = strokeColor.cgColor
		pathLayer1.lineWidth = 1

		groupLayer.addSublayer(pathLayer1)

		// Path
		//
		let pathLayer2 = CAShapeLayer()
		pathLayer2.name = "Path"
		pathLayer2.bounds = CGRect(x: 0, y: 0, width: 156.276821, height: 90.055314)
		pathLayer2.position = CGPoint(x: 52.926246, y: 0.499986)
		pathLayer2.anchorPoint = CGPoint(x: 0, y: 0)
		pathLayer2.contentsGravity = .center
		pathLayer2.contentsScale = 2
		pathLayer2.allowsEdgeAntialiasing = true
		pathLayer2.allowsGroupOpacity = true
		pathLayer2.path = pathPath2
		pathLayer2.fillColor = fillColor.cgColor
		pathLayer2.strokeColor = strokeColor.cgColor
		pathLayer2.lineWidth = 1

		groupLayer.addSublayer(pathLayer2)

		self.layer.addSublayer(groupLayer)

	}


    // MARK: - Responder

	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

		guard let location = touches.first?.location(in: self) else { return }

		let hitLayers = containerLayer?.sublayers?.filter({
			guard let shapeLayer = $0 as? CAShapeLayer else { return false }

			let hitPoint = layer.convert(location, to: shapeLayer)

			return shapeLayer.path?.contains(hitPoint) == true
		})

		guard let hitLayer = hitLayers?.last as? CAShapeLayer else { return }

		hitLayer.fillColor = UIColor.random.cgColor

		print("Layer \(hitLayer.name ?? String(describing: hitLayer)) was tapped.")
	}
}
