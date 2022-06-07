//
//  SelectionView.swift
//  Kulturstien
//
//  Created by Tina on 20/05/2022.
//

import SwiftUI

struct SelectionView: View {
	
	@EnvironmentObject var page : ViewIndex
	@State var quizButtonColour = Color.clear
	@State var showQuizButtonInformationText = false
	@State var showARButtonInformationText = false
	
	var selectionType: Structure
	
    var body: some View {
		
		let structureName: String = self.selectionType.rawValue
		let imageTitle = getImageTitleFromSelection(selectionType: selectionType)
		
		VStack (spacing: 15) {
			
			BackButtonView()
			
			VStack {
			Image(imageTitle)
                .padding(60)
				
				if self.showQuizButtonInformationText {
					Text("For å låse opp quiz så må du først lese teksten over!")
						.foregroundColor(.red)
						.font(.callout)
						.frame(width: DeviceSize.width * 0.7)
						.padding()
				}
			
				Button (action: {
					for i in 0...(page.quizesArray.count - 1) {
						if page.quizesArray[i].type == self.selectionType {
							page.quizesArray[i].informationPageRead = true
						}
					}
					page.previousPage = page.pageIndex
					page.pageIndex = .information
				}) {
					Text("Lær om " + structureName)
						.foregroundColor(.black)
						.frame(width: DeviceSize.width * 0.7)
						.padding(20)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
								.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
				}
				.padding(.bottom)
				
				Button (action: {
					
					var informationPageRead: Bool = false
					
					for i in 0...(page.quizesArray.count - 1) {
						if page.quizesArray[i].type == self.selectionType {
							informationPageRead = page.quizesArray[i].informationPageRead
						}
					}
					
					
					if informationPageRead {
						page.previousPage = page.pageIndex
						quizSelection = selectionType
						page.pageIndex = .quiz
					} else {
						self.quizButtonColour = .red
						self.showQuizButtonInformationText = true
					}
				}) {
					Text("Ta quiz om " + structureName)
						.foregroundColor(.black)
						.frame(width: DeviceSize.width * 0.7)
						.padding(20)
						.overlay(RoundedRectangle(cornerRadius: 15)
							.stroke(self.quizButtonColour, lineWidth: 1)
						)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
								.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
				}
				.padding(.bottom)
				
				
				if self.selectionType == .mill {
					Button (action: {
						page.previousPage = page.pageIndex
						page.pageIndex = .ar
						//self.showARButtonInformationText = true
					}) {
						Text("Se i AR")
							.foregroundColor(.black)
							.frame(width: DeviceSize.width * 0.7)
							.padding(20)
							/*.overlay(RoundedRectangle(cornerRadius: 15)
								.stroke(Color.gray, lineWidth: 1)
							)
							.background(RoundedRectangle(cornerRadius: 15)
								.fill(.white)
							)*/
							.background(
								RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
									.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
					}
					.padding(.bottom)
			}
				
			}
			Spacer()
		}
		.background(Color("BackgroundColour"))
    }
}

func getImageTitleFromSelection(selectionType: Structure) -> String {
	switch selectionType {
	case .mill:
		return "WaterMillIcon"
	case .sawmill:
		return "SawmillIcon"
	case .dam:
		return "DamIcon"
	case .logBooms:
		return "LogBoomsIcon"
	case .none:
		return ""
	}
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
		SelectionView(selectionType: .sawmill).environmentObject(ViewIndex())
    }
}
