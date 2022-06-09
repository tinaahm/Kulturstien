//
//  QuizEndView.swift
//  Kulturstien
//
//  Created by Tina on 09/06/2022.
//

import SwiftUI

/// View that shows at the end of the quiz
struct QuizEndView: View {
	
	@EnvironmentObject var page : ViewIndex
	
	var resultArray: [Bool]
	var title: String
	
	var body: some View {
		
		let numberOfCorrectAnswers : Int = getNumberOfCorrectAnswers(resultArray: resultArray)
		
		ZStack {
			Color("BackgroundColour")
		VStack (spacing: 20) {
			Spacer()
			Spacer()
			Spacer()
			VStack (spacing: 30) {
				Image(resultImageToDisplay(numberOfCorrectAnswers: numberOfCorrectAnswers, numberOfQuestions: resultArray.count))
					.padding(40)
					.background(Circle().fill(.white))
				VStack {
					Text("Ditt resultat")
						.font(.headlineFont)
						.padding(.bottom, 10)
					Text(String(numberOfCorrectAnswers) + "/" + String(resultArray.count))
						.font(.subHeadlineFont)
				}
				
				if numberOfCorrectAnswers != resultArray.count {
					Button (action: {
						page.previousPage = page.pageIndex
						page.pageIndex = .information
					}) {
						Text("Les igjen")
							.font(.textFont)
							.frame(width: DeviceSize.width * 0.5)
							.padding(20)
							.foregroundColor(.black)
							.background(
								RoundedRectangle(cornerRadius: 15).fill(.white)
										.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4)
							)
					}
				}
				
				Button (action: {
					page.pageIndex = .quiz
				}) {
					Text("Ta quizen på nytt")
						.font(.textFont)
						.frame(width: DeviceSize.width * 0.5)
						.padding(20)
						.foregroundColor(.black)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(.white)
									.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4)
						)
				}
				
				Button (action: {
					if page.lightMode {
						page.pageIndex = .main
					} else {
						page.pageIndex = .mainNight
					}
				}) {
					Text("Tilbake til kartet")
						.font(.textFont)
						.frame(width: DeviceSize.width * 0.5)
						.padding(20)
						.foregroundColor(.black)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(.white)
									.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4)
						)
				}
				Spacer()
			}
		}
		}
		.background(Color("BackgroundColour"))
	}
	
	/// Return the image to be displayed depending on whether or not the user got all answers correct
	///
	/// - Parameters:
	/// 	- numberOfCorrectAnswers: The number of answers the user got correct.
	/// 	- numberOfQuestions: The number of questions in the quiz.
	///
	///- Returns: The title of the image to be displayed.
	func resultImageToDisplay(numberOfCorrectAnswers: Int, numberOfQuestions: Int) -> String {
		if numberOfCorrectAnswers == numberOfQuestions {
			return "Trophy"
		} else {
			return "SadTroll"
		}
	}

	/// Get the number of correct answers in the array.
	///
	/// - Parameters:
	/// 	- resultArray: The array containing the users answers for the current round.
	///
	///- Returns: The number of answers that are correct.
	func getNumberOfCorrectAnswers(resultArray: [Bool]) -> Int {
		var i : Int = 0
		for result in resultArray {
			if result == true {
				i += 1
			}
		}
		return i
	}
}

/*
struct QuizEndViewPreviews: PreviewProvider {
	static var previews: some View {
		QuizEndView(resultArray: [], title: "Bye").environmentObject(ViewIndex())
	}
}*/
