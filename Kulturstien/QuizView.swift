//
//  QuizView.swift
//  Kulturstien
//
//  Created by Tina on 16/05/2022.
//

import SwiftUI

var shuffled: Bool = false
var answeredCorrectly = false

struct QuizView: View {
    
   
	@EnvironmentObject var page : ViewIndex
	
	var quizType: Structure
	@State var questionIndex = 0
	@State var answered : Bool = false
	@State var quiz: Quiz
	@State var guessedIndex : Int? = nil
	@State var guessedAnswer : String? = nil
	@State var finished : Bool = false
	
	init(quizType: Structure) {
		self.quizType = quizType
		self.quiz = getQuizByType(quizType: quizType)
	}
	
	
    var body: some View {
		
		let numberOfQuestions = self.quiz.questions.count
		let correctAnswer: String = self.quiz.questions[questionIndex].correctOption
		let answers: [String] = self.quiz.shuffledAnswers[questionIndex]
		
		VStack (spacing: 15){
			
			BackButtonView()
			
			if !finished {
			HStack {
				Text(self.quiz.name)
					.font(.title)
			}
			.padding()
                Image(self.quiz.imageTitle)
				Text(String(self.questionIndex + 1) + "/" + String(numberOfQuestions))
				.font(.title3)
				.padding(.bottom)
				Text(self.quiz.questions[questionIndex].question)
				.font(.title3)
				.padding(.bottom)
			
			Group {
				ForEach(0 ..< numberOfQuestions) {
					index in
					Button (action: {
						self.answered = true
						self.guessedAnswer = answers[index]
						self.guessedIndex = index
					}) {
						Text(answers[index])
							.frame(width: DeviceSize.width * 0.7)
							.padding(20)
                            .foregroundColor(.black)
							.background(
									RoundedRectangle(cornerRadius: 15).fill(showAnswer(answered: self.answered, guessedAnswer: self.guessedAnswer, correctAnswer: correctAnswer, currentIndex: index, guessedIndex: self.guessedIndex, quiz: self.quiz, quizIndex: self.questionIndex))
										.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
											
					}
					.disabled(self.answered)
				}
			}
			
			
				if self.answered {
				Button (action: {
					self.answered = false
					if self.questionIndex != (numberOfQuestions - 1) {
						
						self.quiz.questionAnswers[questionIndex] = answeredCorrectly
						
						for i in 0...(page.quizesArray.count - 1) {
							if page.quizesArray[i].type == self.quiz.type {
								
								if !checkPreviouslyAnsweredQuestions(answerArray: page.quizesArray[i].questionAnswers) {
									page.quizesArray[i].questionAnswers = self.quiz.questionAnswers
								}
							}
						}
						
						self.guessedIndex = nil
						self.guessedAnswer = nil
						self.questionIndex += 1
						
					} else {
						self.quiz.questionAnswers[questionIndex] = answeredCorrectly
						for i in 0...(page.quizesArray.count - 1) {
							if page.quizesArray[i].type == self.quiz.type {
								
								if !checkPreviouslyAnsweredQuestions(answerArray: page.quizesArray[i].questionAnswers) {
									page.quizesArray[i].questionAnswers = self.quiz.questionAnswers
								}
							}
						}
						self.guessedIndex = nil
						self.guessedAnswer = nil
						self.finished = true
					}
				}) {
					Text("Neste")
						.frame(width: DeviceSize.width * 0.4)
						.padding()
						/*.overlay(RoundedRectangle(cornerRadius: 15)
							.stroke(Color.gray, lineWidth: 1)
						)
						.background(RoundedRectangle(cornerRadius: 15)
							.fill(.white)
						)*/
						.foregroundColor(.black)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
								.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
				}
				.padding()
			}

			
			Spacer()
			} else {
				QuizEndView(resultArray: self.quiz.questionAnswers, title: self.quiz.name)
			}
			
		}
		.background(Color("BackgroundColour"))
		
		
    }

}
/*
func getRightAnswerIndex(answerArray: [String], correctAnswer: String) -> Int {
	var i : Int = 0
	for answer in answerArray {
		if answer == correctAnswer {
			break
		}
		i += 1
	}
	return i
}
*/

func checkPreviouslyAnsweredQuestions(answerArray: [Bool]) -> Bool {
	for answer in answerArray {
		if !answer {
			return false
		}
	}
	return true
}

func showAnswer(answered: Bool, guessedAnswer: String?, correctAnswer: String, currentIndex: Int, guessedIndex: Int?, quiz: Quiz, quizIndex: Int) -> Color {
	if !answered {
		return (Color.white)
	} else {
		
		if guessedIndex != currentIndex {
			return (Color.white)
		}
		
		if guessedAnswer == correctAnswer {
			answeredCorrectly = true
			return Color.green
		} else {
			answeredCorrectly = false
			return Color.red
		}
	}
}
/*
struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
		QuizView(quizType: .sawmill).environmentObject(ViewIndex())
    }
}*/

struct QuizEndView: View {
	
	@EnvironmentObject var page : ViewIndex
	
	var resultArray: [Bool]
	var title: String
	
	var body: some View {
		
		let numberOfCorrectAnswers : Int = getNumberOfCorrectAnswers(resultArray: resultArray)
		
		VStack (spacing: 20) {
			VStack (spacing: 30) {
				Image(resultImageToDisplay(numberOfCorrectAnswers: numberOfCorrectAnswers, numberOfQuestions: resultArray.count))
					.padding(40)
					.background(Circle().stroke(Color.gray, lineWidth: 1))
				VStack {
					Text("Ditt resultat")
						.font(.title)
					Text(String(numberOfCorrectAnswers) + "/" + String(resultArray.count))
						.font(.title2)
				}
				
				if numberOfCorrectAnswers != resultArray.count {
					Button (action: {
						
					}) {
						Text("Les igjen")
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
				}) {
					Text("Ta quizen på nytt")
						.frame(width: DeviceSize.width * 0.5)
						.padding(20)
						.foregroundColor(.black)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(.white)
									.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4)
						)
										
				}
				
				Button (action: {
				}) {
					Text("Tilbake til kartet")
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
}


func getNumberOfCorrectAnswers(resultArray: [Bool]) -> Int {
	var i : Int = 0
	for result in resultArray {
		if result == true {
			i += 1
		}
	}
	return i
}

func resultImageToDisplay(numberOfCorrectAnswers: Int, numberOfQuestions: Int) -> String {
	if numberOfCorrectAnswers == numberOfQuestions {
		return "Trophy-1"
	} else {
		return "sadTroll"
	}
}

struct QuizEndViewPreviews: PreviewProvider {
	static var previews: some View {
		QuizEndView(resultArray: [], title: "Bye").environmentObject(ViewIndex())
	}
}
