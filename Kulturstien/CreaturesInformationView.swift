//
//  CreaturesInformationView.swift
//  Kulturstien
//
//  Created by Tina on 01/06/2022.
//

import SwiftUI

struct CreaturesInformationView: View {
	
	@State var creatureType: Person
	@State var creature: PersonInformation
	@State var creatureParagraphs: [String]
	@State var selectedIndex: Int = 0
	
	init(creatureType: Person) {
		self.creatureType = creatureType
		self.creature = getPersonBySelection(selection: creatureType)
		self.creatureParagraphs = getInformationArrayFromSelection(selection: creatureType)
	}
	
    var body: some View {
		
		VStack {
			BackButtonView(buttonColour: .white)
			ScrollView {
				VStack {
					Image(creature.imageTitle)
						.resizable()
						.scaledToFit()
						.frame(width: 100, height: 100)
					Text(creature.type.rawValue)
						.font(.headlineFont)
						.padding(.top)
					ForEach(0 ..< creatureParagraphs.count) {
						index in
							ZStack {
								RoundedRectangle(cornerRadius: 25, style: .continuous)
									.fill(Color("CreatureInformationTextboxBackground"))
									.shadow(radius: 4, x: -2, y: 5)

								VStack(alignment: .center) {
									Text(creatureParagraphs[index])
										.font(.textFont)
										.padding()
								}
								.padding(20)
								.multilineTextAlignment(.leading)
							}
							.frame(width: DeviceSize.width * 0.85)
							.padding(10)
					}
			}
		}
			.foregroundColor(.white)
		}
		.background(Color("CreatureInformationBackground"))
    }
}

struct CreaturesInformationView_Previews: PreviewProvider {
    static var previews: some View {
		CreaturesInformationView(creatureType: .huldra)
    }
}
