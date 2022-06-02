//
//  ProgressionView.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 01/06/2022.
//

import SwiftUI

struct ProgressionView: View {
    
    @EnvironmentObject var page: ViewIndex
    
    var greyImageArray = ["GreyRectangleLeft", "GreyRectangleCenter", "GreyRectangleRight"]
	var greenImageArray = ["GreenLeftRectangle", "GreenMiddleRectangle", "GreenRightRectangle"]
    var quizArray = ["Sagbruk", "Kvernhus", "Demning", "Lenseanlegg"]
    var cardGameSum: Int = 200
    
    var body: some View {
		
        VStack () {
            
            BackButtonView()
            
            
            Text("Quiz progresjon")
                .font(.system(size: 25))

            
            VStack(alignment: .leading) {
            
				ForEach(0 ..< 4) { outerIndex in
                HStack (){
					Text(page.quizesArray[outerIndex].type.rawValue.capitalized)
                            .padding()
                 
                        Spacer()
                    ForEach(0 ..< 3) { innerIndex in
                        VStack (alignment: .trailing) {
							Image(page.quizesArray[outerIndex].questionAnswers[innerIndex] ? greenImageArray[innerIndex] : greyImageArray[innerIndex])
                        .resizable()
                        .scaledToFill()
						.frame(width: 27, height: 27)
						.padding(17)
                            
                        }
                        
                        
                    }
					
					if page.quizesArray[outerIndex].informationPageRead {
						Image(systemName: "arrow.right")
							.resizable()
							.frame(width: 25, height: 20)
							.padding(.leading, 5)
							.onTapGesture {
								page.previousPage = page.pageIndex
								quizSelection = page.quizesArray[outerIndex].type
								page.pageIndex = .quiz
							}
					} else {
						Image(systemName: "lock.fill")
							.resizable()
							.frame(width: 20, height: 27)
							.padding(.leading, 5)
					}
					
                }
                    .padding(.trailing, 13)
                }
            
            }
            
            
            .padding()
            
			VStack(alignment: .center) {
				Text("Poeng")
					.font(.system(size: 25))
					.padding(10)
				
				VStack {
					Text("Minnespill")
						.font(.title3)
						.padding(5)
					HStack () {
						Text("Bondens Redskaper - " + String(page.user.farmMemoryGameScore) + " poeng")
							.padding(2)
					}
					HStack () {
						Text("Underjordiske Vesen - " + String(page.user.fairtytaleMemoryGameScore) + " poeng")
							.padding(2)
					}
				}
				.padding(.bottom)
				
				VStack {
					Text("Wack A Nøkk")
						.font(.title3)
						.padding(5)
					HStack () {
						Text(String(page.user.wackANokkGameScore) + " poeng")
							.padding(2)
					}
				}
				.padding(.bottom)
				VStack {
					Text("Skrem Bort Huldra")
						.font(.title3)
						.padding(5)
					HStack () {
						Text(String(page.user.frightenHuldraGameScore) + " poeng")
							.padding(2)
					}
				}
				
			}
            
            Spacer()
        }
        
    }
}

func getProgressionImage(quiz: Quiz, index: Int) -> Bool {
	if quiz.questionAnswers[index] {
		return true
	}
	return false
}

struct ProgressionView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressionView().environmentObject(ViewIndex())
    }
}
