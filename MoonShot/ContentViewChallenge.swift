//
//  ContentViewChallenge.swift
//  MoonShot
//
//  Created by RqwerKnot on 07/02/2022.
//

import SwiftUI

struct ContentViewChallenge: View {
    
    let astronauts = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var gridLayout = true
    
    var body: some View {
        NavigationView {
            Group { // using Group enables us to attach a modifier (here: '.toolbar') inside the NavigationView
                // it is not possible to attach one directly to a 'if/else' statement
                if gridLayout {
                    GridLayout(missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                }
                
            }
            // a new toolbar button to switch between Grid and List layout
            .toolbar {
                Button {
                    gridLayout.toggle()
                } label: {
                    Label("Layout", systemImage: "tablecells.badge.ellipsis")
                }
                .foregroundColor(.white)
                
            }
        }
    }
}

struct ContentViewChallenge_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewChallenge()
    }
}

// We just reuse the initial Grid layout of the project as an Extracted View
struct GridLayout: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    let layout = [ GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        
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
        .navigationTitle("MoonShot Grid")
        .background(.darkBackground)
        .preferredColorScheme(.dark) // force the app in dark mode whatever the user settings is
    }
}

// New List layout
struct ListLayout: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        
        List {
            ForEach(missions) { mission in
                
                // trick to hide the disclosure indicator from NavLinks:
                ZStack(alignment: .leading) {
                    NavigationLink{
                        MissionView(mission: mission, astronauts: astronauts) // destination View as usual
                    } label: {
                        EmptyView() // EmptyView because the NavLink View will be overlapped by the following ZStacked View
                    }
                    .opacity(0) // make sure this NavView doesn't appear on screen in any way
                    
                    // the actual View to show as a row of the list
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
                
                // the orginal NavigationLink with no visual trick:
                //                    NavigationLink {
                //                        MissionView(mission: mission, astronauts: astronauts)
                //                    } label: {
                //                        VStack {
                //                            Image(mission.image)
                //                                .resizable()
                //                                .scaledToFit()
                //                                .frame(width: 100, height: 100)
                //                                .padding()
                //
                //                            VStack {
                //                                Text(mission.displayName)
                //                                    .font(.headline)
                //                                    .foregroundColor(.white)
                //
                //                                Text(mission.formattedLaunchDate)
                //                                    .font(.caption)
                //                                    .foregroundColor(.white.opacity(0.5))
                //                            }
                //                            .padding(.vertical, 12)
                //                            .frame(maxWidth: .infinity)
                //                            .background(.lightBackground)
                //
                //                        }
                //                        .clipShape(RoundedRectangle(cornerRadius: 12))
                //                        .overlay(
                //                            RoundedRectangle(cornerRadius: 12)
                //                                .stroke(.lightBackground)
                //                        )
                //
                //                    }
            }
            .listRowBackground(Color.darkBackground) // set the background color of the list
            .listRowSeparator(.hidden) // hide List Rows default separators
            
            
        }
        .listStyle(.plain) // change the default Style of the List to match colors of our initial Grid design
        .background(.darkBackground)
        .navigationTitle("MoonShot List")
        .preferredColorScheme(.dark)
    }
}

// A classic preview for our new List layout:
struct ListLayout_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        NavigationView {
            ListLayout(missions: missions, astronauts: astronauts)
        }
    }
}
