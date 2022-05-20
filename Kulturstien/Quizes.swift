//
//  Quizes.swift
//  Kulturstien
//
//  Created by Tina on 16/05/2022.
//

import Foundation

struct Quizes {
	var millQuiz : Quiz = Quiz(name: "Mølle Quiz", type: .mill)
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

func shuffleArray(questions : [QuizQuestion]) -> [[String]] {
	var array = [[String]]()
	
	for question in questions {
		var arrayGroup : [String] = [question.correctOption, question.wrongOptionOne, question.wrongOptionTwo]
		arrayGroup.shuffle()
		
		array.append(arrayGroup)
	}
	
	return array
}

import Foundation

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

