//
//  TextsView.swift
//  Kulturstien
//
//  Created by Tina on 13/05/2022.
//

import SwiftUI

struct TextsView: View {
	
	@EnvironmentObject var page : ViewIndex
	
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TextsView_Previews: PreviewProvider {
    static var previews: some View {
        TextsView().environmentObject(ViewIndex())
    }
}
