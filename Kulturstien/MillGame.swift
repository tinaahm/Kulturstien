//
//  MillGame.swift
//  Kulturstien
//
//  Created by Embla on 30/05/2022.
//

import SwiftUI
import RealityKit
import ARKit
import UIKit

struct MillGameView: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
                
        //self.anchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.2, 0.2])

        /*
         let model = try!ModelEntity.loadModel(named: "mill-broken.usdz")
         
         models.append(model)
         
         millGameView.scene.addAnchor(anchor)
         */
    
        let arView = ARView(frame: .zero)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    /*
    
    @IBOutlet var millGameView: ARView!
    
    var anchor = AnchorEntity()

    var models: [ModelEntity] = []
     */
}
