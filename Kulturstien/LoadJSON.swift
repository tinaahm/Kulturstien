//
//  LoadJSON.swift
//  Kulturstien
//
//  Created by Tina on 20/05/2022.
//

import Foundation

var quizQuestions: [QuizQuestion] = load("QuizQuestions.json")
var paragraphs: [Paragraph] = load("Paragraphs.json")
var personInformation: [PersonInformation] = load("PersonInformation.json")
var pageInformation: [PageInformation] = load("PageInformation.json")

func load<T: Decodable>(_ filename: String) -> T {
	let data: Data

	guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
	else {
		fatalError("Couldn't find \(filename) in main bundle.")
	}

	do {
		data = try Data(contentsOf: file)
	} catch {
		fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
	}

	do {
		let decoder = JSONDecoder()
		return try decoder.decode(T.self, from: data)
	} catch {
		fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
	}
}
