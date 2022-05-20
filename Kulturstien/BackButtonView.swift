//
//  BackButtonView.swift
//  Kulturstien
//
//  Created by Tina on 20/05/2022.
//

import SwiftUI

struct BackButtonView: View {
	
	@EnvironmentObject var page : ViewIndex
	
	var body: some View {
		HStack (alignment: .top) {
			Button (action: {
				let tempPage: Page = page.previousPage
				page.previousPage = .main
				page.pageIndex = tempPage
			}) {
				Image(systemName: "chevron.left")
				.resizable()
				.frame(width: 20, height: 25)
				.padding(15)
			}
			.padding(.leading)
			Spacer()
		}
		.foregroundColor(.black)
		//.padding()
	}
}

//struct BackButtonView_Previews: PreviewProvider {
//	static var previews: some View {
//		BackButtonView().environmentObject(ViewIndex())
//	}
//}
