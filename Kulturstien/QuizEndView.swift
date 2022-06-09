//
//  QuizEndView.swift
//  Kulturstien
//
//  Created by Tina on 09/06/2022.
//

import SwiftUI

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
}

struct QuizEndViewPreviews: PreviewProvider {
	static var previews: some View {
		QuizEndView(resultArray: [], title: "Bye").environmentObject(ViewIndex())
	}
}
