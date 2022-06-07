//
//  MapView.swift
//  Adl
//
//  Created by Abdul Adl on 28.05.2022.
//
import SwiftUI
import Foundation
import MapKit

struct MapView: View {
    @StateObject private var locationModel = LocationManager()

    var body: some View {
        ZStack {
            VStack {
                Map(coordinateRegion: $locationModel.region, showsUserLocation: true)
                    .frame(maxWidth: .infinity, minHeight: 200 , maxHeight: 220)
        //            .ignoresSafeArea(.container)
                    .onAppear {
                        locationModel.checkIfLocationServicesIsEnabled()
                    }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
