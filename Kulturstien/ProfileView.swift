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
				page.previousPage = page.pageIndex
                page.pageIndex = .achievements
			}) {
				Text("Prestasjoner")
					.frame(width: 200)
					.padding()
					.overlay(RoundedRectangle(cornerRadius: 15)
						.stroke(Color.gray, lineWidth: 1)
					)
					.background(RoundedRectangle(cornerRadius: 15)
						.fill(.white)
					)
					.foregroundColor(.black)
			}.padding(5)
            
			Button(action: {
				page.previousPage = page.pageIndex
				page.pageIndex = .history
			}) {
				Text("Byåas historie")
					.foregroundColor(.black)
					.frame(width: 200)
					.padding()
					.overlay(RoundedRectangle(cornerRadius: 15)
						.stroke(Color.gray, lineWidth: 1)
					)
					.background(RoundedRectangle(cornerRadius: 15)
						.fill(.white)
					)
			}.padding(5)
			
			Button(action: {
				page.previousPage = page.pageIndex
				page.pageIndex = .avatarChanger
			}) {
				Text("Endre avatar")
					.frame(width: 200)
					.padding()
					.overlay(RoundedRectangle(cornerRadius: 15)
						.stroke(Color.gray, lineWidth: 1)
					)
					.background(RoundedRectangle(cornerRadius: 15)
						.fill(.white)
					)
					.foregroundColor(.black)
			}
			.padding(5)
			
			Button(action: {
				page.previousPage = page.pageIndex
				page.pageIndex = .howTo
			}) {
				Text("Slik bruker du appen")
					.frame(width: 200)
					.padding()
					.overlay(RoundedRectangle(cornerRadius: 15)
						.stroke(Color.gray, lineWidth: 1)
					)
					.background(RoundedRectangle(cornerRadius: 15)
						.fill(.white)
					)
					.foregroundColor(.black)
			}
			.padding(5)
			
			Button(action: {
				page.previousPage = page.pageIndex
				page.pageIndex = .contact
			}) {
				Text("Kontakt oss")
					.foregroundColor(.black)
					.frame(width: 200)
					.padding()
					.overlay(RoundedRectangle(cornerRadius: 15)
						.stroke(Color.gray, lineWidth: 1)
					)
					.background(RoundedRectangle(cornerRadius: 15)
						.fill(.white)
					)
			}.padding(5)
			
			Spacer()
		}
		.background(Color("BackgroundColour"))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(ViewIndex())
    }
}
