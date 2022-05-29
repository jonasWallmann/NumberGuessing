//
//  NumberVM.swift
//  NumberGuessing
//
//  Created by Jonas Wallmann on 29.05.22.
//

import Foundation

class NumberVM: ObservableObject {
    
    @Published var number: Int = 0 {
        didSet { reset() }
    }
    
    @Published var guess: Int = 50
    @Published var guessList: [Guess] = []

    private var range: [Int] = [0, 100]
    
    
    // MARK: computed -----------------------------
    
    var guessed: Bool {
        return number == guess
    }
    
    var correctNumberInput: Bool {
        return number > 0 && number < 100
    }
    
    
    // MARK: inputs -------------------------------------
    
    func hint(smaller: Bool) {
        range[smaller ? 1 : 0] = guess
        self.guess = range[0] + Int((range[1] - range[0]) / 2)
        self.guessList.append(Guess(number: self.guess, smaller: smaller))
    }
    
    private func reset() {
        self.guess = 50
        self.range = [0, 100]
    }
}

struct Guess: Identifiable {
    let id: UUID = UUID()
    let number: Int
    let smaller: Bool
}
