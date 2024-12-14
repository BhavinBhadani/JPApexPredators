//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Bhavin Bhadani on 12/12/24.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    
    @State var searchedText = ""
    
    var filteredPredators: [ApexPredator] {
        if searchedText.isEmpty {
            return predators.apexPredators
        }
        return predators.apexPredators.filter { $0.name.localizedCaseInsensitiveContains(searchedText) }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredPredators) { predator in
                NavigationLink {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                } label: {
                    HStack {
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        VStack(alignment: .leading) {
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 10)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchedText)
            .autocorrectionDisabled()
            .animation(.default, value: searchedText)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
