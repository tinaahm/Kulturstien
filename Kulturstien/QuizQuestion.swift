//
//  QuizQuestion.swift
//  Kulturstien
//
//  Created by Tina on 13/05/2022.
//

import Foundation

enum QuizType: String, Codable {
	case mill, sawmill, dam, logBooms, none
}

struct QuizQuestion: Codable {
	var type: QuizType
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


