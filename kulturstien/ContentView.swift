//
//  ContentView.swift
//  kulturstien
//
//  Created by Tina on 09/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        
		if verticalSizeClass == .regular {
			Text("Landscape")
		}
		else if verticalSizeClass == .compact {
			Text("Portrait")
		}
		else {
			Text("Unknown")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeRight)
    }
}
