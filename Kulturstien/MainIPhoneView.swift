//
//  MainIPhoneView.swift
//  Kulturstien
//
//  Created by Tina on 12/05/2022.
//

import SwiftUI

struct MainIPhoneView: View {
	
	@EnvironmentObject var page: ViewIndex
	
    var body: some View {
		ZStack {
				
			ZStack {
				ButtonView(selectedStructure: .sawmill, selectedPerson: .none, image: "SawmillButton", width: 60, height: 60, posX: 200, posY: 200)
				ButtonView(selectedStructure: .sawmill, selectedPerson: .none, image: "SawmillButton", width: 60, height: 60, posX: 70, posY: 520)
				ButtonView(selectedStructure: .dam, selectedPerson: .none, image: "DamButton", width: 60, height: 60, posX: 40, posY: 740)
				
				ButtonView(selectedStructure: .mill, selectedPerson: .none, image: "MillIcon", width: 122, height: 79, posX: 350, posY: 800)
				ButtonView(selectedStructure: .none, selectedPerson: .kirsti, image: "KirstiButton", width: 50, height: 65, posX: 65, posY: 205)
				
				ButtonView(selectedStructure: .none, selectedPerson: .trond, image: "TrondButton", width: 45, height: 90, posX: 230, posY: 670)
				ButtonView(selectedStructure: .none, selectedPerson: .ragnhild, image: "RagnhildButton", width: 45, height: 90, posX: 145, posY: 840)
				ButtonView(selectedStructure: .none, selectedPerson: .none, image: "FlagButton", width: 35, height: 60, posX: 290, posY: 875)
				//ButtonView(selectedStructure:  .none, selectedPerson: .none, image: "Group 28", width: 35, height: 60, posX: 195, posY: 300)
					Button (action: {
						page.pageIndex = .wackANokk
					}) {
						Image("FlagButton")
							.resizable()
							.frame(width: 35, height: 60)
							.padding(15)
					}
					.position(x: 190, y: 320)
				}
			.background(
					Image("DayTimeMap")
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
						page.lightMode = false
						page.pageIndex = .mainNight
					}) {
						Image(systemName: "moon.stars.fill")
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

struct MainIPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        MainIPhoneView().environmentObject(ViewIndex())
    }
}

struct DraggableView: ViewModifier {
	@State var offset = CGPoint(x: 0, y: 0)
	
	func body(content: Content) -> some View {
		content
			.gesture(DragGesture(minimumDistance: 0)
				.onChanged { value in
					self.offset.x += value.location.x - value.startLocation.x
					self.offset.y += value.location.y - value.startLocation.y
			})
			.offset(x: offset.x, y: offset.y)
	}
}

extension View {
	func draggable() -> some View {
		return modifier(DraggableView())
	}
}
