//
//  Cardify.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 23/05/2022.
//

//
//  Cardify.swift
//  memory-card-matching-game
//
//  Created by Archie Liu on 2021-05-01.
//

/// Code adapted from [Archie Liu](https://github.com/archie-lhd/memory-card-matching-game)

import SwiftUI

struct Cardify: AnimatableModifier { // == (ViewModifier, Animatable)
    var rotation: Double
	@State var shadowColour: Color
    
    init(isFaceUp: Bool, shadowColour: Color) {
        rotation = isFaceUp ? 0 : 180
		self.shadowColour = shadowColour
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: CORNER_RADIUS)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: CORNER_RADIUS)
                    .stroke(lineWidth: 3)

                content
            }.opacity(isFaceUp ? 1.0 : 0.0)
            RoundedRectangle(cornerRadius: CORNER_RADIUS)
                .opacity(isFaceUp ? 0.0 : 1.0)
				.shadow(color: self.shadowColour, radius: 2, x: -2, y: 3)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0)) // around Z-axis
    }
    private let CORNER_RADIUS: CGFloat = 10.0
    private let EDGE_LINE_WIDTH: CGFloat = 3.0
}

extension View {
    func cardify(isFaceUp: Bool, shadowColour: Color) -> some View {
		self.modifier(Cardify(isFaceUp: isFaceUp, shadowColour: shadowColour))
    }
}
