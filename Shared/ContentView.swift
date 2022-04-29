//
//  ContentView.swift
//  Shared
//
//  Created by Eduardo Herrera Barros on 24-04-22.
//

import SwiftUI

struct ContentView: View {
@ObservedObject var mazo = Cartas(.spades)
  var isUp = true
    var body: some View {
        ZStack{
        Color.green
        VStack {
            Spacer()
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()]) {
                    ForEach(mazo.deck, content: {card in
                        CardView(isUp:true, card: card)
                    })
            }.padding()
        
            Spacer()
            HStack{
                Text("♠️").font(.largeTitle)
                    .onTapGesture {
                        mazo.deck = Cartas(.spades).deck
                    }
                Text("♥️").font(.largeTitle)
                    .onTapGesture {
                        mazo.deck = Cartas(.hearts).deck
                    }
                Text("♦️").font(.largeTitle)
                    .onTapGesture {
                        mazo.deck = Cartas(.diamonds).deck
                    }
                Text("♣️").font(.largeTitle)
                    .onTapGesture {
                        mazo.deck = Cartas(.clubs).deck
                    }
            }
        Spacer()
            HStack{
                    PlayerHandView()
            }
        Spacer()
        }
        }
        .ignoresSafeArea()
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
