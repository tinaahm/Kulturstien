//
//  ProfilePickerView.swift
//  Kulturstien
//
//  Created by Tina on 01/06/2022.
//

import SwiftUI

enum Colour: String, CaseIterable, Identifiable {
	case pink = "rosa"
	case yellow = "gul"
	case green = "grønn"
	case orange = "oransje"
	case blue = "blå"
	case none = "Hva er favoritt fargen din?"
	var id: Self { self }
}

struct ProfilePickerView: View {
	
	@EnvironmentObject var page : ViewIndex
	
	//@State var name: String = ""
	//@State var selectedColour: Colour = .none
	@State var pressedNext: Bool = false
	
    var body: some View {
		VStack {
			if !self.pressedNext {
			Spacer()
			Text("Velkommen til Byåa Kultursti!")
				.padding(.bottom, 50)
			VStack {
				HStack {
					TextField("Hva er navnet ditt?", text: $page.user.name)
				}
				.frame(width: 250)
				.padding()
				.background(RoundedRectangle(cornerRadius: 15)
					.stroke(Color.gray, lineWidth: 1)
				)
			//.padding([.leading, .trailing], 80)
			
			/*Picker("Hva er favoritt fargen din?", selection: $selectedColour) {
				ForEach(Colour.allCases) {
					colour in
					Text(colour.rawValue.capitalized)
				}
			}
			.pickerStyle(MenuPickerStyle())*/
			
				Menu {
					ForEach(Colour.allCases) { colour in
						Button(action: {
							page.user.selectedColour = colour
						}) {
							Label(colour == .none ? colour.rawValue : colour.rawValue.capitalized, systemImage: "")
						}
						.frame(width: 250)
						.padding()
						.background(RoundedRectangle(cornerRadius: 15)
							.stroke(Color.gray, lineWidth: 1)
						)
						.foregroundColor(.black)
					}
				} label: {
					HStack {
						Text(page.user.selectedColour == .none ? page.user.selectedColour.rawValue : page.user.selectedColour.rawValue.capitalized)
						Spacer()
						Image(systemName: "chevron.down")
					}
					.frame(width: 250)
					.padding()
					.background(RoundedRectangle(cornerRadius: 15)
						.stroke(Color.gray, lineWidth: 1)
					)
					.foregroundColor(.black)
				}
			}
			Spacer()
			Spacer()
			
				if !page.user.name.isEmpty && page.user.selectedColour != .none {
				Button(action: {
					self.pressedNext = true
				}) {
					Text("Neste")
						.frame(width: 100)
						.padding()
						.background(RoundedRectangle(cornerRadius: 15)
							.stroke(Color.gray, lineWidth: 1)
						)
						.foregroundColor(.black)
				}
			}
			Spacer()
			} else {
				
				Image(getImageTitleByColour(colour: page.user.selectedColour))
					.resizable()
					.scaledToFit()
					.padding([.leading, .top, .trailing], 90)
					.padding(.bottom, 20)
				Text("Hei " + page.user.name.capitalized)
					.padding([.leading, .top, .trailing])
					.padding(.bottom, 90)
				Button(action: {
					page.pageIndex = .main
				}) {
					Text("Start")
						.frame(width: 100)
						.padding()
						.background(RoundedRectangle(cornerRadius: 15)
							.stroke(Color.gray, lineWidth: 1)
						)
						.foregroundColor(.black)
				}
				Spacer()
			}
		}
		
		
    }
}

func getImageTitleByColour(colour: Colour) -> String {
	switch colour {
	case .pink:
		return "Bunny"
	case .yellow:
		return "Chicken"
	case .green:
		return "Troll-1"
	case .orange:
		return "Reindeer"
	case .blue:
		return "Cow"
	case .none:
		return ""
	}
}

struct ProfilePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePickerView().environmentObject(ViewIndex())
    }
}
