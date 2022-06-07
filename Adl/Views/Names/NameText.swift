//
//  NameText.swift
//  Adl
//
//  Created by Abdul Adl on 18.05.2022.
//

import SwiftUI

struct NameText: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack {
                VStack(alignment: .leading) {
                    Text("Allah, kendisinden başka ilâh olmayandır. En güzel isimler O’na mahsustur.")
                        .font(.subheadline)
                }
                
                VStack(alignment: .leading) {
                    Text("Tâhâ, 20/8")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                }
                .frame(maxWidth:.infinity, alignment: .leading)
            }
            .frame(maxWidth:.infinity, alignment: .leading)
            VStack {
                VStack(alignment: .leading) {
                   Text("Allah`ın 99 ismi vardır. Kim bunları ezberlerse (îman eder ve ezbere sayarsa) Cennete girer.")
                       .font(.subheadline)
                }
                .frame(maxWidth:.infinity, alignment: .leading)

                VStack(alignment: .leading) {
                    Text("Buhârî , Müslim")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                }
                .frame(maxWidth:.infinity, alignment: .leading)
            }
            .frame(maxWidth:.infinity, alignment: .leading)

        }
    }
}

struct NameText_Previews: PreviewProvider {
    static var previews: some View {
        NameText()
    }
}
