//
//  QuizQuestion.swift
//  Kulturstien
//
//  Created by Tina on 13/05/2022.
//

import Foundation

/// Enumeration representing the different structures on the map.
enum Structure: String, Codable {
	case mill = "kvernhus"
	case sawmill = "sagbruk"
	case dam = "demning"
	case logBooms = "lenseanlegg"
	case none = ""
}

/// Get the image that coincides with the specified structure.
///
/// - Parameters:
/// 	- selectionType: The structure of the button pressed in the "day time"-map.
///
/// - Returns: The image title of the structure.
func getImageTitleFromSelection(selectionType: Structure) -> String {
	switch selectionType {
	case .mill:
		return "WaterMillIcon"
	case .sawmill:
		return "SawmillIcon"
	case .dam:
		return "DamIcon"
	case .logBooms:
		return "LogBoomsIcon"
	case .none:
		return ""
	}
}

/// Struct containing all the quizes.
struct Quizes {
	var millQuiz : Quiz = Quiz(name: "Kvernhus Quiz", type: .mill, imageTitle: "WaterMillIcon")
	var sawmillQuiz : Quiz  = Quiz(name: "Sagbruk Quiz", type: .sawmill, imageTitle: "SawmillIcon")
	var damQuiz : Quiz = Quiz(name: "Demning Quiz", type: .dam, imageTitle: "DamIcon")
	var logBoomsQuiz : Quiz  = Quiz(name: "Lenseanlegg Quiz", type: .logBooms, imageTitle: "LogBoomsIcon")
}

/// Model representing a quiz.
class Quiz: ObservableObject {
	let name: String
	let type: Structure
    let imageTitle: String
	var questions: [QuizQuestion]
	var questionAnswers: [Bool]
	var shuffledAnswers: [[String]]
	var informationPageRead: Bool
	
	init(name: String, type: Structure, imageTitle: String) {
		self.name = name
		self.type = type
        self.imageTitle = imageTitle
		self.questions = sortQuizQuestionsByType(quizType: self.type)
		self.questionAnswers = Array(repeating: false, count: self.questions.count) // TODO: change name
		self.shuffledAnswers = shuffleArray(questions: questions)
		self.informationPageRead = false
	}
	
}

/// Model representing the questions of the quiz.
struct QuizQuestion: Codable {
	var type: Structure
	var question: String
	var correctOption: String
	var wrongOptionOne: String
	var wrongOptionTwo: String
}

/// Shuffles the questions in the quiz.
///
/// - Parameters:
/// 	- questions:  The array of questions.
///
/// - Returns: An array of the shuffled questions.
func shuffleArray(questions : [QuizQuestion]) -> [[String]] {
	var array = [[String]]()
	
	for question in questions {
		var arrayGroup : [String] = [question.correctOption, question.wrongOptionOne, question.wrongOptionTwo]
		arrayGroup.shuffle()
		
		array.append(arrayGroup)
	}
	
	return array
}

/// Get the quiz questions that belong to the structure.
///
/// - Parameters:
/// 	- quizType:  The selected structure.
///
/// - Returns: An array of the QuizQuestions.
func sortQuizQuestionsByType(quizType: Structure) -> [QuizQuestion] {
	
	var sortedQuiz: [QuizQuestion] = []
	
	for question in quizQuestions {
		if question.type == quizType {
			sortedQuiz.append(question)
		}
	}
	return sortedQuiz
}

/// Get the quiz beloning to the structure.
///
/// - Parameters:
/// 	- quizType:  The selected structure.
///
/// - Returns: A Quiz.
func getQuizByType(quizType: Structure) -> Quiz {
	switch quizType {
	case .mill:
		return quizes.millQuiz
	case .sawmill:
		return quizes.sawmillQuiz
	case .dam:
		return quizes.damQuiz
	case .logBooms:
		return quizes.logBoomsQuiz
	case .none:
		return Quiz.init(name: "none", type: .none, imageTitle: "none")
	}
}
