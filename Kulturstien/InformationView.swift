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
	@State var information: Information
	
	init(type: Structure) {
		self.type = type
		self.information = getInformationByType(type: type)
	}
    
    var body: some View {
		
		let images : [String] = getImages(information: information)
		let texts : [String] = getTexts(information: information)
		
        ScrollView {
            VStack {
                /*ZStack(alignment: .topLeading) {
					Color.clear
					VStack(alignment: .leading) {
						Button (action: {
							page.pageIndex = .main
						}) {
							Image(systemName: "chevron.left")
								.resizable()
								.frame(width: 15, height: 25)
								.padding(.leading, 25)
								.foregroundColor(.black)
						}
						
					}
			
				}
                .padding(.bottom, -20)*/
				
				BackButtonView() //TODO: title inline with back button?
				
				VStack(alignment: .leading) {
					Text(information.title)
						.font(.title)
				}
				.padding(.bottom, 30)
				
				ForEach(0 ..< images.count) {
					index in
					
					
					Image(information.image1)
						.resizable()
						.scaledToFit()
						.aspectRatio(contentMode: .fill)
						.frame(width: 350, height: 250)
						.shadow(radius: 7)
					
						VStack(alignment: .leading) {
							
							HStack {
								
								RoundedRectangle(cornerRadius: 25, style: .continuous)
									.fill(.white)

								ZStack {
									RoundedRectangle(cornerRadius: 25, style: .continuous)
										.fill(Color("Grey"))
										.shadow(radius: 7, x: -2, y: 5)

									VStack {
										Text(texts[index])
											.font(.body)
											.foregroundColor(.black)

										
									}
									.padding(20)
									.multilineTextAlignment(.center)
								}
								.frame(width: 350, height: 250)
								.padding(20)
							}
						}
						.padding()
							Spacer()
					
					
					}
				}
        }
        
    }
}

func getImages(information: Information) -> [String] {
	var images = [String]()
	
	images.append(information.image1)
	images.append(information.image2)
	images.append(information.image3)
	
	return images
}

func getTexts(information: Information) -> [String] {
	var texts = [String]()
	
	texts.append(information.text1)
	texts.append(information.text2)
	texts.append(information.text3)
	
	return texts
}

func getInformationByType(type: Structure) -> Information {
	for information in texts {
		if information.type == type {
			return information
		}
	}
	return Information.init(type: .none, title: "", image1: "", image2: "", image3: "", text1: "", text2: "", text3: "")
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
		InformationView(type: .sawmill).environmentObject(ViewIndex())
    }
}



