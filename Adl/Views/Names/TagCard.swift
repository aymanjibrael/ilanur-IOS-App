//
//  TagCard.swift
//  Adl
//
//  Created by Abdul Adl on 17.05.2022.
//

import SwiftUI

struct TagCard: View {
    var name: String
    var body: some View {
        VStack {
            Text(name)
        }
        .font(.caption2)
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(Color("mycolor"), lineWidth: 2))
        .cornerRadius(15)
    }
}

struct TagCard_Previews: PreviewProvider {
    static var previews: some View {
        TagCard(name: "")
    }
}
