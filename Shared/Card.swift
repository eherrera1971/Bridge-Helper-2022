//
//  Carta.swift
//  Bridge Helper 2022
//
//  Created by Eduardo Herrera Barros on 28-04-22.
//

import Foundation

enum Suits : String {
    case spades
    case hearts
    case diamonds
    case clubs
}

enum Honors : String, CaseIterable {
    case ace
    case king
    case queen
    case jack
}

class Card  : Identifiable {
    var id : UUID
    var suit : Suits
    var num : Int
    var imagen : String {
        switch num {
        case 15:
            return "red_joker"
        case 14:
            return Honors.ace.rawValue+"_of_"+suit.rawValue
        case 13:
            return Honors.king.rawValue+"_of_"+suit.rawValue
        case 12:
            return Honors.queen.rawValue+"_of_"+suit.rawValue
        case 11:
            return Honors.jack.rawValue+"_of_"+suit.rawValue
        default:
            return String(num)+"_of_"+suit.rawValue
        }
    }
    
    init(suit : Suits, num : Int){
        self.id = UUID()
        self.suit = suit
        self.num = num
        }
    
    init(){
        self.id = UUID()
        self.suit = .spades
        self.num = 15
    }
}
