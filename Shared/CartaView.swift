//
//  CartaView.swift
//  Bridge Helper 2022
//
//  Created by Eduardo Herrera Barros on 28-04-22.
//

import SwiftUI

struct CardView: View {
    @State var isUp : Bool = true
    var card : Card = Card(suit: .spades, num: 14)
            var body: some View {
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: -1.0)
                        .background(.red).cornerRadius(12)
                        .frame(width: 75, height: 100)
                        .foregroundColor(.black)
                    Image(card.imagen)
                        .resizable()
                        .frame(width: 63, height: 84)
//                        .cornerRadius(10)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0.5)
                    RoundedRectangle(cornerRadius: 12)
                        .fill()
                        .frame(width: 75, height: 100)
                        .foregroundColor(.green)
                        .opacity(isUp ? 0 : 1)
                }
                .onTapGesture {
                    isUp.toggle()
                    print(card.imagen)
                    print(card.id)
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
