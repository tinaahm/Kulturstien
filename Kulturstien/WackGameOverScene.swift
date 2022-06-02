//
//  GameOverScene.swift
//  WhackANoekken
//
//  Created by Lucas on 20/05/2022.
//

import SpriteKit

class WackGameOverScene: SKScene {
    
    override func didMove(to view: SKView) -> Void {
        
        
        let endNode = SKLabelNode(fontNamed: "Chalkduster")
        endNode.fontSize = 40
        endNode.zPosition = 2
        endNode.position.x = frame.midX
        endNode.position.y = frame.midY + 70
        endNode.text = "Du skremte bort Nøkken!"
        
        let scoreNode = SKLabelNode(fontNamed: "Chalkduster")
        scoreNode.fontSize = 40
        scoreNode.zPosition = 2
        scoreNode.position.x = frame.midX
        scoreNode.position.y = frame.midY + 20
        scoreNode.text = "Poengsum: 0"

        
        let restartNode = SKLabelNode(fontNamed: "Chalkduster")
        restartNode.fontSize = 30
        restartNode.zPosition = 2
        restartNode.position.x = frame.midX
        restartNode.position.y = frame.midY - 40
        restartNode.text = "Klyp for å starte på nytt"
        
        addChild(endNode)
        addChild(scoreNode)
        addChild(restartNode)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        self.view?.addGestureRecognizer(pinchRecognizer)
    }
    
    @objc
    private func handlePinch(recognizer : UIPinchGestureRecognizer) -> Void {
        if recognizer.state == .ended {
            restart()
        }
    }
    
    private func restart() -> Void {
        let transition = SKTransition.fade(with: .white, duration: 2)
        
        let skView = view as! SKView
        let restartScene = WackGameScene(size: skView.bounds.size)
        restartScene.scaleMode = .fill
        self.view?.presentScene(restartScene, transition: transition)
    }
}

