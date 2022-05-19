//
//  QuizQuestions.swift
//  Kulturstien
//
//  Created by Tina on 16/05/2022.
//

import Foundation

var millQuizQuestions: [QuizQuestion] = sortQuizQuestionsByType(quizType: .mill)
var sawmillQuizQuestions: [QuizQuestion] = sortQuizQuestionsByType(quizType: .sawmill)
var damQuizQuestions: [QuizQuestion] = sortQuizQuestionsByType(quizType: .dam)
var logBoomQuizQuestions: [QuizQuestion] = sortQuizQuestionsByType(quizType: .logBooms)

func sortQuizQuestionsByType(quizType: QuizType) -> [QuizQuestion] {
	
	var sortedQuiz: [QuizQuestion] = []
	
	for question in quizQuestions {
		if question.type == quizType {
			sortedQuiz.append(question)
		}
	}
	
	return sortedQuiz
}

func getQuizByType(quizType: QuizType) -> Quiz {
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
