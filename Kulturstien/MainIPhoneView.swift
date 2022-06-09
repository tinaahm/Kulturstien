//
//  MainIPhoneView.swift
//  Kulturstien
//
//  Created by Tina on 12/05/2022.
//

import SwiftUI

/// View showing the map in "day time"-mode.
///
///Sources for images: [cardGames](https://www.flaticon.com/free-icon/card-games_3813722?term=memory%20game&page=1&position=9&page=1&position=9&related_id=3813722&origin=tag),
/// [Kirsti Images](https://www.flaticon.com/free-icon/german_164537),
/// [Ragnhild Images](https://www.flaticon.com/free-icon/norwegian_164543?term=norwegian&page=1&position=20&page=1&position=20&related_id=164543&origin=search) &
/// [Trond Images](https://www.flaticon.com/free-icon/norwegian_164545).
///
struct MainIPhoneView: View {
	
	@EnvironmentObject var page: ViewIndex
	
    var body: some View {
		ZStack {
			ZStack {
				ButtonView(selectedStructure: .logBooms, selectedPerson: .none, image: "LogboomsButton", width: 71, height: 59, posX: 200, posY: 120)
				ButtonView(selectedStructure: .sawmill, selectedPerson: .none, image: "SawmillButton", width: 51, height: 60, posX: 190, posY: 440)
				ButtonView(selectedStructure: .dam, selectedPerson: .none, image: "DamButton", width: 55, height: 60, posX: 70, posY: 630)
				ButtonView(selectedStructure: .mill, image: "WatermillButton", width: 70, height: 60, posX: 335, posY: 740)
				ButtonView(selectedPerson: .kirsti, image: "KirstiButton", width: 60, height: 73, posX: 70, posY: 150)
				ButtonView(selectedPerson: .trond, image: "TrondButton", width: 52, height: 101, posX: 290, posY: 590)
				ButtonView(selectedPerson: .ragnhild, image: "RagnhildButton", width: 47, height: 90, posX: 270, posY: 250)
				ButtonView(selectedGame: .farmMemoryGame, image: "TrophyButton", width: 40, height: 52, posX: 80, posY: 280)
				ButtonView(selectedGame: .millGame, image: "TrophyButton", width: 40, height: 52, posX: 55, posY: 470)
				}
			
			.background(
					Image("DayTimeBackground")
						.resizable()
						.edgesIgnoringSafeArea(.all)
				)
			
			VStack {
					HStack {
						Spacer()
						Button (action: {
							page.previousPage = page.pageIndex
							page.pageIndex = .profile
						}) {
							Image(getAvatarByColour(colour: page.selectedColour))
							.resizable()
							.frame(width: 60, height: 60)
							.background(Circle().fill(.white).shadow(radius: 1, x: 2, y: 3)
							)
						}
						.padding(.trailing)
					}
					.foregroundColor(.black)
				
				HStack {
					Spacer()
					Button (action: {
						page.lightMode = false
						page.pageIndex = .mainNight
					}) {
						Image(systemName: "moon.stars.fill")
							.resizable()
							.frame(width: 30, height: 30)
							.padding(15)
							.foregroundColor(.black)
							.background(Circle().fill(.white).shadow(radius: 1, x: 2, y: 3)
							)
					}
					.padding(.trailing)
				}
				Spacer()
			}
			
		}
	}

}

/*struct MainIPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        MainIPhoneView().environmentObject(ViewIndex())
    }
}*/
