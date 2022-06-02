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
		
		/*let quizesArray: [Quiz] = [page.sawmillQuiz, page.millQuiz, page.damQuiz, page.logBoomsQuiz]*/
		
        VStack () {
            
            BackButtonView()
            
            
            Text("Quiz progresjon")
                .font(.system(size: 25))

            
            VStack (alignment: .leading) {
            
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
                }
                    .padding(.trailing, 13)
                }
            
            }
            
            
            .padding()
            
            Text("Poeng")
                            .font(.system(size: 25))
                            .padding()
                        HStack () {
                            
                            Text("Minnespill -")
                            Text("\(cardGameSum)")
                            
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
