//
//  MillGame.swift
//  Kulturstien
//
//  Created by Embla on 30/05/2022.
//

import RealityKit
import UIKit

class MillGameViewController: UIViewController {
    
    @IBOutlet var millGameView: ARView!
    
    var anchor = AnchorEntity()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.anchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.2, 0.2])
        
        millGameView.scene.addAnchor(anchor)
    }
}
