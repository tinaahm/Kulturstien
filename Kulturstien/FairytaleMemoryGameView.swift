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
			BackButtonView()
			Image("Nokken")
				.resizable()
				.frame(width: 80, height: 50)
			Text("Huskespill")
			Text("Underjordiske vesener")
			DestinationPageView(theme: DefaultThemes.theme1)
		}
    }
}

struct FairytaleMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        FairytaleMemoryGameView()
    }
}
