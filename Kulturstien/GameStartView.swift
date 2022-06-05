//
//  GameStartView.swift
//  Kulturstien
//
//  Created by Tina on 03/06/2022.
//

import SwiftUI

struct GameStartView: View {
	
	@EnvironmentObject var page : ViewIndex
	
    var body: some View {
		ZStack {
			Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground")
			VStack {
				BackButtonView(buttonColour: page.lightMode ? .black : .white)
				Image(page.lightMode ? "cardGames" : "bonfire 3")
					.resizable()
					.frame(width: 100, height: 100, alignment: .center)
					.padding()
				VStack {
					Text(gameSelection.rawValue)
						.font(Font.custom("SourceSansPro-SemiBold", size: 18))
						//.fontWeight(.heavy)
						.multilineTextAlignment(.center)
						.foregroundColor(page.lightMode ? .black : .white)
						.padding(.bottom, 5)
					Text("Prøv å få alle like!")
						.font(Font.custom("SourceSansPro-SemiBold", size: 16))
						//.fontWeight(.heavy)
						.multilineTextAlignment(.center)
						.foregroundColor(page.lightMode ? .black : .white)
				}
				.padding([.top, .leading, .trailing])
				.padding(.bottom, 30)
				
				Button(action: {
					page.previousPage = page.pageIndex
					page.pageIndex = getPageByGameSelection(game: gameSelection)
				}) {
					Text("Start spill")
						.font(Font.custom("SourceSansPro-SemiBold", size: 16))
						//.fontWeight(.heavy)
						.frame(width: 150)
						.padding()
						.overlay(RoundedRectangle(cornerRadius: 15)
							.stroke(Color(page.lightMode ? .gray : .clear), lineWidth: 1)
						)
						.background(RoundedRectangle(cornerRadius: 15)
							.fill(Color(page.lightMode ? "White" : "CreatureInformationTextboxBackground")).shadow(radius: 1, x: 4, y: 4)
						)
						.foregroundColor(page.lightMode ? .black : .white)
				}
				.padding()
				Spacer()
			}
		}
		.background(Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground"))
    }
}

struct GameStartView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartView().environmentObject(ViewIndex())
    }
}
