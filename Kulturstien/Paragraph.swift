//
//  Paragraphs.swift
//  Kulturstien
//
//  Created by Tina on 23/05/2022.
//

import Foundation

struct Paragraph : Codable {
	var type: Structure
	var imageTitle: String
	var text: String
	
	init(type: Structure, imageTitle: String, text: String) {
		self.type = type
		self.imageTitle = imageTitle
		self.text = text
	}
}

var millInformationTexts = getParagraphsByType(type: .mill)
var sawmillInformationTexts = getParagraphsByType(type: .sawmill)
var damInformationTexts = getParagraphsByType(type: .dam)
var logBoomsInformationTexts = getParagraphsByType(type: .logBooms)

func getParagraphsByType(type: Structure) -> [Paragraph] {
	
	var information: [Paragraph] = [Paragraph]()
	
	for paragraph in paragraphs {
		if paragraph.type == type {
			information.append(paragraph)
		}
	}
	return information
}
