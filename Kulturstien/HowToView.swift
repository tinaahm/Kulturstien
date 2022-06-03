//
//  HowToView.swift
//  Kulturstien
//
//  Created by Tina on 03/06/2022.
//

import SwiftUI

struct HowToView: View {
    var body: some View {
		ScrollView {
			VStack {
				BackButtonView()
				Text("Slik bruker du appen")
					.font(.title)
				
				VStack {
					
                    Text("Dagtid")
                        .font(.subheadline)
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
                                    .font(.body)
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
                                    .font(.body)
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
                                    .font(.body)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.bottom, 10)
                            
                            HStack (){
                                Image("trophy")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                Text("Spill")
                                    .font(.body)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                        .padding(30)
                    }
                    .frame(width: 330)
                    .padding(20)
                    
                    Text("Kveldstid")
                        .font(.subheadline)
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
                                Text("Byaå om dagen. ")
                                    .font(.body)
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
                                    .font(.body)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.bottom, 10)
                            
                            HStack (){
                                Image("BonfireButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                Text("Spill")
                                    .font(.body)
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
		.background(Color("BackgroundColour"))
    }
}

struct HowToView_Previews: PreviewProvider {
    static var previews: some View {
        HowToView()
    }
}
