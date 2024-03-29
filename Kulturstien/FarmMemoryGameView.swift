//
//  FarmMemoryGameView.swift
//  Kulturstien
//
//  Created by Tina on 01/06/2022.
//

import SwiftUI

/// View for showing the Farm-Memory game.
struct FarmMemoryGameView: View {
    var body: some View {
		VStack (alignment: .center) {
			BackButtonView()
			Text("Bondens redskaper")
				.font(.headlineFont)
			Image("WaterMillIcon")
				.resizable()
				.frame(width: 80, height: 60, alignment: .center)
			DestinationPageView(theme: DefaultThemes.theme0)
		}
		.background(Color("BackgroundColour"))
    }
}

/*struct FarmMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        FarmMemoryGameView().environmentObject(ViewIndex())
    }
}*/
