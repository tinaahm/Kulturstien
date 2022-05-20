//
//  QuizQuestions.swift
//  Kulturstien
//
//  Created by Tina on 16/05/2022.
//

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
