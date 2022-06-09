//
//  Grid.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 23/05/2022.

//
//  Grid.swift
//  memory-card-matching-game
//
//  Created by Archie Liu on 2021-04-29.
//

/// [Source](https://github.com/archie-lhd/memory-card-matching-game)

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View{
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(items){ item in
                self.body(for: item, in: GridLayout(itemCount: items.count, in: geometry.size))
            }
        }
    }
    
    private func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)
        return Group {
            if index != nil {
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index!))
            }
        }
    }
}


