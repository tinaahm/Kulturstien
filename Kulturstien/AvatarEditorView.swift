//
//  AvatarEditorView.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 02/06/2022.
//

import SwiftUI




struct AvatarEditorView: View {
    
    @EnvironmentObject var page: ViewIndex
	
	var avatarArray = [["Cow", "blå"], ["Troll-1", "grønn"], ["Bunny", "rosa"], ["Reindeer", "oransje"], ["Chicken", "gul"]]
    
    var body: some View {
        VStack () {
            
        BackButtonView()
        
        Text("Endre avatar")
            .font(.system(size: 25))
            
            HStack (alignment: .top) {
                
                VStack () {
					
					ForEach(0 ..< 3) { index in
						Button (action: {
							page.user.selectedColour = Colour(rawValue: avatarArray[index][1])!
						}) {
							Image(avatarArray[index][0])
							.resizable()
							.frame(width: 130, height: 130)
							.overlay(
									RoundedRectangle(cornerRadius: 200)
										.stroke(selectedAvatar(currentColour: page.user.selectedColour, buttontColour: Colour(rawValue: avatarArray[index][1])!), lineWidth: 4)
								)
						}
					}
					.padding()
                }
                .padding()
                
                VStack () {
					ForEach(3 ..< 5) { index in
						Button (action: {
							page.user.selectedColour = Colour(rawValue: avatarArray[index][1])!
						}) {
							Image(avatarArray[index][0])
							.resizable()
							.frame(width: 130, height: 130)
							.overlay(
									RoundedRectangle(cornerRadius: 200)
										.stroke(selectedAvatar(currentColour: page.user.selectedColour, buttontColour: Colour(rawValue: avatarArray[index][1])!), lineWidth: 4)
								)
						}
                    }
                    .padding()
                }
                .padding()
            }
            
          Spacer()
        }
		.background(Color("BackgroundColour"))
    }
}

func selectedAvatar(currentColour: Colour, buttontColour: Colour) -> Color {
	if currentColour == buttontColour {
		return .green
	}
	return .clear
}

struct AvatarEditorView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarEditorView().environmentObject(ViewIndex())
    }
}
