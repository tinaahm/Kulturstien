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
    var quizArray = ["kvernhus", "sagbruk", "demning", "lenseanlegg"]
    var cardGameSum: Int = 200
	var rectangleWidth = DeviceSize.width * 0.85
    
    var body: some View {
		
		let quizAnswerArray = [page.millAnswers, page.sawMillAnswers, page.damAnswers, page.logBoomsAnswers]
		
        ZStack{
			VStack {
            
            ScrollView {
            
            Text("Quiz progresjon")
				.font(.headlineFont)
				.foregroundColor(page.lightMode ? .black : .white)
                .padding(.top, 40)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color("Grey"))
                    .shadow(radius: 2, x: 0, y: 3)

                VStack (alignment: .leading) {
                    
                    ForEach(0 ..< quizAnswerArray.count, id: \.self) { outerIndex in
                    HStack (){
						Text(quizArray[outerIndex].capitalized)
							.font(.textFont)
                                .padding()
                     
                            Spacer()
						ForEach(0 ..< quizAnswerArray[outerIndex].count) { innerIndex in
                            VStack (alignment: .trailing) {
								Image(quizAnswerArray[outerIndex][innerIndex] ? greenImageArray[innerIndex] : greyImageArray[innerIndex])
									.resizable()
									.scaledToFill()
									.frame(width: 20, height: 20)
									.padding(12)
								}
                        }
                        
						if getInformationPageRead(page: page, selection: Structure(rawValue: quizArray[outerIndex])!) {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 25, height: 20)
                                .padding(.leading, 5)
                                .onTapGesture {
                                    page.previousPage = page.pageIndex
									quizSelection = Structure(rawValue: quizArray[outerIndex])!
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
                .padding(5)
            }
            .frame(width: rectangleWidth)
            .padding()

            
            
            
			VStack(alignment: .center) {
				Text("Poeng")
					.font(.headlineFont)
					.foregroundColor(page.lightMode ? .black : .white)
					.font(.system(size: 25))
					.padding(10)
                
               
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("Grey"))
                        .shadow(radius: 2, x: 0, y: 3)

                    VStack (alignment: .center){
                        
                        Text("Minnespill")
                            .font(.subHeadlineFont)
                            .padding(5)
                        VStack {
                            HStack () {
                                Text("Bondens Redskaper: " + String(page.farmMemoryGameScore) + " poeng")
									.font(.textFont)
                                    .padding(2)
                            }
                            HStack () {
                                Text("Underjordiske Vesen: " + String(page.fairtytaleMemoryGameScore) + " poeng")
									.font(.textFont)
                                    .padding(2)
                            }
                        }
                        .padding()
                        .background(Color("LighterGrey"))
                        .cornerRadius(25)
                    
                            
                                Spacer()
              
                    }
                    .padding(10)
                }
                .frame(width: rectangleWidth)
                .padding(.bottom)
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("Grey"))
                        .shadow(radius: 2, x: 0, y: 3)

                    VStack (alignment: .center){
                        
                        Text("Wack a Nøkk")
                            .font(.subHeadlineFont)
                            .padding(5)
                        VStack {
                            
                            HStack () {
                                Text(String(page.wackANokkGameScore) + " poeng")
									.font(.textFont)
                                    .padding(2)
                            }
                        }
                        .padding()
                        .background(Color("LighterGrey"))
                        .cornerRadius(25)
                            
                                Spacer()
              
                    }
                    .padding(10)
                }
                .frame(width: rectangleWidth)
                .padding(.bottom)
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("Grey"))
                        .shadow(radius: 2, x: 0, y: 3)

                    VStack (alignment: .center){
                        
                        Text("Skrem Huldra")
                            .font(.subHeadlineFont)
                            .padding(5)
                        VStack {
                            
                            HStack () {
                                Text(String(page.frightenHuldraGameScore) + " poeng")
									.font(.textFont)
                                    .padding(2)
                            }
                        }
                        .padding()
                        .background(Color("LighterGrey"))
                        .cornerRadius(25)
                            
                                Spacer()
              
                    }
                    .padding(10)
                }
                .frame(width: rectangleWidth)
				.padding(.bottom)
				
				ZStack {
					
					RoundedRectangle(cornerRadius: 25, style: .continuous)
						.fill(Color("Grey"))
						.shadow(radius: 2, x: 0, y: 3)

					VStack (alignment: .center){
						
						Text("Reparer mølla")
							.font(.subHeadlineFont)
							.padding(5)
						VStack {
							
							HStack () {
								Text(String(page.millGameScore) + " poeng")
									.font(.textFont)
									.padding(2)
							}
						}
						.padding()
						.background(Color("LighterGrey"))
						.cornerRadius(25)
							
								Spacer()
					}
					.padding(10)
				}
				.frame(width: rectangleWidth)
				
			}
            Spacer()
        }
    }
            VStack {
				BackButtonView(buttonColour: page.lightMode ? .black : .white)
                Spacer()
            }
        
    }
		.background(Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground"))
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
