//
//  Cartas.swift
//  Bridge Helper 2022
//
//  Created by Eduardo Herrera Barros on 25-04-22.
//

import Foundation

class Cartas : ObservableObject {
    var suit : Suits
    @Published  var deck : Array<Card> = []
    init(_ suit: Suits) {
        self.suit = suit
        for i in (stride(from: 14, to: 1, by: -1)){
            let carta = Card(suit:suit, num : i)
            self.deck.append(carta)
        }
    }
}

class CartasPlayer : ObservableObject {
    @Published  var cartasPlayer : Array<Card> = []
    init() {
        for _ in (1...13){
            let carta = Card()
            self.cartasPlayer.append(carta)
        }
    }
}

