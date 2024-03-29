//
//  PersonInformationView.swift
//  Kulturstien
//
//  Created by Tina on 31/05/2022.
//

import SwiftUI

///
/// Code from [StackOverFlow](https://stackoverflow.com/questions/59109138/how-to-implement-a-left-or-right-draggesture-that-trigger-a-switch-case-in-swi).
///
enum SwipeHVDirection: String {
	case left, right, up, down, none
}

///
/// Code from [StackOverFlow](https://stackoverflow.com/questions/59109138/how-to-implement-a-left-or-right-draggesture-that-trigger-a-switch-case-in-swi).
///
func detectDirection(value: DragGesture.Value) -> SwipeHVDirection {
if value.startLocation.x < value.location.x - 24 {
			return .left
		  }
		  if value.startLocation.x > value.location.x + 24 {
			return .right
		  }
		  if value.startLocation.y < value.location.y - 24 {
			return .down
		  }
		  if value.startLocation.y > value.location.y + 24 {
			return .up
		  }
  return .none
}

/// View for the information of the person selected by the user.
struct PersonInformationView: View {
	
	@State var personType: Person
	@State var person: PersonInformation
	@State var personParagraphs: [String]
	@State var selectedIndex: Int = 0
	@State private var offset = CGSize.zero
	
	init(personType: Person) {
		self.personType = personType
		self.person = getPersonBySelection(selection: personType)
		self.personParagraphs = getInformationArrayFromSelection(selection: personType)
	}
	
    var body: some View {
		ZStack {
			
			Image(self.person.imageTitle)
				.resizable()
			
		VStack {
			
			BackButtonView()
			
			Text("Møt " + self.person.type.rawValue + "!")
				.font(.headlineFont)
			
			VStack(alignment: .leading) {
					if personType != .trond {
						ZStack {
							Image("SpeechBubble")
								.resizable()
								.scaledToFit()
							VStack {
								Text(personParagraphs[self.selectedIndex])
										.font(.textFont)
										.foregroundColor(.black)
										.multilineTextAlignment(.center)
										.padding([.leading, .trailing], 60)
										.padding(.bottom, 20)
								HStack {
									ForEach(0 ..< personParagraphs.count, id: \.self) {
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
							HStack {
								VStack {
									Color.clear
								}
								.frame(width: 80, height: 140)
								.contentShape(RoundedRectangle(cornerRadius: 50))
								.onTapGesture {
									if self.selectedIndex != 0 {
										self.selectedIndex -= 1
										}
									}
								Spacer()
								VStack {
									Color.clear
								}
								.frame(width: 80, height: 140)
								.contentShape(RoundedRectangle(cornerRadius: 50))
								.onTapGesture {
									if self.selectedIndex < (self.personParagraphs.count - 1) {
										self.selectedIndex += 1
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
												  if self.selectedIndex < (self.personParagraphs.count - 1) {
													  self.selectedIndex += 1
													  }
												  }
											  }
								)
						}
						.padding(.top, 20)
						.padding(.leading, 70)
					} else {
						ZStack {
							Image("FlippedSpeechBubble")
								.resizable()
								.scaledToFit()
							VStack {
								Text(personParagraphs[self.selectedIndex])
									.font(.textFont)
									.foregroundColor(.black)
									.multilineTextAlignment(.center)
									.padding([.leading, .trailing], 60)
									.padding(.bottom, 20)
								HStack {
									ForEach(0 ..< self.personParagraphs.count, id: \.self) {
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
							HStack {
								VStack {
									Color.clear
								}
								.frame(width: 80, height: 140)
								.contentShape(RoundedRectangle(cornerRadius: 50))
								.onTapGesture {
									if self.selectedIndex != 0 {
										self.selectedIndex -= 1
										}
									}
								Spacer()
								VStack {
									Color.clear
								}
								.frame(width: 80, height: 140)
								.contentShape(RoundedRectangle(cornerRadius: 50))
								.onTapGesture {
									if self.selectedIndex < (self.personParagraphs.count - 1) {
										self.selectedIndex += 1
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
												  if self.selectedIndex < (self.personParagraphs.count - 1) {
													  self.selectedIndex += 1
													  }
												  }
											  }
								)
						}
						.padding(.top, 20)
						.padding(.trailing, 70)
					}

				}
			Spacer()
			}
		}
		.background(Color("BackgroundColour"))
		
    }
}

/*
struct PersonInformationView_Previews: PreviewProvider {
    static var previews: some View {
		PersonInformationView(personType: .trond).environmentObject(ViewIndex())
    }
}*/
