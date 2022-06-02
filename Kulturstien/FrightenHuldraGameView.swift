//
//  FrightenHuldraGameView.swift
//  Kulturstien
//
//  Created by Lucas on 02/06/2022.
//

import SwiftUI
import SceneKit
import SpriteKit

import UIKit

struct FrightenHuldraGameView: View {
    var theScene = SKScene(fileNamed: "GameScene")
    
    var body: some View {
        SpriteView(scene: theScene!)
    }
}

struct FrightenHuldraGameView_Previews: PreviewProvider {
    static var previews: some View {
        FrightenHuldraGameView()
    }
}
