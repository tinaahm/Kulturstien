//
//  SelectionView.swift
//  Kulturstien
//
//  Created by Tina on 20/05/2022.
//

import SwiftUI

struct SelectionView: View {
	
	@EnvironmentObject var page : ViewIndex
	
	var selectionType: Structure
	
    var body: some View {
		
		let structureName: String = self.selectionType.rawValue
		let imageTitle = getImageTitleFromSelection(selectionType: selectionType)
		
		VStack (spacing: 20) {
			
			BackButtonView()
			
			Image(imageTitle)
			
			Button (action: {
				page.previousPage = page.pageIndex
				page.pageIndex = .information
			}) {
				Text("Lær om " + structureName)
					.foregroundColor(.black)
					.padding()
					.overlay(
						RoundedRectangle(cornerRadius: 20)
							.stroke(.gray, lineWidth: 3)
					)
			}
			Button (action: {
				page.previousPage = page.pageIndex
				quizSelection = selectionType
				page.pageIndex = .quiz
			}) {
				Text("Ta quiz om " + structureName)
					.foregroundColor(.black)
					.padding()
					.overlay(
						RoundedRectangle(cornerRadius: 20)
							.stroke(.gray, lineWidth: 3)
					)
			}
			if self.selectionType == .mill {
				Button (action: {
					page.previousPage = page.pageIndex
				}) {
					Text("Se i AR")
						.foregroundColor(.black)
						.padding()
						.overlay(
							RoundedRectangle(cornerRadius: 20)
								.stroke(.gray, lineWidth: 3)
						)
				}
			}
			Spacer()
		}
    }
}

func getImageTitleFromSelection(selectionType: Structure) -> String {
	switch selectionType {
	case .mill:
		return "MillIcon"
	case .sawmill:
		return "SawmillIcon"
	case .dam:
		return ""
	case .logBooms:
		return ""
	case .none:
		return ""
	}
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
		SelectionView(selectionType: .sawmill).environmentObject(ViewIndex())
    }
}
