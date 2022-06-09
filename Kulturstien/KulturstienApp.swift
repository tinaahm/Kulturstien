//
//  KulturstienApp.swift
//  Kulturstien
//
//  Created by Tina on 09/05/2022.
//

import SwiftUI

/// General Sources:
/// [Swift](https://www.swift.org/documentation/)
/// & [Apple Developer](https://developer.apple.com/documentation/)

@main
struct KulturstienApp: App {
	
	@StateObject var viewIndex = ViewIndex()
	
    var body: some Scene {
        WindowGroup {
			NavigationHandlerView()
				.environmentObject(viewIndex)
				.preferredColorScheme(.light)
        }
    }
}
