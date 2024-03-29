//
//  BackButtonView.swift
//  Kulturstien
//
//  Created by Tina on 20/05/2022.
//

import SwiftUI

/// View for the button that goes back to the previous page.
struct BackButtonView: View {
	
	@EnvironmentObject var page : ViewIndex
	var buttonColour: Color = .black
	
	var body: some View {
		HStack (alignment: .top) {
			Button (action: {
				let tempPage: Page = page.previousPage
				
				if page.pageIndex == .history || page.pageIndex == .achievements {
					
					if page.lightMode {
						page.previousPage = .main
					} else {
						page.previousPage = .mainNight
					}
					
					page.pageIndex = .profile
					
				} else if page.pageIndex == .information && page.previousPage == .selection {
					page.pageIndex = .selection
				} else if page.pageIndex == .information && page.previousPage == .history {
					page.pageIndex = .history
				} else {
					if page.lightMode {
						page.previousPage = .main
						page.pageIndex = tempPage
					}
					else {
						page.previousPage = .mainNight
						page.pageIndex = tempPage
					}
				}
			}) {
				Image(systemName: "chevron.left")
				.resizable()
                .scaledToFill()
				.frame(width: 13, height: 13)
				.padding(15)
				.foregroundColor(buttonColour)
			}
			.padding(.leading)
			Spacer()
		}
	}
}

//struct BackButtonView_Previews: PreviewProvider {
//	static var previews: some View {
//		BackButtonView().environmentObject(ViewIndex())
//	}
//}
