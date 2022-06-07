//
//  FarmMemoryGameView.swift
//  Kulturstien
//
//  Created by Tina on 01/06/2022.
//

import SwiftUI

struct FarmMemoryGameView: View {
    var body: some View {
		VStack (alignment: .center) {
			BackButtonView()
			Image("WaterMillIcon")
				.resizable()
				.frame(width: 69*2, height: 55*2, alignment: .center)
			DestinationPageView(theme: DefaultThemes.theme0)
				.edgesIgnoringSafeArea(.bottom)
		}
		.background(Color("BackgroundColour"))
    }
}

struct FarmMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        FarmMemoryGameView().environmentObject(ViewIndex())
    }
}
