//
//  AstronautView.swift
//  MoonShot
//
//  Created by RqwerKnot on 04/02/2022.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct AstronautView_Previews: PreviewProvider {
    
    static let astronauts = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        NavigationView {
            AstronautView(astronaut: astronauts["armstrong"]!)
        }
        .preferredColorScheme(.dark)
    }
}
