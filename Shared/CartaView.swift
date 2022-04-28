//
//  CartaView.swift
//  Bridge Helper 2022
//
//  Created by Eduardo Herrera Barros on 28-04-22.
//

import SwiftUI

struct CartaView: View {
            @State var isUp : Bool = true
            var nameCard : String = "red_joker"
            var body: some View {
                ZStack{
                    Image(nameCard)
                        .resizable()
                        .frame(width: 63, height: 84)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                    //                .cornerRadius(20)
                    RoundedRectangle(cornerRadius: 12)
                        .stroke()
                        .frame(width: 75, height: 100)
                        .foregroundColor(.black)
                    RoundedRectangle(cornerRadius: 12)
                        .fill()
                        .frame(width: 75, height: 100)
                        .foregroundColor(.green)
                        .opacity(isUp ? 0 : 1)
                }
                .onTapGesture {
                    isUp.toggle()
                }
            }
        }

struct CartaView_Previews: PreviewProvider {
    static var previews: some View {
        CartaView()
    }
}
