//
//  NavigationHandlerView.swift
//  kulturstien
//
//  Created by Tina on 13/05/2022.
//

import SwiftUI

enum Page {
	case main, profile, menu, achievements, texts
}

class ViewIndex: ObservableObject {
	@Published var pageIndex : Page = .main
}

struct NavigationHandlerView: View {
	
	@EnvironmentObject var page : ViewIndex
	
    var body: some View {
		switch page.pageIndex {
		case .main:
			MainIPhoneView()
		case .profile:
			ProfileView()
		case .menu:
			MenuView()
				.transition(.backslide)
		case .achievements:
			MenuView()
		case .texts:
			MenuView()
		}
    }
}

struct NavigationHandlerView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationHandlerView().environmentObject(ViewIndex())
    }
}

extension AnyTransition {
	static var backslide: AnyTransition {
		AnyTransition.asymmetric(
			insertion: .move(edge: .trailing),
			removal: .move(edge: .leading))}
}