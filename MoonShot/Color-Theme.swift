//
//  Color-Theme.swift
//  MoonShot
//
//  Created by RqwerKnot on 01/02/2022.
//

import Foundation
import SwiftUI


// Color type conforms to ShapeStyle Protocol that is used for example with the .background modifier
// To make sure the static var will be accessible for every modifier using a ShapeStyle conformance, an Extension must be added on the ShapeStyle Protocol
// Also for SwiftUI to understand it's a Color which is actually used within a modifier expecting a ShapeStyle when typing '.darkBackground', 'where Self == Color' must be added:

extension ShapeStyle where Self == Color {
    static var darkBackground : Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground : Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}


// this would work as well but will require to type 'Color.abcd' each time, instead of '.abcd':

//extension Color {
//    static var darkColorBackground: Color {
//        Color(red: 0.1, green: 0.1, blue: 0.2)
//    }
//
//    static var lightColorBackground: Color {
//        Color(red: 0.2, green: 0.2, blue: 0.3)
//    }
//}
