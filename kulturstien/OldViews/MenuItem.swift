//
//  MenuItem.swift
//  kulturstien
//
//  Created by Tina on 10/05/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct MenuItem: Identifiable, Hashable {
	let id = UUID()
	let title: String
	var iconName: String
	
	var icon: Image {
		Image(iconName)
	}
	
	var page: Pages
}
