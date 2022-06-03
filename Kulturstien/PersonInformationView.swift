//
//  PersonInformationView.swift
//  Kulturstien
//
//  Created by Tina on 31/05/2022.
//

import SwiftUI

struct PersonInformationView: View {
	
	@State var personType: Person
	@State var person: PersonInformation
	@State var personParagraphs: [String]
	@State var selectedIndex: Int = 0
	
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
			
			VStack(alignment: .leading) {
				
				HStack {
					
					if personType != .trond {
						ZStack {
							//RoundedRectangle(cornerRadius: 25, style: .continuous)
								//.fill(Color("Grey"))
							//	.shadow(radius: 7, x: -2, y: 5)
							Image("SpeechBubble")
								.resizable()
								.scaledToFit()
			
							
							VStack {
								Text(personParagraphs[selectedIndex])
									.font(.callout)
									.foregroundColor(.black)
									.multilineTextAlignment(.center)
									.padding([.leading, .trailing], 60)
									.padding(.bottom, 20)
								HStack {
									ForEach(0 ..< personParagraphs.count) {
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
						}
						.padding(.top, 20)
						.padding(.leading, 70)
						//.padding(50)
					}
					else {
						ZStack {
							//RoundedRectangle(cornerRadius: 25, style: .continuous)
								//.fill(Color("Grey"))
							//	.shadow(radius: 7, x: -2, y: 5)
							Image("FlippedSpeechBubble")
								.resizable()
								.scaledToFit()
			
							
							VStack {
								Text(personParagraphs[selectedIndex])
									.font(.callout)
									.foregroundColor(.black)
									.multilineTextAlignment(.center)
									.padding([.leading, .trailing], 60)
									.padding(.bottom, 20)
								HStack {
									ForEach(0 ..< personParagraphs.count) {
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
						}
						.padding(.top, 20)
						.padding(.trailing, 70)
						//.padding(50)
					}

				}
				
				
			}
			Spacer()
		}
		}
		.background(Color("BackgroundColour"))
		
    }
}

func getPersonBySelection(selection: Person) -> PersonInformation {
	for person in personInformation {
		if person.type == selection {
			return person
		}
	}
	return PersonInformation(type: .none, imageTitle: "", p1: "", p2: "", p3: "")
}

func getInformationArrayFromSelection(selection: Person) -> [String] {
	var array = [String]()
	for person in personInformation {
		if person.type == selection {
			array.append(person.p1)
			array.append(person.p2)
			if person.p3.isEmpty {
				break
			} else {
				array.append(person.p3)
			}
		}
	}
	return array
}

struct PersonInformationView_Previews: PreviewProvider {
    static var previews: some View {
		PersonInformationView(personType: .trond).environmentObject(ViewIndex())
    }
}
