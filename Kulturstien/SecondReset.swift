//
//  SecondReset.swift
//  Kulturstien
//
//  Created by Tina on 08/06/2022.
//

import SwiftUI

struct SecondReset: View {
	
	@EnvironmentObject var page : ViewIndex
	
    var body: some View {
		ZStack {
			Image("Rælingen2")
		}.onAppear() {
				page.pageIndex = getPageByGameSelection(game: gameSelection)
		}
    }
}

struct SecondReset_Previews: PreviewProvider {
    static var previews: some View {
        SecondReset().environmentObject(ViewIndex())
    }
}
