//
//  MapView.swift
//  kulturstien
//
//  Created by Tina on 10/05/2022.
//

import SwiftUI

// skjulte gjenstander i tekst/spill??

//lage brød spill

// fulfør spill+quiz for å "unlocke" ting

struct MapView: View {
    var body: some View {
		ZStack {
			//Color("DarkPurple")
			Image("Map")
				.resizable()
				//.aspectRatio(contentMode: .fill)
				.edgesIgnoringSafeArea(.all)
			VStack(spacing: 0) {
				ZStack{
					Rectangle()
						.stroke(Color.gray, lineWidth: 1)
					
				}
				ZStack{
					Rectangle()
						.stroke(Color.gray, lineWidth: 1)
					
				}
				ZStack{
					Rectangle()
						.stroke(Color.gray, lineWidth: 1)
					
				}
				// 4
				ZStack{
					Rectangle()
						.stroke(Color.yellow, lineWidth: 1)
					
				}
				ZStack{
					Rectangle()
						.stroke(Color.blue, lineWidth: 1)
					
				}
				ZStack{
					Rectangle()
						.stroke(Color.red, lineWidth: 1)
				}
				ZStack{
					Rectangle()
						.stroke(Color.gray, lineWidth: 1)
				}
				ZStack{
					Rectangle()
						.stroke(Color.gray, lineWidth: 1)
				}
				ZStack{
					Rectangle()
						.stroke(Color.gray, lineWidth: 1)
				}
				ZStack{
					Rectangle()
						.stroke(Color.gray, lineWidth: 1)
				}
				
			}
		}
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
