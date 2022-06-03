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
