//
//  Cartas.swift
//  Bridge Helper 2022
//
//  Created by Eduardo Herrera Barros on 25-04-22.
//

import Foundation
import SwiftUI

class Cartas : ObservableObject {
    var suit : String
    @Published  var deck : Array<card> = []
//    ,"hearts","diamonds","clubs"]
    private let honors = ["ace","king","queen","jack"]
    init(_ suit: String) {
        self.suit = suit
        var valor : Int
            valor = 14
            for honor in honors {
                let imageName = honor+"_of_"+suit+String(honor == "ace" ? "" : "2")
                let carta = card(suit:suit, num : valor ,imagen:imageName)
                self.deck.append(carta)
                valor = valor - 1
            }
            for i in stride(from: 10, to: 1, by: -1) {
                let imageName = String(i)+"_of_"+suit
                let carta = card(suit:suit, num : i,imagen:imageName)
                self.deck.append(carta)
            }

            
        }


    class card  : Identifiable {
        var id : UUID
    var suit : String
    var num : Int
    var imagen : String
    
    init(suit : String, num : Int, imagen : String){
        self.id = UUID()
        self.suit = suit
        self.num = num
        self.imagen = imagen
        
    }
}
}
