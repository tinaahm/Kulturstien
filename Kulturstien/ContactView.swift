//
//  ContactView.swift
//  Kulturstien
//
//  Created by Christina Engene on 02/06/2022.
//

import SwiftUI

struct ContactView: View {
    
    @EnvironmentObject var page : ViewIndex
    @State private var feedBack: String = ""
    @State var sentFeedBAck: Bool = false
    
    var body: some View {
        
        VStack (spacing: 30) {

        BackButtonView()
        
        Image("RælingenKommune")
        
        Text("Kontakt Rælingen Kommune")
            .font(.title2)
			.foregroundColor(page.lightMode ? .black : .white)
            
        Text("Telefon: 63 83 50 00")
				.foregroundColor(page.lightMode ? .black : .white)
        Text("Telefax: 63 83 52 33")
				.foregroundColor(page.lightMode ? .black : .white)
        Text("postmottak@ralingen.kommune.no")
				.foregroundColor(page.lightMode ? .black : .white)
            if self.sentFeedBAck {
                Text("Din tilbakemelding er sendt")
                    .padding()
                    .frame(width: 320)
                    .background(.green)
                    .font(.title3)
                    .cornerRadius(15)
            }
                
            VStack (spacing: 25){
				ZStack(alignment: .leading) {
                //TextField("Tilbakemelding...", text: $feedBack)
				TextEditor(text: $feedBack)
						.padding()
				if feedBack.isEmpty {
					VStack {
						Text("Tilbakemelding...")
							.foregroundColor(.gray)
							.padding()
						Spacer()
					}
				}
            }
            .frame(width: 300, height: 200)
            .padding()
			.overlay(RoundedRectangle(cornerRadius: 15)
				.stroke(Color.gray, lineWidth: 1)
			)
			.background(RoundedRectangle(cornerRadius: 15)
				.fill(.white)
			)
            
            Button(action: {
                self.sentFeedBAck = true
				self.feedBack = ""
            }) {
                Text("Send")
					.foregroundColor(.black)
					.frame(width: 200)
					.padding()
					/*.overlay(RoundedRectangle(cornerRadius: 15)
						.stroke(Color.gray, lineWidth: 1)
					)
					.background(RoundedRectangle(cornerRadius: 15)
						.fill(.white)
					)*/
					.background(
						RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
							.shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 4))
            }
			Spacer()
    }
}
		.background(Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground"))
}
}
struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView().environmentObject(ViewIndex())
    }
}

