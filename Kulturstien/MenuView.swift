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
        
        Text("Meny")
     
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().environmentObject(ViewIndex())
    }
}
