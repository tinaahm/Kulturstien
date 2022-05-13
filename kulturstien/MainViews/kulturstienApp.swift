//
//  kulturstienApp.swift
//  kulturstien
//
//  Created by Tina on 09/05/2022.
//

import SwiftUI

@main
struct kulturstienApp: App {
	
	@StateObject var viewIndex = ViewIndex()
	
    var body: some Scene {
        WindowGroup {
			NavigationHandlerView().environmentObject(viewIndex)
        }
    }
}
