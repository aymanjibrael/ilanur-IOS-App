//
//  ContentView.swift
//  TimeToPray
//
//  Created by Ameir Al-Zoubi on 3/31/20.
//  Copyright © 2020 ameir. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        BottomBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
