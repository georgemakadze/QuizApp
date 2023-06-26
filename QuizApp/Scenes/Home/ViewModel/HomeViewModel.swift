//
//  HomeViewModel.swift
//  QuizApp
//
//  Created by giorgi makadze on 26.06.23.
//

import Foundation

class HomeViewModel {
    
    let subjects: [Subject] = [
        Subject(icon: "programming", name: "პროგრამირება", description: "აღწერა",
                question: [
                    Question(text: "რომელია ყველაზე პოპულარული პროგრამირების ენა?",
                             answers: [
                                Answer(text: "Python"),
                                Answer(text: "Java"),
                                Answer(text: "C++", isCorrect: true),
                                Answer(text: "Kotlin")
                             ]),
                    Question(text: "რა პროგრამირების ენა გამოიყენება iOS-ში?",
                             answers: [
                                Answer(text: "Objective-C"),
                                Answer(text: "Swift", isCorrect: true),
                                Answer(text: "Java"),
                                Answer(text: "Kotlin")
                             ])
                ]),
        Subject(icon: "Book", name: "ისტორია", description: "აღწერა",
                question: [
                    Question(text: "რომელ წელს მოხდა დიდგორის ბრძოლა?",
                             answers: [
                                Answer(text: "1100"),
                                Answer(text: "2000"),
                                Answer(text: "2022"),
                                Answer(text: "1121", isCorrect: true)
                             ]),
                    Question(text: "რომელ წელს მოხდა შამქორის ბრძოლა?",
                             answers: [
                                Answer(text: "1200"),
                                Answer(text: "1195", isCorrect: true),
                                Answer(text: "2000"),
                                Answer(text: "2003")
                             ])
                ]),
        Subject(icon: "Atom", name: "ფიზიკა", description: "აღწერა",
                question: [
                    Question(text: "რომელია სიმძიმის ძალის ფორმულა?",
                             answers: [
                                Answer(text: "t = ak"),
                                Answer(text: "G = tm "),
                                Answer(text: "f=mg", isCorrect: true),
                                Answer(text: "d=1")
                             ]),
                    Question(text: "რომელია სხეულის იმპულსის ფორმულა?",
                             answers: [
                                Answer(text: "D=5"),
                                Answer(text: "p=mv", isCorrect: true),
                                Answer(text: "k=5"),
                                Answer(text: "e=rm")
                             ])
                ]),
        Subject(icon: "Globe", name: "გეოგრაფია", description: "აღწერა",
                question: [
                    Question(text: "სად მდებარეობს შავი ზღვა?",
                             answers: [
                                Answer(text: "კახეთში"),
                                Answer(text: "ბორჯომში"),
                                Answer(text: "აჭარაში", isCorrect: true),
                                Answer(text: "სვანეთში")
                             ]),
                    Question(text: "რომელი კონტინენტზე მდებარეობს ყველაზე მაღალი მთა?",
                             answers: [
                                Answer(text: "აფრიკა"),
                                Answer(text: "აზია"),
                                Answer(text: "ამერიკა"),
                                Answer(text: "ანტარქტიდა", isCorrect: true)
                             ])
                ])
    ]
}
