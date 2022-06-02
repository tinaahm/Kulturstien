//
//  FarmMemoryGameView.swift
//  Kulturstien
//
//  Created by Tina on 01/06/2022.
//

import SwiftUI

struct FarmMemoryGameView: View {
    var body: some View {
		VStack {
			BackButtonView()
			Text("Huske spill")
			Text("Bondens redskaper")
			Image("WaterMillIcon")
			DestinationPageView(theme: DefaultThemes.theme0)
		}
    }
}

struct FarmMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        FarmMemoryGameView()
    }
}
