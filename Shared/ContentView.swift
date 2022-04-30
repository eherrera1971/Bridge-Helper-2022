//
//  ContentView.swift
//  Shared
//
//  Created by Eduardo Herrera Barros on 24-04-22.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: offset * 24, y: 0)
    }
}

struct ContentView: View {
    @StateObject var game = Cartas()
    @StateObject var handSouth = CartasPlayer()
    @State var cartasWNE : Array<Card> = []
    let const = constantes()
    var isUp = true
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                ZStack {
                    ForEach(0..<game.spades.count, id: \.self) { index in
                        CardView(isUp: true, card: game.spades[index])
                        {withAnimation{accion(carta: game.spades[index])}}
                            .zIndex(Double(13 - index))
                            .stacked(at: index, in: game.spades.count)
                    }}
                ZStack {
                    ForEach(0..<game.hearts.count, id: \.self) { index in
                        CardView(isUp: true, card: game.hearts[index])
                        {withAnimation{accion(carta: game.hearts[index])}}
                            .zIndex(Double(13 - index))
                            .stacked(at: index, in: game.hearts.count)
                    }
                }
                ZStack {
                    ForEach(0..<game.diamonds.count, id: \.self) { index in
                        CardView(isUp: true, card: game.diamonds[index])
                        {
                            withAnimation{
                                accion(carta: game.diamonds[index])}
                        }
                        .zIndex(Double(13 - index))
                        .stacked(at: index, in: game.diamonds.count )
                        
                    }
                }
                ZStack {
                    ForEach(0..<game.clubs.count, id: \.self) { index in
                        CardView(isUp: true, card: game.clubs[index])
                        {
                            withAnimation{
                                accion(carta: game.clubs[index])}
                        }
                        .zIndex(Double(13 - index))
                        .stacked(at: index, in: game.clubs.count)
                        
                    }
                }
                Spacer()
                ZStack(alignment: .leading){
                    Rectangle().frame(height:const.h + 15)
                        .foregroundColor(.black)
                    ForEach(0..<handSouth.cartasPlayer.count, id: \.self) { index in
                        CardView(isUp: true, card: handSouth.cartasPlayer[index])
                            .zIndex(Double(13 - index))
                            .stacked(at: index, in: handSouth.cartasPlayer.count)
                    }
                }
            }
        }
        .background(
            Image("fondo")
                .resizable()
                .ignoresSafeArea()
        )
    }
    
    func accion (carta : Card) {
        if handSouth.cartasPlayer.count < 13 {
            if handSouth.cartasPlayer.contains(where: {$0.peso == carta.peso}) {
                handSouth.cartasPlayer = handSouth.cartasPlayer.filter({$0.peso != carta.peso})
            } else {
                //item could not be found
                handSouth.cartasPlayer.append(carta)
                handSouth.cartasPlayer = handSouth.cartasPlayer.sorted (by : {$0.peso < $1.peso})
            }
        } else
        {
            moverCartas()
        }
    }
    
    func moverCartas() {
        for carta in game.deck {
            cartasWNE.append(carta)
        }
            game.deck.removeAll()
    }
}


struct ContentView_Previewsa: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
    
}
