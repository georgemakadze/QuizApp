//
//  HomeViewModel.swift
//  QuizApp
//
//  Created by giorgi makadze on 26.06.23.
//

import Foundation

class HomeViewModel {
    
    let subjects: [Subject] = [
        Subject(icon: "programming", quizTitle: "პროგრამირება", quizDescription: "აღწერა",
                quizQuestionCount: 2,
                questions: [
                    Question(questionTitle: "რომელია ყველაზე პოპულარული პროგრამირების ენა?",
                             answers: [
                                "Python",
                                "Java",
                                "C++",
                                "Kotlin"
                             ],
                            correctAnswer: "C++",
                             questionIndex: 0),
                    Question(questionTitle: "რა პროგრამირების ენა გამოიყენება iOS-ში?",
                             answers: [
                                ("Objective-C"),
                                ("Swift"),
                                ("Java"),
                                ("Kotlin")
                             ],
                             correctAnswer: "Swift",
                            questionIndex: 1)
                ]),
        Subject(icon: "Book", quizTitle: "ისტორია", quizDescription: "აღწერა",
                quizQuestionCount: 2,
                questions: [
                    Question(questionTitle: "რომელ წელს მოხდა დიდგორის ბრძოლა?",
                             answers: [
                                ("1100"),
                                ("2000"),
                                ("2022"),
                                ("1121")
                             ],
                            correctAnswer: "1121",
                            questionIndex: 0),
                    Question(questionTitle: "რომელ წელს მოხდა შამქორის ბრძოლა?",
                             answers: [
                                ("1200"),
                                ("1195"),
                                ("2000"),
                                ("2003")
                             ],
                            correctAnswer: "1195",
                            questionIndex: 1)
                ]),
        Subject(icon: "Atom", quizTitle: "ფიზიკა", quizDescription: "აღწერა",
                quizQuestionCount: 2,
                questions: [
                    Question(questionTitle: "რომელია სიმძიმის ძალის ფორმულა?",
                             answers: [
                                ("t = ak"),
                                ("G = tm "),
                                ("f=mg"),
                                ("d=1")
                             ],
                            correctAnswer: "f=mg",
                            questionIndex: 0),
                    Question(questionTitle: "რომელია სხეულის იმპულსის ფორმულა?",
                             answers: [
                                ("D=5"),
                                ("p=mv"),
                                ("k=5"),
                                ("e=rm")
                             ],
                            correctAnswer: "p=mv",
                            questionIndex: 1)
                ]),
        Subject(icon: "Globe", quizTitle: "გეოგრაფია", quizDescription: "აღწერა",
                quizQuestionCount: 2,
                questions: [
                    Question(questionTitle: "სად მდებარეობს შავი ზღვა?",
                             answers: [
                                ("კახეთში"),
                                ("ბორჯომში"),
                                ("აჭარაში"),
                                ("სვანეთში")
                             ],
                            correctAnswer: "აჭარაში",
                            questionIndex: 0),
                    Question(questionTitle: "რომელი კონტინენტზე მდებარეობს ყველაზე მაღალი მთა?",
                             answers: [
                                ("აფრიკა"),
                                ("აზია"),
                                ("ამერიკა"),
                                ("ანტარქტიდა")
                             ],
                            correctAnswer: "ანტარქტიდა",
                            questionIndex: 1)
                ])
    ]
}
