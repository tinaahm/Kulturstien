//
//  NavigationHandlerView.swift
//  Kulturstien
//
//  Created by Tina on 13/05/2022.
//

import SwiftUI

enum Page {
	case start, main, mainNight, profile, menu, achievements, texts, quiz, selection, information, cardGame, wackANokk, huldraGame, personInformation
}

var quizSelection: Structure = .none
var informationSelection: Structure = .none
var personSelection: Person = .none

var quizes = Quizes()

class ViewIndex: ObservableObject {
	@Published var pageIndex : Page = .start //TODO: if user has profile do not show start/ProfilePickerView.
	@Published var previousPage : Page = .main
	@Published var lightMode: Bool = true
}

struct NavigationHandlerView: View {
	
	@EnvironmentObject var page : ViewIndex
	
    var body: some View {
		switch page.pageIndex {
		case .start:
			ProfilePickerView()
		case .main:
			MainIPhoneView()
		case .mainNight:
			MainNightTimeView()
		case .profile:
			ProfileView()
		case .menu:
			MenuView()
				.transition(.backslide)
		case .achievements:
			MenuView()
		case .texts:
			MenuView()
		case .quiz:
			QuizView(quizType: quizSelection)
		case .selection:
			SelectionView(selectionType: informationSelection)
        case .information:
			InformationView(type: informationSelection)
                .transition(.backslide)
        case .cardGame:
            ThemeSelectionView(tcManager: ThemeCollectionManager())
                .transition(.backslide)
		case .wackANokk:
			WackANokkView()
		case .huldraGame:
			MenuView()
		case .personInformation:
			PersonInformationView(personType: personSelection)
		}
    }
}

/*struct NavigationHandlerView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationHandlerView().environmentObject(ViewIndex())
    }
}*/

extension AnyTransition {
	static var backslide: AnyTransition {
		AnyTransition.asymmetric(
			insertion: .move(edge: .trailing),
			removal: .move(edge: .leading))
	}
}
