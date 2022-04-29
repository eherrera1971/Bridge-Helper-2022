//
//  PlayerHandView.swift
//  Bridge Helper 2022
//
//  Created by Eduardo Herrera Barros on 28-04-22.
//

import SwiftUI

struct PlayerHandView: View {
    @ObservedObject var handSouth = CartasPlayer()
    var body: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),
                            GridItem(),GridItem(),
                            GridItem(),GridItem(),
                            GridItem(),GridItem(),
                            GridItem(),GridItem(),
                            GridItem(),GridItem(),
                            GridItem()
                           ] ){
            ForEach(handSouth.cartasPlayer, content: {card in
                CardView(isUp:true, card: card)
            })
        }
        }
    }

struct PlayerHandView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerHandView()
    }
}
