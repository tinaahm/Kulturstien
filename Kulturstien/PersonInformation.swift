//
//  PersonInformation.swift
//  Kulturstien
//
//  Created by Tina on 31/05/2022.
//

import Foundation

enum Person: String, Codable {
	case kirsti = "Kirsti"
	case trond = "Trond"
	case ragnhild = "Ragnhild"
	case none = ""
}

struct PersonInformation: Codable {
	let type: Person
	let imageTitle: String
	let p1: String
	let p2: String
	let p3: String
	
	init(type: Person, imageTitle: String, p1: String, p2: String, p3: String) {
		self.type = type
		self.imageTitle = imageTitle
		self.p1 = p1
		self.p2 = p2
		self.p3 = p3
	}
	
}
