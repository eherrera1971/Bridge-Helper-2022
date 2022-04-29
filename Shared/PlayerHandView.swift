//
//  PlayerHandView.swift
//  Bridge Helper 2022
//
//  Created by Eduardo Herrera Barros on 28-04-22.
//

import SwiftUI

struct PlayerHandView: View {
    
    var distance: CGFloat = 30
    var body: some View {
        HStack{
        ZStack (alignment: .leading){
            CardView()
            CardView().offset(x: distance)
            CardView().offset(x: distance*2)
            CardView().offset(x: distance*3)
            CardView().offset(x: distance*4)
            CardView().offset(x: distance*5)
            CardView().offset(x: distance*6)
            CardView().offset(x: distance*7)
            CardView().offset(x: distance*8)
        }
            Spacer()
        }
    }
}

struct PlayerHandView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerHandView()
    }
}
