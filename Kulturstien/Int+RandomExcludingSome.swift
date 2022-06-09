//
//  Int+RandomExcludingSome.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 23/05/2022.
//

//
//  Int+RandomExcludingSome.swift
//  memory-card-matching-game
//
//  Created by Archie Liu on 2021-05-04.
//

/// [Source](https://github.com/archie-lhd/memory-card-matching-game)

import Foundation
extension Int {
    static func random(in range: ClosedRange<Int>, excluding x: Int) -> Int {
        if range.contains(x) {
            let r = Int.random(in: Range(uncheckedBounds: (range.lowerBound, range.upperBound)))
            return r == x ? range.upperBound : r
        } else {
            return Int.random(in: range)
        }
    }
}

