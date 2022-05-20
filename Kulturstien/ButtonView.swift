//
//  ButtonView.swift
//  Kulturstien
//
//  Created by Tina on 20/05/2022.
//

import SwiftUI

struct ButtonView: View {
	
	@EnvironmentObject var page : ViewIndex
	
	var selectionType : Structure
	var image: String
	var width: CGFloat
	var height: CGFloat
	var posX: CGFloat
	var posY: CGFloat
	
	var body: some View {
		Button (action: {
			page.previousPage = page.pageIndex
			informationSelection = selectionType
			page.pageIndex = .selection
		}) {
			Image(image)
				.resizable()
				.frame(width: width, height: height)
				.padding(15)
		}
		.position(x: posX, y: posY)
	}
}

/*struct ButtonView_Previews: PreviewProvider {
	static var previews: some View {
		ButtonView(selectionType: .none, image: "", width: 0, height: 0, posX: 0, posY: 0).environmentObject(ViewIndex())
	}
}*/
