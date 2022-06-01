//
//  MainNightTimeView.swift
//  Kulturstien
//
//  Created by Tina on 31/05/2022.
//

import SwiftUI

struct MainNightTimeView: View {
	
	@EnvironmentObject var page: ViewIndex
	
	var body: some View {
		ZStack {
				
			ZStack {
				ButtonView(selectedCreature: .troll, image: "TrollButton", width: 39, height: 71, posX: 75, posY: 590)
				ButtonView(selectedCreature: .huldra, image: "HuldraButton", width: 47, height: 80, posX: 200, posY: 510)
				ButtonView(selectedCreature: .nokken, image: "NøkkenButton", width: 44, height: 30, posX: 65, posY: 227)
				ButtonView(selectedGame: .wackANokk, image: "BonfireButton", width: 32, height: 52, posX: 90, posY: 340)
				ButtonView(selectedGame: .fairytaleCreaturesMemoryGame, image: "BonfireButton", width: 32, height: 52, posX: 230, posY: 660)
				ButtonView(selectedCreature: .tusse, image: "TusseButton", width: 32, height: 52, posX: 230, posY: 800)
				ButtonView(selectedGame: .frightenHuldra, image: "BonfireButton", width: 32, height: 46, posX: 110, posY: 770)
				}
			.background(
					Image("NightTimeMap")
						.resizable()
						.scaledToFill()
						.edgesIgnoringSafeArea(.all)
				)
			//.draggable()
			
			VStack {
				//ZStack {
					HStack {
						Button (action: {
							page.pageIndex = .profile
						}) {
							Image(getImageTitleByColour(colour: page.user.selectedColour))
							.resizable()
							.frame(width: 60, height: 60)
						}
				
						Spacer(minLength: 0)
						
						
						
						Button (action: {
							withAnimation {
								page.pageIndex = .menu
							}
						}) {
							Image(systemName: "line.3.horizontal")
							.resizable()
							.frame(width: 25, height: 25)
							.padding(15)
						}
						//.padding(.trailing, 30)
						
						//Spacer(minLength: 0)
					}
					.foregroundColor(.black)
				
				.padding()
				.background(.white.opacity(0.5))
				
				HStack {
					Spacer()
					Button (action: {
						page.lightMode = true
						page.pageIndex = .main
					}) {
						Image(systemName: "sun.max.fill")
							.resizable()
							.frame(width: 30, height: 30)
							.padding(15)
							.background(.white.opacity(0.7))
							.foregroundColor(.black)
						.clipShape(Circle())
					}
					.padding(.trailing)
					.padding(.top)
					
				}
				Spacer()
			}
			
		}
	}

}


struct MainNightTimeView_Previews: PreviewProvider {
    static var previews: some View {
        MainNightTimeView().environmentObject(ViewIndex())
    }
}
