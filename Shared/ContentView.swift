//
//  ContentView.swift
//  Shared
//
//  Created by Eduardo Herrera Barros on 24-04-22.
//

import SwiftUI

struct ContentView: View {
@ObservedObject var mazo = Cartas("hearts")
    @ObservedObject var mazoClubs = Cartas("clubs")
  var isUp = true
    var body: some View {
        VStack {
            ZStack{
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()]) {
            ForEach(mazoClubs.deck, content: {card in
                CartaView(isUp:true, nameCard: card.imagen)
                })
        }
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()]) {
                    ForEach(mazo.deck, content: {card in
                        CartaView(isUp:true, nameCard: card.imagen)
                    })
                }
            }.padding()
        
            Spacer()
            HStack{
                Text("♠️").font(.largeTitle)
                    .onTapGesture {
                        mazo.deck = Cartas("spades").deck
                    }
                Text("♥️").font(.largeTitle)
                    .onTapGesture {
                        mazo.deck = Cartas("hearts").deck
                    }
                Text("♦️").font(.largeTitle)
                    .onTapGesture {
                        mazo.deck = Cartas("diamonds").deck
                    }
                Text("♣️").font(.largeTitle)
                    .onTapGesture {
                        mazo.deck = Cartas("clubs").deck
                    }
            }
        Spacer()
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem(),GridItem(),GridItem(),GridItem(),GridItem(),GridItem(),GridItem()]) {
                CartaView(isUp: false, nameCard: "red_joker")
                CartaView(isUp: false, nameCard: "red_joker")
                CartaView(isUp: false, nameCard: "red_joker")
                CartaView(isUp: false, nameCard: "red_joker")
                CartaView(isUp: false, nameCard: "red_joker")
                CartaView(isUp: false, nameCard: "red_joker")
                CartaView(isUp: false, nameCard: "red_joker")
                CartaView(isUp: false, nameCard: "red_joker")
                CartaView(isUp: false, nameCard: "red_joker")
                CartaView(isUp: false, nameCard: "red_joker")
//                CartaView(isUp: false, nameCard: "red_joker")
//                CartaView(isUp: false, nameCard: "red_joker")
//                CartaView(isUp: false, nameCard: "red_joker")
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
 ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
    
}
