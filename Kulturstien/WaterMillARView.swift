//
//  WaterMillARView.swift
//  Kulturstien
//
//  Created by Tina on 05/06/2022.
//

import SwiftUI
import ARKit
import RealityKit

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

struct LoadWaterMillARView: View {
	var body: some View {
		return
			ARViewContainer().edgesIgnoringSafeArea(.all)
	}
}

struct ARViewContainer: UIViewRepresentable {
	
	func makeUIView(context: Context) -> ARView {
		
		let arView = ARView(frame: .zero)
		arView.setUpARCoaching()
		
		let arConfiguration = ARWorldTrackingConfiguration()
		//arConfiguration.isCollaborationEnabled ??
		arConfiguration.planeDetection = .horizontal
		arView.session.run(arConfiguration, options: [])
		return arView
	}
	
	func updateUIView(_ uiView: ARView, context: Context) {}
	
}

extension ARView : ARCoachingOverlayViewDelegate {
	
	
	func setUpARCoaching(){
		let coachingOverlay = ARCoachingOverlayView()
		coachingOverlay.delegate = self
		coachingOverlay.session = self.session
		coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		self.addSubview(coachingOverlay)
		coachingOverlay.goal = .horizontalPlane
	}
	
	public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
		let millAnchor = try! WaterMillNoWater.loadWaterMill()
		self.scene.anchors.append(millAnchor)
	}
	
}


struct WaterMillARView_Previews: PreviewProvider {
    static var previews: some View {
        WaterMillARView()
    }
}
