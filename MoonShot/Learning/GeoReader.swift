//
//  GeoReader.swift
//  MoonShot
//
//  Created by RqwerKnot on 28/01/2022.
//

import SwiftUI

struct GeoReader: View {
    
    var body: some View {
        
        GeometryReader { GeometryProxy in
            // by default Content in the GeometryReader container is top-left aligned (x=0,y=0)
            Image("airport")
                .resizable()
                .scaledToFit()
            // to constrain Image to 2 thirds of the total available width
                .frame(width: GeometryProxy.size.width * 0.67)
            // to center the frame instead of default top-left:
                .frame(width: GeometryProxy.size.width, height: GeometryProxy.size.height)
        }
    }
}

struct GeoReader_Previews: PreviewProvider {
    static var previews: some View {
        GeoReader()
    }
}
