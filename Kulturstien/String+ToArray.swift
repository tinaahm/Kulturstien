//
//  String+ToArray.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 23/05/2022.
//

//
//  String+ToArray.swift
//  memory-card-matching-game
//
//  Created by Archie Liu on 2021-05-05.
//

/// [Source](https://github.com/archie-lhd/memory-card-matching-game)

import Foundation

extension String {
    func splitIntoArrayOfString() -> Array<String> {
        let charArr: Array<Character> = Array(self)
        var strArr: Array<String> = []
        for char in charArr {
            strArr.append(String(char))
        }
        return strArr
    }
}

extension Array where Element == String {
    func mergeIntoString() -> String {
        var str: String = ""
        for singleChar in self {
            str += singleChar
        }
        return str
    }
}
