//
//  FairytaleMemoryGameView.swift
//  Kulturstien
//
//  Created by Tina on 01/06/2022.
//

import SwiftUI

struct FairytaleMemoryGameView: View {
    var body: some View {
		VStack {
			BackButtonView(buttonColour: .white)
			Text("Underjordiske vesener")
				.font(.headlineFont)
			Image("Nokken")
				.resizable()
				.frame(width: 80, height: 50)
			DestinationPageView(theme: DefaultThemes.theme1)
		}
		.foregroundColor(.white)
		.background(Color("FairytaleMemoryGameBackgroundColour"))
    }
}

struct FairytaleMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        FairytaleMemoryGameView().environmentObject(ViewIndex())
    }
}
