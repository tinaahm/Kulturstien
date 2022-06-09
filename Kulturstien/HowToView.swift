//
//  HowToView.swift
//  Kulturstien
//
//  Created by Tina on 03/06/2022.
//

import SwiftUI

/// View that shows the page of the app "explaination".
struct HowToView: View {
	
	@EnvironmentObject var page: ViewIndex
	
    var body: some View {
		VStack {
			BackButtonView(buttonColour: page.lightMode ? .black : .white)
		ScrollView {
			VStack {
				Text("Slik bruker du appen")
					.foregroundColor(page.lightMode ? .black : .white)
					.font(.headlineFont)
				
				VStack {
					
                    Text("Dagtid")
						.foregroundColor(page.lightMode ? .black : .white)
                        .font(.subHeadlineFont)
                        .padding(.top, 20)
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color("Grey"))
                            .shadow(radius: 2, x: 0, y: 3)

                        VStack (alignment: .leading){
                            HStack (){
                                Image("Moon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                Text("Bytt til natt")
                                    .font(.textFont)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.bottom, 10)
                            
                            HStack (){
                                Image("KirstiButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                Text("Les om innbyggere")
                                    .font(.textFont)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.bottom, 10)
                            
                            HStack (){
                                Image("SawmillButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                
                                Text("Les om driften i Byåa, ta quiz og se AR")
                                    .font(.textFont)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    .frame(height: ((DeviceSize.height * 0.1)/1.7), alignment: .top)
                            
                                
                            }
                            .padding(.bottom, 10)
                            
                            HStack (){
                                Image("Trophy")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                Text("Spill")
                                    .font(.textFont)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                        .padding(30)
                    }
                    .frame(width: 330)
                    .padding(20)
                    
                    Text("Kveldstid")
						.foregroundColor(page.lightMode ? .black : .white)
                        .font(.subHeadlineFont)
                        .padding(.top, 20)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color("Grey"))
                            .shadow(radius: 2, x: 0, y: 3)

                        VStack (alignment: .leading){
                            
                            HStack (){
                                Image("Sun")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                Text("Byaå om dagen")
									.font(.textFont)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.bottom, 10)
                            
                            HStack (){
                                Image("Troll")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                Text("Les om overnaturlige vesener")
									.font(.textFont)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    .frame(height: ((DeviceSize.height * 0.1)/1.7), alignment: .top)
                                Spacer()
                            }
                            .padding(.bottom, 10)
                            
                            HStack (){
                                Image("BonfireButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                Text("Spill")
                                    .font(.textFont)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            
                        }
                        .padding(30)
                        
                    }
                        
                    .frame(width: 330)
                    .padding(20)
				}
				
				VStack {
					
				}
                Spacer()
			}
		}
		}
		
		.background(Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground"))
    }
}

/*
struct HowToView_Previews: PreviewProvider {
    static var previews: some View {
        HowToView().environmentObject(ViewIndex())
    }
}*/
