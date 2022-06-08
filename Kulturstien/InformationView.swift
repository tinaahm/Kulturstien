//
//  InformationView.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 19/05/2022.
//

import SwiftUI

struct InformationView: View {
    
    @EnvironmentObject var page : ViewIndex
	@State var type: Structure
	@State var information: [Paragraph]
	@State var title: String
	@State var selectedIndex: Int = 0
	
	init(type: Structure) {
		self.type = type
		self.information = getInformationByType(type: type)
		self.title = type.rawValue.capitalized
	}
    
    var body: some View {
		
		ZStack {
			Color("BackgroundColour")
			
			VStack {
				
				BackButtonView()
				
				VStack(alignment: .leading) {
					Text(self.title)
						.font(.title)
				}
				.padding(.bottom, 20)
				
				ZStack {
					RoundedRectangle(cornerRadius: 25, style: .continuous)
						.fill(.white)
						//.shadow(radius: 4, x: -2, y: 5)
						.frame(width: (DeviceSize.width * 0.9), height: (DeviceSize.height * 0.7))
					
					VStack(alignment: .center, spacing: 0) {
						Spacer()
						Image(self.information[self.selectedIndex].imageTitle)
								.resizable()
								//.scaledToFit()
								//.aspectRatio(contentMode: .fill)
								.frame(width: (DeviceSize.width * 0.8), height: ((DeviceSize.height * 0.7)/2.5))
						
						Text(self.information[self.selectedIndex].text) //FIXME: add multiline center?
							.font(.body)
							.foregroundColor(.black)
							.multilineTextAlignment(.leading)
							.frame(width: (DeviceSize.width * 0.8), height: ((DeviceSize.height * 0.7)/2))
						Spacer()
					}
					
				}
				//.padding(.bottom, 30)
				
				//Spacer()
				
				HStack {
					ForEach(0 ..< self.information.count) {
						index in
						Button (action: {
							self.selectedIndex = index
						}) {
							if self.selectedIndex == index {
								Image("")
									.resizable()
									.frame(width: 5, height: 5)
									.padding(5)
									.background(Color("DarkGrey"))
								.clipShape(Circle())
							} else {
								Image("")
									.resizable()
									.frame(width: 1, height: 1)
									.padding(5)
									.background(Color("LightGrey"))
								.clipShape(Circle())
							}
						}
						.padding(1)
					}
				}
			}
		}
		.gesture(
			DragGesture()
				.onEnded { value in
					print("value", value.translation.width)
					let direction = detectDirection(value: value)
						  if direction == .left {
							  if self.selectedIndex != 0 {
								  self.selectedIndex -= 1
								  }
						  } else if direction == .right {
							  if self.selectedIndex < (self.information.count - 1) {
								  self.selectedIndex += 1
								  }
							  }
						  }
			)
		.background(Color("BackgroundColour"))
		
		/*VStack {
				BackButtonView()
			
			ScrollView {
				
				Spacer()
				Spacer()
				Spacer()
				
				VStack {
				//TODO: title inline with back button?
					
					VStack(alignment: .leading) {
						Text(self.title)
							.font(.title)
					}
					.padding(.bottom, 30)
					
					ForEach(0 ..< self.information.count) {
						index in
						
						
						Image(self.information[index].imageTitle)
							.resizable()
							.scaledToFit()
							.aspectRatio(contentMode: .fill)
							.frame(width: 350, height: 250)
						
							VStack(alignment: .leading) {
									ZStack {
										RoundedRectangle(cornerRadius: 25, style: .continuous)
											.fill(Color("Grey"))
											.shadow(radius: 2, x: 0, y: 3)

										VStack {
											Text(self.information[index].text) //FIXME: add multiline center?
												.font(.body)
												.foregroundColor(.black)
										}
										.padding(30)
										.multilineTextAlignment(.center)
									}
									.frame(width: 350)
									.padding(20)
							}
							.padding()
								Spacer()
						}
					}
			}
			.background(Color("BackgroundColour"))
		}
		.background(Color("BackgroundColour"))*/
        
    }
}

func getInformationByType(type: Structure) -> [Paragraph] {
	
	switch type {
	case .mill:
		return millInformationTexts
	case .sawmill:
		return sawmillInformationTexts
	case .dam:
		return damInformationTexts
	case .logBooms:
		return logBoomsInformationTexts
	case .none:
		return []
	}
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
		InformationView(type: .sawmill).environmentObject(ViewIndex())
    }
}



