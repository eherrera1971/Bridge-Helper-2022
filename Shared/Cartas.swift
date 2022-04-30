//
//  Cartas.swift
//  Bridge Helper 2022
//
//  Created by Eduardo Herrera Barros on 25-04-22.
//

import Foundation
import SwiftUI

class Cartas : ObservableObject {
    @Published var deck : Array<Card> = []
    var clubs :  Array<Card> {
        return self.deck.filter{$0.suit == .clubs}
    }
    var spades :  Array<Card> {
        return self.deck.filter{$0.suit == .spades}
    }
    var hearts :  Array<Card> {
        return self.deck.filter{$0.suit == .hearts}
    }
    var diamonds :  Array<Card> {
        return self.deck.filter{$0.suit == .diamonds}
    }
    init() {
        for suit in Suits.allCases {
            for i in (2...14) {
            let carta = Card(suit:suit, num : i)
            self.deck.append(carta)
        }
    }
}
}


class CartasPlayer : ObservableObject {
    @Published  var cartasPlayer : Array<Card> = []
    init() {
    }
}

