//
//  ContentView.swift
//  MoonShot
//
//  Created by RqwerKnot on 28/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    //Swift is able to infer the type returned if 'decode' specify a type in its implementation
    let astronauts = Bundle.main.decode("astronauts.json")
    // Type annotation is mandatory when using 'decode' with generics type
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    // Tell SwiftUI which layout to use with LazyVGrid View:
    let layout = [ GridItem(.adaptive(minimum: 150))]
    // as many items as the parent container (here: the device screen) allows with 1 constraint: each item must be at least 150 points (wide or high, depending on the device orientation, portrait or landscape)
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                                
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.lightBackground)
                            )

                        }
                    }
                }
                .padding([.horizontal, .bottom], 12)
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark) // force the app in dark mode whatever the user settings is
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
