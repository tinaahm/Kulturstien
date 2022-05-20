//
//  Information.swift
//  Kulturstien
//
//  Created by Tina on 20/05/2022.
//

import Foundation

/*struct Information : Codable {
	var type: Structure
	var title: String
	var images: [String]
	var texts: [String]
	
	init(type: Structure, title: String, images: [String], texts: [String]) {
		self.type = type
		self.title = title
		self.images = images
		self.texts = texts
	}
}*/

struct Information : Codable {
	var type: Structure
	var title: String
	var image1: String
	var image2: String
	var image3: String
	var text1: String
	var text2: String
	var text3: String
	
	init(type: Structure, title: String, image1: String, image2: String, image3: String, text1: String, text2: String, text3: String) {
		self.type = type
		self.title = title
		self.image1 = image1
		self.image2 = image2
		self.image3 = image3
		self.text1 = text1
		self.text2 = text2
		self.text3 = text3
	}
}
