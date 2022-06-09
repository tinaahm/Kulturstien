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
			
			VStack(spacing: 0) {
				
				BackButtonView(buttonColour: page.lightMode ? .black : .white)
				
				VStack(alignment: .leading, spacing: 0) {
                    Text(self.title.uppercased())
						.font(.headlineFont)
				}
				//.padding(.bottom, 10)
				
				ZStack {
					RoundedRectangle(cornerRadius: 25, style: .continuous)
						.fill(.white)
						.frame(width: (DeviceSize.width * 0.9), height: (DeviceSize.height * 0.75))
					
					VStack(alignment: .center, spacing: 0) {
						HStack {
							Image(self.information[self.selectedIndex].imageTitle)
									.resizable()
									.frame(width: (DeviceSize.width * 0.8), height: ((DeviceSize.height * 0.7)/2.3))
						}
						HStack {
							Text(self.information[self.selectedIndex].text)
								.font(.textFont)
								.foregroundColor(.black)
								.multilineTextAlignment(.leading)
								.padding()
								.frame(width: (DeviceSize.width * 0.85), height: ((DeviceSize.height * 0.7)/1.7), alignment: .top)
								.lineSpacing(1)
						}
					}
				}
				.padding()
				
				HStack {
                    ForEach(0 ..< self.information.count, id: \.self) {
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



