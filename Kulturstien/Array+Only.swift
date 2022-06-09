//
//  Array+Only.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 23/05/2022.
//

//
//  Array+Only.swift
//  memory-card-matching-game
//
//  Created by Archie Liu on 2021-04-30.
//

/// [Source](https://github.com/archie-lhd/memory-card-matching-game)

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
