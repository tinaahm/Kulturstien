//
//  GameViewController.swift
//  SkremBortHuldra
//
//  Created by Lucas on 23/05/2022.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let scene = GameScene(size: view.bounds.size)
    let skView = view as! SKView
    skView.ignoresSiblingOrder = true
    scene.scaleMode = .resizeFill
    skView.presentScene(scene)

  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
}