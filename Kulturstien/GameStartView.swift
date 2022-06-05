//
//  GameStartView.swift
//  Kulturstien
//
//  Created by Tina on 03/06/2022.
//

import SwiftUI

struct GameStartView: View {
	
	@EnvironmentObject var page : ViewIndex
	@State var show = false
	
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
					
					//if gameSelection != .frightenHuldra {
						page.previousPage = page.pageIndex
						page.pageIndex = getPageByGameSelection(game: gameSelection)
					/*} else {
						self.show.toggle()
					}*/
				}) {
					Text("Start spill")
						.font(Font.custom("SourceSansPro-SemiBold", size: 16))
						.foregroundColor(.black)
						.frame(width: DeviceSize.width * 0.5)
						.padding(20)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(page.lightMode ? Color(red: 0.984, green: 0.984, blue: 0.984) : Color("CreatureInformationTextboxBackground"))
								.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
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
