//
//  ResizingImage.swift
//  MoonShot
//
//  Created by RqwerKnot on 28/01/2022.
//

import SwiftUI

struct ResizingImage: View {
    var body: some View {
        
        // Image content will be displayed at original size by default
        // .resizable modifier is required
        
        Image("airport")
            // using .resizable will make the picture use as much space as its parent container allows (in this case the @ViewBuilder of body var)
            .resizable() // mandatory for any further image resizing, otherwise the image in its original size and ratio is displayed
        
//            .scaledToFill() // keep the original ratio but part of the picture is not shown since the parent container certainly has a different ratio
        
            .scaledToFit() // keep the original ratio and show the full picture but part of the container will be blank since it has certainly a different ratio
        
            .frame(width: 350, height: 250) // give a new parent container to the picture with specific width and height
        
            .background(.mint) // just to better understand the ClipShape effect
        
//            .clipped() // clip along the frame size: useful when picture overflow its parent frame (scaleToFill)
        
            .clipShape(Circle()) // clip along a given Shape
        // in this case, the circle's diameter is min(frame's width, frame's height), ie the Circle is within the frame (circonscrit)
        
            .background(.yellow) // just to better understand the ClipShape effect
    }
}

struct ResizingImage_Previews: PreviewProvider {
    static var previews: some View {
        ResizingImage()
    }
}
