//
//  Mission.swift
//  MoonShot
//
//  Created by RqwerKnot on 31/01/2022.
//

import Foundation

struct Mission: Codable, Identifiable {
    // nested Struct: easier for reading the code, can only be used within Mission structure
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    // properties that match the keys found in the JSON data:
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    // computed properties for easy access in any View using Mission structure:
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)" // will fecth the picture file in the assets catalog that match the string: "apollo1" will fetch apollo1@1x or apollo1@2x or apollo1@3x automatically depending on the platform/device being used
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
