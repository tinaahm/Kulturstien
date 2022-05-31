//
//  ARView.swift
//  Kulturstien
//
//  Created by Tina on 31/05/2022.
//

import SwiftUI

struct MillARView: View {
    var body: some View {
        // Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ZStack {
            MillGameView().edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Placeholder").foregroundColor(Color.white)
            }
        }
    }
}

struct MillARView_Previews: PreviewProvider {
    static var previews: some View {
		MillARView()
    }
}
