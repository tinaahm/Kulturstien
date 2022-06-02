//
//  ThemeCollectionManager.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 23/05/2022.
//

//
//  ThemeCollectionManager.swift
//  memory-card-matching-game
//
//  Created by Archie Liu on 2021-05-07.
//

import SwiftUI

class ThemeCollectionManager: ObservableObject {
    
    @Published private var themeCollection: ThemeCollection {
        didSet {
            UserDefaults.standard.set(themeCollection.json, forKey: "theme-collection")
        }
    }
    init() {
        themeCollection = ThemeCollection(json: UserDefaults.standard.data(forKey: "theme-collection")) ?? ThemeCollection()
    }
    
    var themes: [ThemeCollection.Theme] { themeCollection.themes }
    
}

