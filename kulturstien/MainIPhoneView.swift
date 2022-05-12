//
//  MainIPhoneView.swift
//  kulturstien
//
//  Created by Tina on 12/05/2022.
//

import SwiftUI

struct MainIPhoneView: View {
	
    var body: some View {
		ZStack {
			/*Image("Map2")
				.resizable()
				.scaledToFill()
				.edgesIgnoringSafeArea(.all)*/
				//.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
			
			VStack {
				Group {
					HStack {
						Button (action: {}) {
							Image(systemName: "person")
							.resizable()
							.frame(width: 25, height: 25)
							.padding(15)
							.overlay(
									RoundedRectangle(cornerRadius: 30)
									.stroke(lineWidth: 2)
								)
						}
						.padding(.leading, 30)
						Spacer(minLength: 0)
						VStack (alignment: .leading) {
							Text("Hei Markus!")
								.font(.subheadline)
							Text("Velkommen til Byåa Games")
								.font(.headline)
						}
						Spacer(minLength: 0)
						
						Button (action: {}) {
							Image(systemName: "line.3.horizontal")
							.resizable()
							.frame(width: 25, height: 25)
							.padding(15)
						}
						.padding(.trailing, 30)
					}
					.foregroundColor(.black)
					.frame(width: 425, height: 60)
					//.padding()
				}
				.padding()
				.background(.white)
				Spacer(minLength: 0)
				
				HStack {
					Spacer()
					Button (action: {}) {
						Image(systemName: "chevron.up")
							.resizable()
							.frame(width: 25, height: 20)
							.padding(20)
							.background(Color.white)
							.foregroundColor(.black)
						.clipShape(Circle())
					}
					.padding(.trailing)
				}
			}
		}
		.background(
				Image("Map2")
					.resizable()
					.scaledToFill()
					.edgesIgnoringSafeArea(.all)
			)
	}

}

struct MainIPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        MainIPhoneView()
    }
}


/*
 ver 1:
 VStack {
	 HStack {
		 ZStack {
			 //Color(red: 224/255, green: 229/255, blue: 236/255)
			 
			 Button (action: {}) {
				 Image(systemName: "person")
				 .resizable()
				 .frame(width: 20, height: 20)
				 .padding(15)
				 .background(Color.white)
				 .cornerRadius(30)
			 }
			 .shadow(color: Color.white, radius: 8, x: -9, y: -9)
			 .shadow(color: Color(red: 163/255, green: 177/255, blue: 198/255), radius: 8, x: 9, y: 9)
		 }
		 .padding()
		 Spacer()
		 Text("Title")
			 .font(.title)
		 Spacer()
		 ZStack {
			 //Color(red: 224/255, green: 229/255, blue: 236/255)
			 
			 Button (action: {}) {
				 Image(systemName: "line.3.horizontal")
				 .resizable()
				 .frame(width: 15, height: 15)
				 .padding(15)
				 .background(Color.white)
				 .cornerRadius(30)
			 }
			 .shadow(color: Color.white, radius: 8, x: -9, y: -9)
			 .shadow(color: Color(red: 163/255, green: 177/255, blue: 198/255), radius: 8, x: 9, y: 9)
		 }
		 .padding()
	 }
	 .frame(height: 60)
	 .padding(5)
	 Spacer(minLength: 0)
	 ZStack {
		 Color("DarkGreen")
		 Image("Map")
			 .resizable()
			 .scaledToFill()
	 }
	 Spacer(minLength: 0)
	 HStack (alignment: .bottom) {
		 Rectangle ()
			 .fill(.white)
	 }
	 .frame(height: 60)
 }
 
 
 
 idk:
 ZStack {
 Image("Map3")
			  .resizable()
		  VStack {
			  HStack {
				  ZStack {
					  Color(red: 224/255, green: 229/255, blue: 236/255)
					  
					  Button (action: {}) {
						  Image(systemName: "person")
						  .resizable()
						  .frame(width: 20, height: 20)
						  .padding(15)
						  .background(Color(red: 224/255, green: 229/255, blue: 236/255))
						  .cornerRadius(30)
					  }
					  .shadow(color: Color.white, radius: 8, x: -9, y: -9)
					  .shadow(color: Color(red: 163/255, green: 177/255, blue: 198/255), radius: 8, x: 9, y: 9)
				  }
			  }
			  Spacer()
			  
			  HStack {
				  Rectangle ()
					  .fill(.white)
			  }
		  }
	  }*/
