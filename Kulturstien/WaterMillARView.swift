//
//  WaterMillARView.swift
//  Kulturstien
//
//  Created by Tina on 05/06/2022.
//

import SwiftUI
import ARKit
import RealityKit

/// View that loads the view for the mill AR
struct WaterMillARView: View {
    var body: some View {
		ZStack {
				ARViewContainer().edgesIgnoringSafeArea(.all)
			VStack {
				BackButtonView()
				Spacer()
			}
		}
    }
}

/// The container for the ARView
struct ARViewContainer: UIViewRepresentable {
	
	func makeUIView(context: Context) -> ARView {
		
		let arView = ARView(frame: .zero)
		arView.setUpARCoaching()
		
		let arConfiguration = ARWorldTrackingConfiguration()
		arConfiguration.planeDetection = .horizontal
		arView.session.run(arConfiguration, options: [])
		return arView
	}
	
	func updateUIView(_ uiView: ARView, context: Context) {}
	
}

/// Extension ARView for showing the ARCoachingOverlay.
extension ARView : ARCoachingOverlayViewDelegate {
	func setUpARCoaching(){
		let coachingOverlay = ARCoachingOverlayView()
		coachingOverlay.delegate = self
		coachingOverlay.session = self.session
		coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		self.addSubview(coachingOverlay)
		coachingOverlay.goal = .horizontalPlane
	}
	
	/// When the ARCoachingOverlay is finished load the water mill.
	public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
		let millAnchor = try! WaterMillNoWater.loadWaterMill()
		self.scene.anchors.append(millAnchor)
	}
	
}
