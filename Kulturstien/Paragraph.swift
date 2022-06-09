//
//  Paragraphs.swift
//  Kulturstien
//
//  Created by Tina on 23/05/2022.
//

import Foundation

/// Model for the texts in the information pages
///
/// JSON readable-code objects adapted from [StackOverFlow](https://stackoverflow.com/questions/48243445/swift-convert-a-string-json-file-to-an-enum-case)
///
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

/// Return the texts written to the paragraphs variable by type.
///
/// - Parameters:
/// 	- type:  The structure of the paragraphs.
///
/// - Returns: An array of the texts relating to the given structure.
func getTextsByType(type: Structure) -> [Paragraph] {
	
	var information: [Paragraph] = [Paragraph]()
	
	for paragraph in paragraphs {
		if paragraph.type == type {
			information.append(paragraph)
		}
	}
	return information
}

/// Get the texts by the selected structure.
///
/// - Parameters:
/// 	- type:  The selected structure.
///
/// - Returns: An array of the texts.
func getInformationByType(type: Structure) -> [Paragraph] {
	
	switch type {
	case .mill:
		return millInformationTexts
	case .sawmill:
		return sawmillInformationTexts
	case .dam:
		return damInformationTexts
	case .logBooms:
		return logBoomsInformationTexts
	case .none:
		return []
	}
}
