//
//  NavView.swift
//  MoonShot
//
//  Created by RqwerKnot on 28/01/2022.
//

import SwiftUI

struct NavView: View {
    var body: some View {
        NavigationView {
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                NavigationLink {
                    Text("detail view for item \(item)")
                } label: {
                    Text("item \(item)")
                }
                        
            
            }
            .navigationTitle("Navtitle")
        }
        
        
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
