//
//  InformationView.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 19/05/2022.
//

import SwiftUI

struct InformationView: View {
    
    @EnvironmentObject var page : ViewIndex
	@State var type: Structure
	@State var information: [Paragraph]
	@State var title: String
	
	init(type: Structure) {
		self.type = type
		self.information = getInformationByType(type: type)
		self.title = type.rawValue.capitalized
	}
    
    var body: some View {
		
        ScrollView {
            VStack {
				BackButtonView() //TODO: title inline with back button?
				
				VStack(alignment: .leading) {
					Text(self.title)
						.font(.title)
				}
				.padding(.bottom, 30)
				
				ForEach(0 ..< self.information.count) {
					index in
					
					
					Image(self.information[index].imageTitle)
						.resizable()
						.scaledToFit()
						.aspectRatio(contentMode: .fill)
						.frame(width: 350, height: 250)
					
						VStack(alignment: .leading) {
							
							/*HStack {
								
								RoundedRectangle(cornerRadius: 25, style: .continuous)
									.fill(.white)*/

								ZStack {
									RoundedRectangle(cornerRadius: 25, style: .continuous)
										.fill(Color("Grey"))
										.shadow(radius: 2, x: 0, y: 3)

									VStack {
										Text(self.information[index].text) //FIXME: add multiline center?
											.font(.body)
											.foregroundColor(.black)
									}
									.padding(30)
									.multilineTextAlignment(.center)
								}
								.frame(width: 350)
								.padding(20)
							//}
						}
						.padding()
							Spacer()
					}
				}
        }
		.background(Color("BackgroundColour"))
        
    }
}

func getInformationByType(type: Structure) -> [Paragraph] {
	
	switch type {
	case .mill:
		return millInformationTexts
	case .sawmill:
		return sawmillInformationTexts
	case .dam:
		return damInformationTexts
	case .logBooms:
		return logBoomsInformationTexts
	case .none:
		return []
	}
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
		InformationView(type: .sawmill).environmentObject(ViewIndex())
    }
}



