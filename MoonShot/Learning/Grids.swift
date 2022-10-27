//
//  Grids.swift
//  MoonShot
//
//  Created by RqwerKnot on 28/01/2022.
//

import SwiftUI

struct Grids: View {

    // the layout used for each row or column of the VGrid or HGrid
    let layout = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 50) {
                ForEach(0..<1000){
                    Text("Item \($0)")
                }
            }
        }
    }
}

//struct Grids: View {
//
//    // the layout used for each row or column of the VGrid or HGrid
//    let layout = [
//        GridItem(.adaptive(minimum: 25))
//    ]
//
//    var body: some View {
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: layout, spacing: 200) {
//                ForEach(0..<1000){
//                    Text("Item \($0)")
//                }
//            }
//        }
//    }
//}

struct Grids_Previews: PreviewProvider {
    static var previews: some View {
        Grids()
    }
}
