//
//  AppStartView.swift
//  Kulturstien
//
//  Created by Tina on 06/06/2022.
//

import SwiftUI

struct PageInformation: Codable {
	var imageTitle: String
	var pageExplaination: String
}

struct AppStartView: View {
	
	//@State var pagesArray: [PageInformation]
	@State var selectedIndex = 0
	
    var body: some View {
		VStack {
			
			ZStack {
				RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
						  .shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 4)
				Image(pageInformation[self.selectedIndex].imageTitle)
					.resizable()
					.frame(width: DeviceSize.width * 0.5, height: DeviceSize.width * 0.5)
					.aspectRatio(contentMode: .fill)
					.overlay(
						RoundedRectangle(cornerRadius: 40).fill(.clear).shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 4)
						  )
			}
			.frame(width: DeviceSize.width * 0.6, height: DeviceSize.width * 0.6)
			
			Text(pageInformation[self.selectedIndex].pageExplaination)
			
			HStack {
				ForEach(0 ..< pageInformation.count) {
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
							  if self.selectedIndex < (pageInformation.count - 1) {
								  self.selectedIndex += 1
								  }
							  }
						  }
			)
    }
}

struct AppStartView_Previews: PreviewProvider {
    static var previews: some View {
        AppStartView()
    }
}
