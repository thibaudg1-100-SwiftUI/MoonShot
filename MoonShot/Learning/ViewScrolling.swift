//
//  ViewScrolling.swift
//  MoonShot
//
//  Created by RqwerKnot on 28/01/2022.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String){
        print("Creating a CustomText: \(text)")
        self.text = text
    }
}

struct ViewScrolling: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            // Switch between VStack and LazyVStack to understand how its content is created during initial VStack creation or on demand when using LazyVStack
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    // to print a statement in the console each time a View is created in the VStack or LazyVStack
                    CustomText("Hello \($0)")
                }
            }
            // to show the indicator on the far right, and not just right of the text (useful with VStack, useless for LazyVStack for it uses all available space by default)
            .frame(maxWidth: .infinity)
        }
    }
}

struct ViewScrolling_Previews: PreviewProvider {
    static var previews: some View {
        ViewScrolling()
    }
}
