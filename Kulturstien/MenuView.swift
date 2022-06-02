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
        
        VStack (spacing: 20){
            
            BackButtonView()
            
            Spacer()
            
            Button(action: {
				page.previousPage = page.pageIndex
				page.pageIndex = .history
            }) {
                Text("Byåas historie")
					.foregroundColor(.black)
					.frame(width: 200)
					.padding()
					.background(RoundedRectangle(cornerRadius: 15)
						.stroke(Color.gray, lineWidth: 1))
            }
			
			Button(action: {
				page.previousPage = page.pageIndex
				page.pageIndex = .contact
			}) {
				Text("Kontakt oss")
					.foregroundColor(.black)
					.frame(width: 200)
					.padding()
					.background(RoundedRectangle(cornerRadius: 15)
						.stroke(Color.gray, lineWidth: 1))
			}
            
            Spacer()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().environmentObject(ViewIndex())
    }
}
    
