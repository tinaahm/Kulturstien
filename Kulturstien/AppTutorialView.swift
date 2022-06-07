//
//  AppTutorialView.swift
//  Kulturstien
//
//  Created by Tina on 06/06/2022.
//

import SwiftUI

struct PageInformation: Codable {
	var imageTitle: String
	var pageExplaination: String
}

struct AppTutorialView: View {
	
	@EnvironmentObject var page : ViewIndex
	@State var pagesArray: [String] = ["AppTutorial1", "AppTutorial2", "AppTutorial3", "AppTutorial4", "AppTutorial5",  "AppTutorial6",  "AppTutorial7",  "AppTutorial8"]
	
	@State var selectedIndex = 0
	
    var body: some View {
		ZStack {
			Image(pagesArray[self.selectedIndex])
				.resizable()
				.edgesIgnoringSafeArea(.all)
			.onTapGesture {
				if self.selectedIndex != (pagesArray.count - 1) {
					self.selectedIndex += 1
				} else {
					page.pageIndex = .main
				}
			}
			VStack {
				Spacer()
				Button(action: {
					page.pageIndex = .main
				}) {
					Text("Hopp Over")
						.foregroundColor(.black)
						.frame(width: DeviceSize.width * 0.7)
						.padding(20)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
								.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
				}.padding(.bottom, DeviceSize.height * 0.06)
			}
		}
			
    }
}

struct AppTutorialView_Previews: PreviewProvider {
    static var previews: some View {
		AppTutorialView().environmentObject(ViewIndex())
    }
}
