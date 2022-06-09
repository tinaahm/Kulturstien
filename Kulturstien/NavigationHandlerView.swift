//
//  NavigationHandlerView.swift
//  Kulturstien
//
//  Created by Tina on 13/05/2022.
//

import SwiftUI
import UIKit

var quizSelection: Structure = .none
var informationSelection: Structure = .none
var personSelection: Person = .none
var gameSelection: Game = .none

var quizes = Quizes()

var millInformationTexts = getTextsByType(type: .mill)
var sawmillInformationTexts = getTextsByType(type: .sawmill)
var damInformationTexts = getTextsByType(type: .dam)
var logBoomsInformationTexts = getTextsByType(type: .logBooms)

/// View that returns the view to be shown in the app.
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
			case .whacANokk:
				WhacANokkView()
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
			case .millGame:
				MillGameView()
			case .resetView:
				ResetView()
			case .secondReset:
				SecondReset()
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

/// Extension of SwiftUI Font which adds the fonts and sizes used in the app.
extension Font {
	static let headlineFont = Font.custom("SourceSansPro-SemiBold", size: Font.TextStyle.title3.size, relativeTo: .caption)
	static let subHeadlineFont = Font.custom("SourceSansPro-Regular", size: 20, relativeTo: .caption)
	static let textFont = Font.custom("SourceSansPro-Regular", size: Font.TextStyle.headline.size, relativeTo: .caption)
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
}
