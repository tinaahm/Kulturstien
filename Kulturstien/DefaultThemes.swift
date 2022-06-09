//
//  DefaultThemes.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 23/05/2022.
//

//
//  DefaultThemes.swift
//  memory-card-matching-game
//
//  Created by Archie Liu on 2021-05-07.
//

import SwiftUI

struct DefaultThemes {

    static let theme0 = ThemeCollection.Theme (
        name: "Bondens redskaper",
        accentColor: UIColor(Color("MemoryGameYellow")),
        imageSet: ["WaterMillIcon", "Pitchfork", "Horseshoe", "SawmillIcon", "DamIcon", "Logs"]
    )
    
    static let theme1 = ThemeCollection.Theme (
        name: "Underjordiske vesener",
        accentColor: UIColor(Color("MemoryGameDarkBlue")),
		imageSet: ["Elf", "Troll", "Nokken", "Huldra", "OldMan", "Frame"]
    )
}
