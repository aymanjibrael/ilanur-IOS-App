//
//  TabView.swift
//  Adl
//
//

import SwiftUI

struct BottomBar: View {
    
    @StateObject var locationManager = LocationManager()

    var body: some View {
         
        TabView {
            NamesView()
                .tabItem {
                    Image(systemName: "house")
                        .padding(.top)
            }
            AthanView()
                .tabItem {
                    Image(systemName: "person.fill")
            }
            MapView()
                .tabItem {
                    Image(systemName: "person.fill")
            }
            Text("Friends Screen")
                .tabItem {
                    Image(systemName: "person.fill")
            }
        }
        .accentColor(Color("mycolor"))
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
