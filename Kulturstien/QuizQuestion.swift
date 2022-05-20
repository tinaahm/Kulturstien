//
//  QuizQuestion.swift
//  Kulturstien
//
//  Created by Tina on 13/05/2022.
//

import Foundation

enum Structure: String, Codable/*, CustomStringConvertible*/ {
	case mill = "mølla"
	case sawmill = "sagbruk"
	case dam = "demning"
	case logBooms = "lenseanlegg"
	case none = ""
	
	/*var description : String {
		switch self {
		case .mill: return "Mølle"
		case .sawmill: return "Sagmølle"
		case .dam: return "Demning"
		case .logBooms: return "Lenseanlegg"
		case .none: return ""
		}
	}*/
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


