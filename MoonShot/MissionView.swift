//
//  MissionView.swift
//  MoonShot
//
//  Created by RqwerKnot on 04/02/2022.
//

import SwiftUI

struct MissionView: View {
    // Challenge: extracting view code out of main body var
    // nested extracted View to be able to make use of nested CrewMember Struct:
    struct HScrollView: View {
        
        let crew: [CrewMember]
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink {
                            AstronautView(astronaut: crewMember.astronaut)
                        } label: {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 104, height: 72)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .strokeBorder(.white, lineWidth: 1)
                                    )
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                        .fontWeight( crewMember.commander ? .bold : .light)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                    }
                }
            }
        }
    }
    
    // Challenge: extracting view code out of main body var
    // extracted as a variable:
    let customDivider: some View = Rectangle().frame(height: 2).foregroundColor(.lightBackground).padding(.vertical)
    
    // definition of a crew member is an astronaut with a specific role in this specific mission
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
        
        var commander: Bool {
            self.role.contains("Commander")
        }
    }
    // the crew for this specific mission:
    let crew: [CrewMember]
    
    // the specific mission to display details of:
    let mission: Mission
    
    var body: some View {
        GeometryReader { GeometryProxy in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: GeometryProxy.size.width * 0.6)
                        .padding(.vertical)
                    
                    Text(mission.formattedLaunchDate)
                    
                    VStack(alignment: .leading) {
                        // Custom Divider as default one has no modifiers:
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        // Custom Divider as default one has no modifiers:
                        customDivider
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    // Challenge: extract view code out of the body var for better readibility:
                    HScrollView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    // Custom Struct init for initializing one stored property as a function of 2 parameters:
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        
        NavigationView {
            MissionView(mission: missions[1], astronauts: astronauts)
        }
        .preferredColorScheme(.dark)
    }
}


