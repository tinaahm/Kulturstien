//
//  WackANokkView.swift
//  Kulturstien
//
//  Created by Tina on 24/05/2022.
//

import SwiftUI
import SceneKit

import UIKit
import SwiftUI

// 1.
struct WackANokkView: UIViewControllerRepresentable {

	// 2.
	func makeUIViewController(context: Context) -> GameViewController {
		return GameViewController()
	}
	
	// 3.
	func updateUIViewController(_ uiViewController: GameViewController, context: Context) {
		
	}
}


/*
struct WackANokkView: View {
	
	/*var scene = SCNScene(named: "GameScene")
	var cameraNode: SCNNode? {
			scene?.rootNode.childNode(withName: "camera", recursively: false)
	}
	
    var body: some View {
		SceneView(
			scene: scene,
			pointOfView: cameraNode,
			options: []
		)
    }*/
	
	
	var scene: SCNScene? {
		   SCNScene(named: "Models.scnassets/Avatar.scn")
	   }

	   var cameraNode: SCNNode? {
		   let cameraNode = SCNNode()
		   cameraNode.camera = SCNCamera()
		   cameraNode.position = SCNVector3(x: 0, y: 0, z: 2)
		   return cameraNode
	   }

	   var body: some View {
		   SceneView(
			   scene: scene,
			   pointOfView: cameraNode,
			   options: [
				   .allowsCameraControl,
				   .autoenablesDefaultLighting,
				   .temporalAntialiasingEnabled
			   ]
		   )
	   }
	
}

struct WackANokkView_Previews: PreviewProvider {
    static var previews: some View {
        WackANokkView()
    }
}
*/
