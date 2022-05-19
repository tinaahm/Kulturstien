//
//  MainIPhoneView.swift
//  Kulturstien
//
//  Created by Tina on 12/05/2022.
//

import SwiftUI

struct MainIPhoneView: View {
	
	@EnvironmentObject var page : ViewIndex
	@State private var showDarkMap = false
	@State var timeOfDayIndex = 0
	
	/*var moon : String = "moon.stars.fill"
	var sun : String = "sun.max"*/
	
	var timeOfDayImages : [[String]] = [["sun.max", "DayTimeMap"], ["moon.stars.fill", "NightTimeMap"]]
	
	
    var body: some View {
		ZStack {
			VStack {
				Group {
					HStack {
						Image(systemName: "person")
						.resizable()
						.frame(width: 30, height: 30)
						.padding(15)
						.padding(.leading, 30)
				
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
						.padding(.trailing, 30)
					}
					.foregroundColor(.black)
					.frame(width: 425, height: 60)
					//.padding()
				}
				.padding()
				.background(.white.opacity(0.5))
				Spacer(minLength: 0)
				
				VStack {
					Button (action: {
						quizSelection = .sawmill
						page.pageIndex = .quiz
					}) {
						Image(systemName: "camera.macro")
							.resizable()
							.frame(width: 20, height: 20)
							.padding(15)
							.background(Color.white)
							.foregroundColor(.black)
						.clipShape(Circle())
					}
					Button (action: {}) {
						Image(systemName: "sparkles")
							.resizable()
							.frame(width: 20, height: 20)
							.padding(15)
							.background(Color.white)
							.foregroundColor(.black)
						.clipShape(Circle())
					}
					Button (action: {}) {
						Image(systemName: "tortoise")
							.resizable()
							.frame(width: 30, height: 20)
							.padding(15)
							.background(Color.white)
							.foregroundColor(.black)
						.clipShape(Circle())
					}
					Button (action: {}) {
						Image(systemName: "hare")
							.resizable()
							.frame(width: 30, height: 20)
							.padding(15)
							.background(Color.white)
							.foregroundColor(.black)
						.clipShape(Circle())
					}
					
				}
				Spacer(minLength: 0)
				HStack {
					Spacer()
					Button (action: {
						if !showDarkMap {
							timeOfDayIndex = 1
							showDarkMap = true
						} else {
							timeOfDayIndex = 0
							showDarkMap = false
						}
					}) {
						Image(systemName: timeOfDayImages[timeOfDayIndex][0])
							.resizable()
							.frame(width: 30, height: 30)
							.padding(15)
							.background(Color.white)
							.foregroundColor(.black)
						.clipShape(Circle())
					}
					.padding(.trailing)
				}
			}
		}
		.background(
				Image(timeOfDayImages[timeOfDayIndex][1])
					.resizable()
					.scaledToFill()
					.edgesIgnoringSafeArea(.all)
			)
	}

}

struct MainIPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        MainIPhoneView().environmentObject(ViewIndex())
    }
}
