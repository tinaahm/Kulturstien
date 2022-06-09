//
//  ThemeCollection.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 23/05/2022.
//

//
//  ThemeCollection.swift
//  memory-card-matching-game
//
//  Created by Archie Liu on 2021-05-07.
//

import SwiftUI

struct ThemeCollection: Codable {
    var themes = [Theme]()
    
    struct Theme: Identifiable, Codable {
        var name: String
        var accentColor: UIColor.RGB
        var imageSet: [String]
        var id = UUID()//.uuidString
        
        init(name: String, accentColor: UIColor, imageSet: [String]) {
            self.name = name
            self.accentColor = accentColor.rgb
            self.imageSet = imageSet
        }
    }
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json: Data?) { // failable
        if json != nil, let newThemeCollection = try? JSONDecoder().decode(ThemeCollection.self, from: json!) {
            self = newThemeCollection
        } else {
            return nil
        }
    }
    
    init() {
        self.themes = [DefaultThemes.theme0, DefaultThemes.theme1]
    }
    
    mutating func addTheme(name: String, accentColor: UIColor, imageSet: [String]) {
        themes.append(Theme(name: name, accentColor: accentColor, imageSet: imageSet))
    }
    mutating func moveTheme(fromOffsets: IndexSet, toOffset: Int) {
        themes.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
    mutating func editTheme(id: UUID, name: String, accentColor: UIColor, imageSet: [String]) {
        for index in themes.indices {
            if themes[index].id == id {
                themes[index].name = name
                themes[index].accentColor = accentColor.rgb
                themes[index].imageSet = imageSet
            }
        }
    }
    mutating func resetThemes() {
        self.themes = [DefaultThemes.theme0, DefaultThemes.theme1]
    }
    mutating func removeTheme(atOffsets: IndexSet) {
        themes.remove(atOffsets: atOffsets)
        
    }
}
