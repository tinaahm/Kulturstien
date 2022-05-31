//
//  MainNightTimeView.swift
//  Kulturstien
//
//  Created by Tina on 31/05/2022.
//

import SwiftUI

struct MainNightTimeView: View {
	
	@EnvironmentObject var page: ViewIndex
	@State private var showDarkMap = false
	@State var timeOfDayIndex = 0
	
	var timeOfDayImages : [[String]] = [["moon.stars.fill", "DayTimeMap"], ["sun.max.fill", "NightTimeMap"]]
	
	
	var body: some View {
		ZStack {
				
			ZStack {
				ButtonView(selectionType: .sawmill, image: "SawmillButton", width: 60, height: 60, posX: 200, posY: 230)
				ButtonView(selectionType: .sawmill, image: "SawmillButton", width: 60, height: 60, posX: 70, posY: 370)
				ButtonView(selectionType: .dam, image: "DamButton", width: 60, height: 60, posX: 110, posY: 620)
				
				ButtonView(selectionType: .mill, image: "MillIcon", width: 122, height: 79, posX: 350, posY: 660)
				ButtonView(selectionType: .mill, image: "KirstiButton", width: 50, height: 65, posX: 65, posY: 65)
				
				ButtonView(selectionType: .none, image: "TrondButton", width: 45, height: 90, posX: 250, posY: 490)
				ButtonView(selectionType: .none, image: "RagnhildButton", width: 45, height: 90, posX: 145, posY: 695)
				ButtonView(selectionType: .none, image: "FlagButton", width: 35, height: 60, posX: 290, posY: 735)
				ButtonView(selectionType: .none, image: "Group 28", width: 35, height: 60, posX: 195, posY: 300)
					Button (action: {
						page.pageIndex = .wackANokk
					}) {
						Image("Button")
							.resizable()
							.frame(width: 35, height: 60)
							.padding(15)
					}
					.position(x: 300, y: 200)
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
						//Spacer(minLength: 0)
						Image(systemName: "person")
						.resizable()
						.frame(width: 30, height: 30)
						.padding(15)
						//.padding(.leading, 30)
				
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
					//.frame(width: 425, height: 60)
					//.padding()
				//}
				.padding()
				.background(.white.opacity(0.5))
				//Spacer(minLength: 0)
				
	

				Spacer()
				HStack {
					Spacer()
					Button (action: {
						page.pageIndex = .main
					}) {
						Image(systemName: "sun.max.fill")
							.resizable()
							.frame(width: 30, height: 30)
							.padding(15)
							.background(Color.white)
							.foregroundColor(.black)
						.clipShape(Circle())
					}
					.padding(.trailing)
					.padding(.top)
					
				}
			}
			
		}
	}

}


struct MainNightTimeView_Previews: PreviewProvider {
    static var previews: some View {
        MainNightTimeView().environmentObject(ViewIndex())
    }
}
