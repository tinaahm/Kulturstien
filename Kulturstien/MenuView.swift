//
//  MenuView.swift
//  Kulturstien
//
//  Created by Tina on 13/05/2022.
//

import SwiftUI

struct MenuView: View {
	
	@EnvironmentObject var page : ViewIndex
	
    var body: some View {
        
        Button (action: {
            page.pageIndex = .cardGame
        }) {
            Text("Spill kortspill")
                .foregroundColor(.black)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 3)
                )
        }
     
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().environmentObject(ViewIndex())
    }
}
