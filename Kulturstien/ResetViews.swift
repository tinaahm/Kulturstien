//
//  ResetViews.swift
//  Kulturstien
//
//  Created by Tina on 09/06/2022.
//

import SwiftUI

/// View for resetting the game
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

/// View for resetting the game
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
