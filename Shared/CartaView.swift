//
//  CartaView.swift
//  Bridge Helper 2022
//
//  Created by Eduardo Herrera Barros on 28-04-22.
//

import SwiftUI

struct constantes {
    let h :CGFloat = 140
    let w :CGFloat = 100
    let radius : CGFloat = 3
}

struct CardView: View {
    @State var isUp : Bool = true
    @State private var offset = CGSize.zero
    let const = constantes()
    var card : Card = Card(suit: .spades, num: 14)
    var accion : (() -> Void)? = nil
    
            var body: some View {
                ZStack{
                    Image(card.imagen)
                        .resizable()
                        .frame(width: const.w, height: const.h)
                    RoundedRectangle(cornerRadius: const.radius)
                        .fill()
                        .frame(width: const.w, height: const.h)
                        .foregroundColor(.blue)
                        .opacity(isUp ? 0 : 1)
                }
                .frame(width: const.w, height: const.h)
                .rotationEffect(.degrees(Double(offset.width / 5 )))
                .offset(x: offset.width * 5, y: 0)
                .opacity(2 - Double(abs(offset.width / 50)))
                .gesture(
                    DragGesture()
                        .onChanged({ gesture in
                            offset = gesture.translation
                        })
                        .onEnded({ _ in
                            if abs(offset.width) > 50 {
                                accion?()
                            }
                            else {
                                offset = .zero
                            }
                        })
                )
                .onTapGesture {
                    accion?()
                    isUp.toggle()
                    print(card.imagen)
                }
            }
        }

struct CartaView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            CardView()
            
    }
}
}
