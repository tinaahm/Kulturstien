//
//  MainIPhoneView.swift
//  kulturstien
//
//  Created by Tina on 12/05/2022.
//

import SwiftUI

struct MainIPhoneView: View {
	
	@EnvironmentObject var page : ViewIndex
	@State private var showDarkMap = false
	
	
    var body: some View {
		ZStack {
			VStack {
				Group {
					HStack {
						Image(systemName: "person")
						.resizable()
						.frame(width: 30, height: 30)
						.padding(15)
						.padding(.leading, 30)
				
						Spacer(minLength: 0)
						
						Button (action: {
							withAnimation {
								page.pageIndex = .menu
							}
						}) {
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
				.background(.white.opacity(0.5))
				Spacer(minLength: 0)
				
				HStack {
					Spacer()
					Button (action: {}) {
						Image(systemName: "sun.max")
							.resizable()
							.frame(width: 30, height: 30)
							.padding(15)
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
        MainIPhoneView().environmentObject(ViewIndex())
    }
}
