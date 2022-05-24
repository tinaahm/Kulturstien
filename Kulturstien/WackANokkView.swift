//
//  WackANokkView.swift
//  Kulturstien
//
//  Created by Tina on 24/05/2022.
//

import SwiftUI
import SceneKit

struct WackANokkView: View {
	
	var scene = SCNScene(named: "GameScene")
	var cameraNode: SCNNode? {
			scene?.rootNode.childNode(withName: "camera", recursively: false)
	}
	
    var body: some View {
		SceneView(
			scene: scene,
			pointOfView: cameraNode,
			options: []
		)
    }
}

struct WackANokkView_Previews: PreviewProvider {
    static var previews: some View {
        WackANokkView()
    }
}
