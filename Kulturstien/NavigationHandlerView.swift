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

enum UserDataKeys: String {
	case userName, selectedColour, wackANokkGameScore, frightenHuldraGameScore, farmMemoryGameScore, fairtytaleMemoryGameScore, appStartPage
	case readSawmillInformation, readMillInformation, readDamInformation, readLogBoomsInformation
	case sawMillAnswers, millAnswers, damAnswers, logBoomsAnswers
}

enum Colour: String, CaseIterable, Identifiable {
	case pink = "rosa"
	case yellow = "gul"
	case green = "grønn"
	case orange = "oransje"
	case blue = "blå"
	case none = "Hva er favoritt fargen din?"
	var id: Self { self }
}

struct User {
	var wackANokkGameScore: Int = 0
	var frightenHuldraGameScore: Int = 0
	var farmMemoryGameScore: Int = 0
	var fairtytaleMemoryGameScore: Int = 0
}

enum Page: String {
	case start, main, mainNight, profile, menu, texts, quiz, selection, information, farmMemoryGame, fairytaleCreaturesMemoryGame, wackANokk, huldraGame, personInformation, creatureInformation, contact, achievements, avatarChanger, gameEnd, history, howTo, startGame, ar, memoryGameEnd, quizEnd, appTutorial
}

enum Game: String {
	case wackANokk = "Slå nøkken"
	case frightenHuldra = "Skrem Vekk Huldra"
	case farmMemoryGame = "Bondens redskaper"
	case fairytaleCreaturesMemoryGame = "Underjordiske vesener"
	case none = ""
}

var quizSelection: Structure = .none
var informationSelection: Structure = .none
var personSelection: Person = .none
var gameSelection: Game = .none

var quizes = Quizes()

class ViewIndex: ObservableObject {
	@Published var pageIndex : Page = .main
	@Published var previousPage : Page = .main
	@Published var lightMode: Bool = true
	
	@AppStorage(UserDataKeys.userName.rawValue) var userName: String = ""
	@AppStorage(UserDataKeys.selectedColour.rawValue) var selectedColour: Colour = .none
	
	@AppStorage(UserDataKeys.appStartPage.rawValue) var appStartPage: Page = .start
	@AppStorage(UserDataKeys.wackANokkGameScore.rawValue) var wackANokkGameScore: Int = 0
	@AppStorage(UserDataKeys.frightenHuldraGameScore.rawValue) var frightenHuldraGameScore: Int = 0
	@AppStorage(UserDataKeys.farmMemoryGameScore.rawValue) var farmMemoryGameScore: Int = 0
	@AppStorage(UserDataKeys.fairtytaleMemoryGameScore.rawValue) var fairtytaleMemoryGameScore: Int = 0
	
	@AppStorage(UserDataKeys.readMillInformation.rawValue) var readMillInformation: Bool = false
	@AppStorage(UserDataKeys.readSawmillInformation.rawValue) var readSawmillInformation: Bool = false
	@AppStorage(UserDataKeys.readDamInformation.rawValue) var readDamInformation: Bool = false
	@AppStorage(UserDataKeys.readLogBoomsInformation.rawValue) var readLogBoomsInformation: Bool = false
	
	@AppStorage(UserDataKeys.millAnswers.rawValue) var millAnswers: [Bool] = [false, false, false]
	@AppStorage(UserDataKeys.sawMillAnswers.rawValue) var sawMillAnswers: [Bool] = [false, false, false]
	@AppStorage(UserDataKeys.damAnswers.rawValue) var damAnswers: [Bool] = [false, false, false]
	@AppStorage(UserDataKeys.logBoomsAnswers.rawValue) var logBoomsAnswers: [Bool] = [false, false, false]
	
	@Published var quizesArray: [Quiz] = [Quiz(name: "Kvernhus Quiz", type: .mill, imageTitle: "WaterMillIcon"), Quiz(name: "Sagbruk Quiz", type: .sawmill, imageTitle: "SawmillIcon"), Quiz(name: "Demning Quiz", type: .dam, imageTitle: "DamIcon"), Quiz(name: "Lenseanlegg Quiz", type: .logBooms, imageTitle: "LogBoomsIcon")]
	@Published var scorePlaceHolder: Int = 0
	@Published var currentQuiz: Quiz = Quiz(name: "", type: .none, imageTitle: "")
}

struct NavigationHandlerView: View {
	
	@EnvironmentObject var page : ViewIndex
	
    var body: some View {
		if page.appStartPage == .start {
			ProfilePickerView()
		} else {
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
			case .quizEnd:
				QuizEndView(resultArray: page.currentQuiz.questionAnswers, title: page.currentQuiz.name)
			case .appTutorial:
				AppTutorialView()
			}
		}
    }
}

extension AnyTransition {
	static var backslide: AnyTransition {
		AnyTransition.asymmetric(
			insertion: .move(edge: .trailing),
			removal: .move(edge: .leading))
	}
}

extension Array: RawRepresentable where Element: Codable {
	public init?(rawValue: String) {
		guard let data = rawValue.data(using: .utf8),
			  let result = try? JSONDecoder().decode([Element].self, from: data)
		else {
			return nil
		}
		self = result
	}

	public var rawValue: String {
		guard let data = try? JSONEncoder().encode(self),
			  let result = String(data: data, encoding: .utf8)
		else {
			return "[]"
		}
		return result
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
