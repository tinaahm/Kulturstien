//
//  ThemeSelectionView.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 23/05/2022.
//

//
//  ThemeSelectionView.swift
//  memory-card-matching-game
//
//  Created by Archie Liu on 2021-05-04.
//

import SwiftUI

struct ThemeSelectionView: View {
    @ObservedObject var tcManager: ThemeCollectionManager
    @State private var selectedTheme: ThemeCollection.Theme? = nil
    
    var body: some View {
        return NavigationView {
            VStack {
                List {
                    ForEach(tcManager.themes) { theme in
                        NavigationLink(destination: DestinationPageView(theme: theme)) {
                            VStack(alignment: .leading) {

							   HStack {

								   RoundedRectangle(cornerRadius: 25, style: .continuous)
									   .fill(.white)

								   ZStack {
									   RoundedRectangle(cornerRadius: 25, style: .continuous)
										   .fill(Color("Grey"))
										   .shadow(radius: 7, x: -2, y: 5)

									   HStack {
										   VStack(alignment: .center, spacing: 8) {

											   Image("Troll")
												   .resizable()
												   .scaledToFit()
												   .frame(width: 100, height: 100)

											   Text(theme.name)

										   }.font(.headline).padding()
									   }

									   .padding(20)
									   .multilineTextAlignment(.center)
								   }
								   .frame(width: 250)
								   .padding(20)
							   }
                            }
                        }
                    
                    }
                }
                .navigationBarTitle("Huskespill", displayMode: .inline)
            }
            DestinationPageView(theme: DefaultThemes.theme1)
            // Text("⬅️Select your theme from sidebar")
        }
        
    }
}

struct DestinationPageView: View {
    var theme: ThemeCollection.Theme
    var viewModel: EmojiMemoryGameViewModel
    
    init(theme: ThemeCollection.Theme) {
        self.theme = theme
        self.viewModel = EmojiMemoryGameViewModel(theme: theme)
    }

    var body: some View {
        viewModel.resetGame()
        return EmojiMemoryGameView(viewModel: viewModel)
    }
}

struct ThemeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeSelectionView(tcManager: ThemeCollectionManager())
    }
}
