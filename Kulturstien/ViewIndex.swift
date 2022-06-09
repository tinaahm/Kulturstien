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
