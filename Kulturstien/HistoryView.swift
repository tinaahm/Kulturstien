//
//  HistoryView.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 02/06/2022.
//

import SwiftUI

/// View that shows a page in which the user can go to the different information pages.
struct HistoryView: View {
    
    @EnvironmentObject var page: ViewIndex
    
    var body: some View {
        VStack () {
            
			BackButtonView(buttonColour: page.lightMode ? .black : .white)
            
            Image("Rælingen1")
            .resizable()
            .scaledToFit()
			.frame(width: DeviceSize.width * 0.4, height: DeviceSize.width * 0.2)
        
        Text("Byåas Historie")
			.font(.headlineFont)
			.foregroundColor(page.lightMode ? .black : .white)
            
            HStack (alignment: .top) {
                
                VStack () {
                    Button (action: {
						
						page.previousPage = page.pageIndex
						informationSelection = .mill
						setInformationPageToRead(page: page, selection: informationSelection)
						page.pageIndex = .information
                    }) {
                        VStack () {
                        Image("Wheat")
                        .resizable()
                        .frame(width: 50, height: 50)
                        Text("Kvernhus")
							.font(.textFont)
                    }
					.foregroundColor(.black)
					.frame(width: DeviceSize.width * 0.25, height: DeviceSize.width * 0.25)
					.padding(20)
					.background(
						RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
							.shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 4))
                    
                }
                    Button (action: {
						page.previousPage = page.pageIndex
						informationSelection = .sawmill
						setInformationPageToRead(page: page, selection: informationSelection)
						page.pageIndex = .information
                    }) {
                        VStack () {
                        Image("Saw")
                        .resizable()
                        .frame(width: 50, height: 50)
                        Text("Sagbruk")
								.font(.textFont)
                    }
						.foregroundColor(.black)
						.frame(width: DeviceSize.width * 0.25, height: DeviceSize.width * 0.25)
						.padding(20)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
								.shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 4))
                    
                }
                    .padding()
                    
                }
               
                
                VStack () {
                    Button (action: {
						page.previousPage = page.pageIndex
						informationSelection = .dam
						setInformationPageToRead(page: page, selection: informationSelection)
						page.pageIndex = .information
                    }) {
                        VStack () {
                        Image("WaterMill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        Text("Demning")
							.font(.textFont)
                    }
						.foregroundColor(.black)
						.frame(width: DeviceSize.width * 0.25, height: DeviceSize.width * 0.25)
						.padding(20)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
								.shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 4))
                    
                }
                    
                    Button (action: {
						page.previousPage = page.pageIndex
						informationSelection = .logBooms
						setInformationPageToRead(page: page, selection: informationSelection)
						page.pageIndex = .information
                    }) {
                        VStack () {
                        Image("LogBoomsIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 50)
                        Text("Lenseanlegg")
							.font(.textFont)
                    }
						.foregroundColor(.black)
						.frame(width: DeviceSize.width * 0.25, height: DeviceSize.width * 0.25)
						.padding(20)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
								.shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 4))
                    
                }
					.padding()
                }
                
                
            }
            .padding()
            
        
            
          Spacer()
        }
		.background(Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground"))
        
        
    }
}

/*
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView().environmentObject(ViewIndex())
    }
}*/
