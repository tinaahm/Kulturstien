//
//  LoadJSON.swift
//  Kulturstien
//
//  Created by Tina on 20/05/2022.
//

import Foundation

/// Return the data given the JSON file.
///
/// Code from [Apple](https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation).
///
/// - Parameters:
/// 	- filename:  The name of the file to be read from.
///
/// - Returns: The data from the JSON file.
/// 
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
