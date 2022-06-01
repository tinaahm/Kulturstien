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
					.padding(20)
                    .frame(minWidth: 0, maxWidth: 400)
                    .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(red: 0.984, green: 0.984, blue: 0.984))
                                    .shadow(color: .gray, radius: 2, x: 0, y: 2))
                
			}
			Button (action: {
				page.previousPage = page.pageIndex
				quizSelection = selectionType
				page.pageIndex = .quiz
			}) {
				Text("Ta quiz om " + structureName)
					.foregroundColor(.black)
					.padding(20)
                    .frame(minWidth: 0, maxWidth: 400)
                    .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color(red: 0.984, green: 0.984, blue: 0.984))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2))
			}
			if self.selectionType == .mill {
				Button (action: {
					page.previousPage = page.pageIndex
				}) {
					Text("Se i AR")
						.foregroundColor(.black)
						.padding(20)
                        .frame(minWidth: 0, maxWidth: 400)
                        .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(red: 0.984, green: 0.984, blue: 0.984))
                                    .shadow(color: .gray, radius: 2, x: 0, y: 2))
				}
			}
			Spacer()
		}
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
		return "LogBoomsSignIcon"
	case .none:
		return ""
	}
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
		SelectionView(selectionType: .sawmill).environmentObject(ViewIndex())
    }
}
