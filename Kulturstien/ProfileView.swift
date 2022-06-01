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
			
			Spacer()
			
			Image(getImageTitleByColour(colour: page.user.selectedColour))
			.resizable()
			.frame(width: 60, height: 60)
			.padding(5)
			
			Text("Hei " + page.user.name.capitalized)
				.padding([.leading, .top, .trailing])
				.padding(.bottom, 90)
			
			Button(action: {
				
			}) {
				Text("Start")
			}
			.frame(width: 100)
			.padding()
			.background(RoundedRectangle(cornerRadius: 15)
				.stroke(Color.gray, lineWidth: 1)
			)
			.foregroundColor(.black)
			Button(action: {
				
			}) {
				Text("Start")
			}
			.frame(width: 100)
			.padding()
			.background(RoundedRectangle(cornerRadius: 15)
				.stroke(Color.gray, lineWidth: 1)
			)
			.foregroundColor(.black)
			Button(action: {
				
			}) {
				Text("Start")
			}
			.frame(width: 100)
			.padding()
			.background(RoundedRectangle(cornerRadius: 15)
				.stroke(Color.gray, lineWidth: 1)
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
