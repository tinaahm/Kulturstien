//
//  NavigationHandlerView.swift
//  Kulturstien
//
//  Created by Tina on 13/05/2022.
//

import SwiftUI
import UIKit

class DeviceSize {
	static var width = UIScreen.main.bounds.size.width
	static var height = UIScreen.main.bounds.size.height
	static var size = UIScreen.main.bounds.size
}

struct User {
	var name: String = ""
	var selectedColour: Colour = .none
	var wackANokkGameScore: Int = 0
	var frightenHuldraGameScore: Int = 0
	var farmMemoryGameScore: Int = 0
	var fairtytaleMemoryGameScore: Int = 0
}

enum Page {
	case start, main, mainNight, profile, menu, texts, quiz, selection, information, farmMemoryGame, fairytaleCreaturesMemoryGame, wackANokk, huldraGame, personInformation, creatureInformation, contact, achievements, avatarChanger, gameEnd, history, howTo, startGame, ar, memoryGameEnd
}

var quizSelection: Structure = .none
var informationSelection: Structure = .none
var personSelection: Person = .none
var gameSelection: Game = .none

var quizes = Quizes()

class ViewIndex: ObservableObject {
	@Published var pageIndex : Page = .start //TODO: if user has profile do not show start/ProfilePickerView.
	@Published var previousPage : Page = .main
	@Published var lightMode: Bool = true
	@Published var user: User = User()
	//@Published var quizes = Quizes()
	@Published var quizesArray: [Quiz] = [Quiz(name: "Kvernhus Quiz", type: .mill, imageTitle: "WaterMillIcon"), Quiz(name: "Sagbruk Quiz", type: .sawmill, imageTitle: "SawmillIcon"), Quiz(name: "Demning Quiz", type: .dam, imageTitle: "DamIcon"), Quiz(name: "Lenseanlegg Quiz", type: .logBooms, imageTitle: "LogBoomsIcon")]
	@Published var scorePlaceHolder: Int = 0
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
		case .texts:
			MenuView()
		case .quiz:
			QuizView(quizType: quizSelection)
		case .selection:
			SelectionView(selectionType: informationSelection)
        case .information:
			InformationView(type: informationSelection)
                .transition(.backslide)
        case .farmMemoryGame:
			FarmMemoryGameView()
		case .fairytaleCreaturesMemoryGame:
			FairytaleMemoryGameView()
		case .wackANokk:
			WackANokkView()
		case .huldraGame:
			//FrightenHuldraGameView(/*size: DeviceSize.size*/)
			//GameEndView(gameType: gameSelection)
			FrightenHuldraGameView()
		case .personInformation:
			PersonInformationView(personType: personSelection)
		case .creatureInformation:
			CreaturesInformationView(creatureType: personSelection)
        case .contact:
            ContactView()
        case .achievements:
            ProgressionView()
        case .avatarChanger:
            AvatarEditorView()
		case .memoryGameEnd:
			GameEndView(gameType: gameSelection)
		case .history:
			HistoryView()
		case .howTo:
			HowToView()
		case .startGame:
			GameStartView()
		case .ar:
			WaterMillARView()
		case .gameEnd:
			HuldraGameOverView(score: page.scorePlaceHolder)
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

/*
extension Font {
	static let mediumFont = Font.custom("Sans-Regular", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
	static let mediumSmallFont = Font.custom("Sans-Regular", size: Font.TextStyle.footnote.size, relativeTo: .caption)
	static let smallFont = Font.custom("Sans-Regular", size: Font.TextStyle.caption.size, relativeTo: .caption)
	static let verySmallFont = Font.custom("Sans-Regular", size: Font.TextStyle.caption2.size, relativeTo: .caption)
}

extension Font.TextStyle {
	var size: CGFloat {
		switch self {
		case .largeTitle: return 60
		case .title: return 48
		case .title2: return 34
		case .title3: return 24
		case .headline, .body: return 18
		case .subheadline, .callout: return 16
		case .footnote: return 14
		case .caption: return 12
		case .caption2: return 10
		@unknown default:
			return 8
		}
	}
}*/
