//
//  ViewIndex.swift
//  Kulturstien
//
//  Created by Tina on 09/06/2022.
//

import SwiftUI
import UIKit

/// Enumeration representing the names of the data saved in @AppStorage.
enum UserDataKeys: String {
	case userName, selectedColour, wackANokkGameScore, frightenHuldraGameScore, farmMemoryGameScore, fairtytaleMemoryGameScore, appStartPage, millGameScore
	case readSawmillInformation, readMillInformation, readDamInformation, readLogBoomsInformation
	case sawMillAnswers, millAnswers, damAnswers, logBoomsAnswers
}

/// Enumeration representing the pages of the application.
enum Page: String {
	case start, main, mainNight, profile, quiz, selection, information, farmMemoryGame, fairytaleCreaturesMemoryGame, whacANokk, huldraGame, personInformation, creatureInformation, contact, achievements, avatarChanger, gameEnd, history, howTo, startGame, ar, memoryGameEnd, quizEnd, appTutorial, millGame, resetView, secondReset
}

/// Model for the object that handles the application's state.
///
/// Code for saving data to UserDefaults from [Hacking With Swift](https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-appstorage-property-wrapper).
///
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
	@AppStorage(UserDataKeys.millGameScore.rawValue) var millGameScore: Int = 0
	
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

/// Change the users quiz-answers in the @Appstorage to the given answers.
///
/// - Parameters:
/// 	- page:  The environment object which keeps track of the app data.
/// 	- selection:  The current quiz.
/// 	- answerArray:  The array containing the users answers.
///
func setAnswersArray(page: ViewIndex, selection: Structure, answerArray: [Bool]) {
	switch selection {
	case .mill:
		page.millAnswers.removeAll()
		page.millAnswers.append(contentsOf: answerArray)
	case .sawmill:
		page.sawMillAnswers.removeAll()
		page.sawMillAnswers.append(contentsOf: answerArray)
	case .dam:
		page.damAnswers.removeAll()
		page.damAnswers.append(contentsOf: answerArray)
	case .logBooms:
		page.logBoomsAnswers.removeAll()
		page.logBoomsAnswers.append(contentsOf: answerArray)
	case .none:
		return
	}
}

/// Gets the users past answers for the given quiz.
///
/// - Parameters:
/// 	- page:  The environment object which keeps track of the app data.
/// 	- selection:  The selected quiz.
///
/// - Returns: An array of the users past answers.
/// 
func getAnswersArray(page: ViewIndex, selection: Structure) -> [Bool] {
	switch selection {
	case .mill:
		return page.millAnswers
	case .sawmill:
		return page.sawMillAnswers
	case .dam:
		return page.damAnswers
	case .logBooms:
		return page.logBoomsAnswers
	case .none:
		return [Bool]()
	}
}

/// Sets the information page that user enters to "read".
///
/// - Parameters:
/// 	- page: The environment object which keeps track of the app data.
/// 	- selection: The selected structure.
///
func setInformationPageToRead(page: ViewIndex, selection: Structure) {
	switch selection {
	case .mill:
		page.readMillInformation = true
	case .sawmill:
		page.readSawmillInformation = true
	case .dam:
		page.readDamInformation = true
	case .logBooms:
		page.readLogBoomsInformation = true
	case .none:
		return
	}
}

/// See if the selected information page has been read.
///
/// - Parameters:
/// 	- page: The environment object which keeps track of the app data.
/// 	- selection: The selected structure.
///
///- Returns: Whether or not the information page has been read.
///
func getInformationPageRead(page: ViewIndex, selection: Structure) -> Bool {
	switch selection {
	case .mill:
		return page.readMillInformation
	case .sawmill:
		return page.readSawmillInformation
	case .dam:
		return page.readDamInformation
	case .logBooms:
		return page.readLogBoomsInformation
	case .none:
		return false
	}
}
