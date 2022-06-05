//
//  SelectionView.swift
//  Kulturstien
//
//  Created by Tina on 20/05/2022.
//

import SwiftUI

struct SelectionView: View {
	
	@EnvironmentObject var page : ViewIndex
	@State var quizButtonColour = Color.gray
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
                    .frame(width: 200)
                    .padding()
					.overlay(RoundedRectangle(cornerRadius: 15)
						.stroke(Color.gray, lineWidth: 1)
					)
					.background(RoundedRectangle(cornerRadius: 15)
						.fill(.white)
					)
			}
			
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
                    .frame(width: 200)
                    .padding()
					.overlay(RoundedRectangle(cornerRadius: 15)
						.stroke(self.quizButtonColour, lineWidth: 1)
					)
					.background(RoundedRectangle(cornerRadius: 15)
						.fill(.white)
					)
			}
			
			if self.showQuizButtonInformationText {
				Text("For å låse opp quiz så må du først lese teksten over!")
					.foregroundColor(.red)
					.font(.callout)
					.frame(width: 200)
					.padding()
			}
			
			
			if self.selectionType == .mill {
				Button (action: {
					page.previousPage = page.pageIndex
					page.pageIndex = .ar
					//self.showARButtonInformationText = true
				}) {
					Text("Se i AR")
                        .foregroundColor(.black)
                        .frame(width: 200)
                        .padding()
						.overlay(RoundedRectangle(cornerRadius: 15)
							.stroke(Color.gray, lineWidth: 1)
						)
						.background(RoundedRectangle(cornerRadius: 15)
							.fill(.white)
						)
				}
			}
				/*
				if self.showARButtonInformationText {
					Text("Hei! Du må være på stedet for å kunne se kvernehuset i AR.")
						.foregroundColor(.red)
						.font(.callout)
						.frame(width: 200)
						.padding()
				}*/
				
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
