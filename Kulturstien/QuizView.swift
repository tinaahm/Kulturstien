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
		
		let numberOfQuestions = quiz.questions.count
		let correctAnswer: String = quiz.questions[questionIndex].correctOption
		let answers: [String] = quiz.shuffledAnswers[questionIndex]
		
		VStack {
			
			BackButtonView()
			
			if !finished {
			HStack {
				Text(quiz.name)
					.font(.title)
			}
			.padding()
                Image(self.quiz.imageTitle)
			Text(String(questionIndex + 1) + "/" + String(numberOfQuestions))
				.font(.title3)
				.padding(.bottom)
			Text(quiz.questions[questionIndex].question)
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
							.foregroundColor(.black)
							.padding(25)
                            .frame(minWidth: 0, maxWidth: 400)
							.overlay(
								RoundedRectangle(cornerRadius: 15)
                                    .stroke(showAnswer(answered: answered, guessedAnswer: guessedAnswer, correctAnswer: correctAnswer, currentIndex: index, guessedIndex: guessedIndex, quiz: quiz, quizIndex: questionIndex), lineWidth: 1)
							)
							.background(
										RoundedRectangle(cornerRadius: 15)
											//.fill(Color(red: 0.984, green: 0.984, blue: 0.984))
											.fill(showAnswer(answered: answered, guessedAnswer: guessedAnswer, correctAnswer: correctAnswer, currentIndex: index, guessedIndex: guessedIndex, quiz: quiz, quizIndex: questionIndex))
											.shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.82), radius: 2, x: 0, y: 2))
					}
					//.padding(.vertical, 25)
					//.background(showAnswer(answered: answered, guessedAnswer: guessedAnswer, correctAnswer: correctAnswer))
					.disabled(answered)
				}
			}
			
			
			if answered {
				Button (action: {
					self.answered = false
					if self.questionIndex != (numberOfQuestions - 1) {
						self.questionIndex += 1
						self.guessedIndex = nil
						self.guessedAnswer = nil
						quiz.questionAnswers[questionIndex] = answeredCorrectly
						
					} else {
						self.finished = true
					}
				}) {
					Image(systemName: "chevron.right")
						.foregroundColor(.black)
						.padding()
						.overlay(
							Circle()
								.stroke(.blue, lineWidth: 3)
						)
				}
			}
			
			Spacer()
			} else {
				QuizEndView(resultArray: quiz.questionAnswers, title: quiz.name)
			}
			
		}
		
		
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

func showAnswer(answered: Bool, guessedAnswer: String?, correctAnswer: String, currentIndex: Int, guessedIndex: Int?, quiz: Quiz, quizIndex: Int) -> Color {
	if !answered {
		return (Color(red: 0.984, green: 0.984, blue: 0.984))
	} else {
		
		if guessedIndex != currentIndex {
			return (Color(red: 0.984, green: 0.984, blue: 0.984))
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

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
		QuizView(quizType: .sawmill).environmentObject(ViewIndex())
    }
}

struct QuizEndView: View {
	
	@EnvironmentObject var page : ViewIndex
	
	var resultArray: [Bool]
	var title: String
	
	var body: some View {
		
		let numberOfCorrectAnswers : Int = getNumberOfCorrectAnswers(resultArray: resultArray)
		
		VStack (spacing: 20) {
			/*HStack (alignment: .top) {
				Button (action: {
					
				}) {
					Image(systemName: "chevron.left")
					.resizable()
					.frame(width: 20, height: 25)
					.padding(15)
				}
				.padding(.leading)
				Spacer()
			}
			.foregroundColor(.black)
			.padding()*/
			//Spacer()
			VStack (spacing: 30) {
				Image(systemName: resultImageToDisplay(numberOfCorrectAnswers: numberOfCorrectAnswers, numberOfQuestions: resultArray.count))
					.resizable()
					.frame(width: 120, height: 100)
					.padding(15)
				VStack {
					Text("Ditt resultat")
						.font(.title)
					Text(String(numberOfCorrectAnswers) + "/" + String(resultArray.count))
						.font(.title2)
				}
				Spacer()
			}
			//Spacer()
		}
	}
}


func getNumberOfCorrectAnswers(resultArray: [Bool]) -> Int {
	var i : Int = 0
	for result in resultArray {
		if result {
			i += 1
		}
	}
	return i
}

func resultImageToDisplay(numberOfCorrectAnswers: Int, numberOfQuestions: Int) -> String {
	if numberOfCorrectAnswers == numberOfQuestions {
		return "crown.fill"
	} else {
		return "trash"
	}
}

struct QuizEndViewPreviews: PreviewProvider {
	static var previews: some View {
		QuizEndView(resultArray: [], title: "Bye").environmentObject(ViewIndex())
	}
}
