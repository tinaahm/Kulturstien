//
//  KulturstienApp.swift
//  Kulturstien
//
//  Created by Tina on 09/05/2022.
//

import SwiftUI

@main
struct KulturstienApp: App {
	
	@StateObject var viewIndex = ViewIndex()
	
    var body: some Scene {
        WindowGroup {
            MillGameView()
            /*
			NavigationHandlerView().environmentObject(viewIndex)
				.preferredColorScheme(.light)
             */
        }
    }
}
