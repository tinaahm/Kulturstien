//
//  HelperStructures.swift
//  Kulturstien
//
//  Created by Tina on 09/06/2022.
//

import SwiftUI
import UIKit

/// Class holding the size of the current device.
class DeviceSize {
	static var width = UIScreen.main.bounds.size.width
	static var height = UIScreen.main.bounds.size.height
	static var size = UIScreen.main.bounds.size
}

/// Enumeration to define the avatar picked by the user.
enum Colour: String, CaseIterable, Identifiable {
	case pink = "rosa"
	case yellow = "gul"
	case green = "grønn"
	case orange = "oransje"
	case blue = "blå"
	case none = "Hva er favoritt fargen din?"
	var id: Self { self }
}

/// Enumeration for the different games.
enum Game: String {
	case whacANokk = "Slå nøkken"
	case frightenHuldra = "Skrem vekk Huldra"
	case farmMemoryGame = "Bondens redskaper"
	case fairytaleCreaturesMemoryGame = "Underjordiske vesener"
	case millGame = "Reparer mølla"
	case none = ""
}
