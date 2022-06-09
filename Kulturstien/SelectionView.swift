//
//  SelectionView.swift
//  Kulturstien
//
//  Created by Tina on 20/05/2022.
//

import SwiftUI

/// View showing the individual pages for the structures.
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
			
			BackButtonView(buttonColour: page.lightMode ? .black : .white)
            
            VStack {
                Text(structureName.uppercased())
					.font(.headlineFont)
            }
			
			VStack {
			Image(imageTitle)
                .padding(60)
				
				if self.showQuizButtonInformationText {
					Text("For å låse opp quiz så må du først lese teksten over!")
						.font(.textFont)
						.foregroundColor(.red)
						.frame(width: DeviceSize.width * 0.7)
						.padding()
				}
			
				Button (action: {
					setInformationPageToRead(page: page, selection: self.selectionType)
					
					page.previousPage = page.pageIndex
					page.pageIndex = .information
				}) {
					Text("Les og lær")
						.font(.textFont)
						.foregroundColor(.black)
						.frame(width: DeviceSize.width * 0.7)
						.padding(20)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
								.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
				}
				.padding(.bottom)
				
				Button (action: {
					
					if getInformationPageRead(page: page, selection: self.selectionType) {
						page.previousPage = page.pageIndex
						quizSelection = selectionType
						page.pageIndex = .quiz
					} else {
						self.quizButtonColour = .red
						self.showQuizButtonInformationText = true
					}
				}) {
					Text("Ta quiz")
						.font(.textFont)
						.foregroundColor(.black)
						.frame(width: DeviceSize.width * 0.7)
						.padding(20)
						.overlay(RoundedRectangle(cornerRadius: 15)
							.stroke(self.quizButtonColour, lineWidth: 1)
						)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
								.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4)
						)
				}
				.padding(.bottom)
				
				
				if self.selectionType == .mill {
					Button (action: {
						page.previousPage = page.pageIndex
						page.pageIndex = .ar
					}) {
						Text("Se i AR")
							.font(.subHeadlineFont)
							.foregroundColor(.black)
							.frame(width: DeviceSize.width * 0.7)
							.padding(20)
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

/// Get the image that coincides with the specified structure.
///
/// - Parameters:
/// 	- selectionType: The structure of the button pressed in the "day time"-map.
///
/// - Returns: The image title of the structure.
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

/// Sets the information page that user enters to "read".
///
/// - Parameters:
/// 	- page: The environment object which keeps track of the app data.
/// 	- selection: The selected structure.
///
func setInformationPageToRead(page: ViewIndex, selection: Structure) {
	switch selection {
	case .mill:
		page.readMillInformation = true
	case .sawmill:
		page.readSawmillInformation = true
	case .dam:
		page.readDamInformation = true
	case .logBooms:
		page.readLogBoomsInformation = true
	case .none:
		return
	}
}

/// See if the selected information page has been read.
///
/// - Parameters:
/// 	- page: The environment object which keeps track of the app data.
/// 	- selection: The selected structure.
///
///- Returns: Whether or not the information page has been read.
func getInformationPageRead(page: ViewIndex, selection: Structure) -> Bool {
	switch selection {
	case .mill:
		return page.readMillInformation
	case .sawmill:
		return page.readSawmillInformation
	case .dam:
		return page.readDamInformation
	case .logBooms:
		return page.readLogBoomsInformation
	case .none:
		return false
	}
}

/*
struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
		SelectionView(selectionType: .sawmill).environmentObject(ViewIndex())
    }
}*/
