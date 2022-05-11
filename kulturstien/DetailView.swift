//
//  DetailView.swift
//  kulturstien
//
//  Created by Tina on 10/05/2022.
//

import SwiftUI

enum Page {
	case map, achievments, readingMaterial, profile
}

struct DetailView: View {
	
	@State var page : Page = .map
	
    var body: some View {
		switch self.page {
		case .map:
			MapView()
		case .achievments:
			Text("hello")
		case .readingMaterial:
			Text("hello")
		case .profile:
			Text("hello")
		}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
