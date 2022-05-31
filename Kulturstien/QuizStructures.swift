//
//  QuizQuestion.swift
//  Kulturstien
//
//  Created by Tina on 13/05/2022.
//

import Foundation

enum Structure: String, Codable {
	case mill = "kvernhus"
	case sawmill = "sagbruk"
	case dam = "demning"
	case logBooms = "lenseanlegg"
	case none = ""
}

struct Quizes {
	var millQuiz : Quiz = Quiz(name: "Kvernhus Quiz", type: .mill)
	var sawmillQuiz : Quiz  = Quiz(name: "Sagmølle Quiz", type: .sawmill)
	var damQuiz : Quiz = Quiz(name: "Demning Quiz", type: .dam)
	var logBoomsQuiz : Quiz  = Quiz(name: "Lenseanlegg Quiz", type: .logBooms)
}

struct Quiz {
	let name: String
    
	let type : Structure
	let questions : [QuizQuestion]
	var questionAnswers : [Bool]
	var shuffledAnswers : [[String]]
	
	init(name: String, type: Structure) {
		self.name = name
		self.type = type
		self.questions = sortQuizQuestionsByType(quizType: self.type)
		self.questionAnswers = Array(repeating: false, count: self.questions.count) // TODO: change name
		self.shuffledAnswers = shuffleArray(questions: questions)
	}
	
}

struct QuizQuestion: Codable {
	var type: Structure
	var question: String
	var correctOption: String
	var wrongOptionOne: String
	var wrongOptionTwo: String
	
	/*init(type: QuizType, question: String, correctOption: String, wrongOptionOne: String,
		 wrongOptionTwo: String) {
		self.type = type
		self.question = question
		self.correctOption = correctOption
		self.wrongOptionOne = wrongOptionOne
		self.wrongOptionTwo = wrongOptionTwo
	}*/
	
}

func shuffleArray(questions : [QuizQuestion]) -> [[String]] {
	var array = [[String]]()
	
	for question in questions {
		var arrayGroup : [String] = [question.correctOption, question.wrongOptionOne, question.wrongOptionTwo]
		arrayGroup.shuffle()
		
		array.append(arrayGroup)
	}
	
	return array
}

func sortQuizQuestionsByType(quizType: Structure) -> [QuizQuestion] {
	
	var sortedQuiz: [QuizQuestion] = []
	
	for question in quizQuestions {
		if question.type == quizType {
			sortedQuiz.append(question)
		}
	}
	
	return sortedQuiz
}

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
		return Quiz.init(name: "none", type: .none)
	}
}
