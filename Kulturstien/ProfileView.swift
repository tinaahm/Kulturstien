//
//  ProfileView.swift
//  Kulturstien
//
//  Created by Tina on 12/05/2022.
//

import SwiftUI

struct ProfileView: View {
	
	@EnvironmentObject var page : ViewIndex
	
    var body: some View {
		VStack {
			
			BackButtonView()
			
			Image(getImageTitleByColour(colour: page.user.selectedColour))
			.resizable()
			.frame(width: 100, height: 100)
			.padding(5)
			
			Text("Hei " + page.user.name.capitalized + "!")
				.padding([.leading, .top, .trailing])
				.padding(.bottom, 90)
			
			Button(action: {
				
			}) {
				Text("Slik spiller du")
			}
            .frame(width: 275, height: 25)
            .padding()
            .background(RoundedRectangle(cornerRadius: 15)
                .fill(Color("Grey"))
                .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 3)
               
            )
            .foregroundColor(.black)
            
            
			Button(action: {
				
			}) {
				Text("Endre avatar")
			}
            .frame(width: 275, height: 25)
            .padding()
            .background(RoundedRectangle(cornerRadius: 15)
                .fill(Color("Grey"))
                .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 3)
               
            )
            .foregroundColor(.black)
            .padding()
            
			Button(action: {
				
			}) {
				Text("Quiz progresjon")
			}
			.frame(width: 275, height: 25)
			.padding()
			.background(RoundedRectangle(cornerRadius: 15)
                .fill(Color("Grey"))
                .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 3)
               
			)
			.foregroundColor(.black)
            
			
			Spacer()
		}
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(ViewIndex())
    }
}
