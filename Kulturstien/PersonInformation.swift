//
//  PersonInformation.swift
//  Kulturstien
//
//  Created by Tina on 31/05/2022.
//

import Foundation

/// Enumeration representing the different persons/creatures on the map.
enum Person: String, Codable {
	case kirsti = "Kirsti"
	case trond = "Trond"
	case ragnhild = "Ragnhild"
	case huldra = "Huldra"
	case nokken = "Nøkken"
	case troll = "Troll"
	case tusse = "Tusse"
	case none = ""
}

/// Model representing the information for the people/creatures on the map.
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

/// Get the PersonInformation by the selected Person.
///
/// - Parameters:
/// 	- selection:  The Person selected.
///
/// - Returns: The PersonInformation.
func getPersonBySelection(selection: Person) -> PersonInformation {
	for person in personInformation {
		if person.type == selection {
			return person
		}
	}
	return PersonInformation(type: .none, imageTitle: "", p1: "", p2: "", p3: "")
}

/// Get the information of the selected person.
///
/// - Parameters:
/// 	- selection:  The person selected.
///
/// - Returns: An array for the text.
func getInformationArrayFromSelection(selection: Person) -> [String] {
	var array = [String]()
	for person in personInformation {
		if person.type == selection {
			array.append(person.p1)
			array.append(person.p2)
			if person.p3.isEmpty {
				break
			} else {
				array.append(person.p3)
			}
		}
	}
	return array
}
