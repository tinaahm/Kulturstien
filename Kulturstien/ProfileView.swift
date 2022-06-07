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
			
			Image(getImageTitleByColour(colour: page.selectedColour))
			.resizable()
			.frame(width: 100, height: 100)
			.padding(5)
			
			Text("Hei " + page.userName.capitalized + "!")
				.padding([.leading, .top, .trailing])
				.padding(.bottom, 60)
            
			Button(action: {
				page.previousPage = page.pageIndex
                page.pageIndex = .achievements
			}) {
				Text("Prestasjoner")
					.foregroundColor(.black)
					.frame(width: DeviceSize.width * 0.7)
					.padding(20)
					.background(
						RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
							.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
			}.padding(10)
            
			Button(action: {
				page.previousPage = page.pageIndex
				page.pageIndex = .history
			}) {
				Text("Byåas historie")
					.foregroundColor(.black)
					.frame(width: DeviceSize.width * 0.7)
					.padding(20)
					.background(
						RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
							.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
			}.padding(10)
			
			Button(action: {
				page.previousPage = page.pageIndex
				page.pageIndex = .avatarChanger
			}) {
				Text("Endre avatar")
					.foregroundColor(.black)
					.frame(width: DeviceSize.width * 0.7)
					.padding(20)
					.background(
						RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
							.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
			}
			.padding(10)
			
			Button(action: {
				page.previousPage = page.pageIndex
				page.pageIndex = .howTo
			}) {
				Text("Slik bruker du appen")
					.foregroundColor(.black)
					.frame(width: DeviceSize.width * 0.7)
					.padding(20)
					.background(
						RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
							.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
			}
			.padding(10)
			
			Button(action: {
				page.previousPage = page.pageIndex
				page.pageIndex = .contact
			}) {
				Text("Kontakt oss")
					.foregroundColor(.black)
					.frame(width: DeviceSize.width * 0.7)
					.padding(20)
					.background(
						RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
							.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
			}.padding(10)
			
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
