//
//  PredatorMap.swift
//  JPApexPredators
//
//  Created by Bhavin Bhadani on 17/12/24.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    let predators = Predators()
    
    @State var postion: MapCameraPosition
    @State var satelite = false

    var body: some View {
        Map(position: $postion) {
            ForEach(predators.apexPredators) { predator in
                Annotation(predator.name, coordinate: predator.location) {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 3)
                        .scaleEffect(x: -1)
                }
            }
        }
        .mapStyle(satelite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            Button {
                satelite.toggle()
            } label: {
                Image(systemName: satelite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 8))
                    .shadow(radius: 3)
                    .padding()
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    PredatorMap(postion: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location, distance: 1000, heading: 600, pitch: 80))
    )
    .preferredColorScheme(.dark)
}
