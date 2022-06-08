//
//  ResetView.swift
//  Kulturstien
//
//  Created by Tina on 08/06/2022.
//

import SwiftUI

struct ResetView: View {
	
	@EnvironmentObject var page : ViewIndex
	var resetPage = true
	
    var body: some View {
		ZStack {
			Image("Rælingen2")
		}.onAppear() {
			if resetPage {
				page.pageIndex = .secondReset
			}
		}
    }
}


struct ResetView_Previews: PreviewProvider {
    static var previews: some View {
        ResetView().environmentObject(ViewIndex())
    }
}
