//
//  ContentView.swift
//  Masking
//
//  Created by Skorobogatow, Christian on 4/7/22.
//

import SwiftUI

struct AnimatedStars: View {
    
    @State var rating: Int = 2
    
    var body: some View {
        ZStack {
            starsView
                .overlay(overlayView.mask(starsView))
        }
    }
    
    private var overlayView: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.blue, .yellow]),
                                         startPoint: .leading,
                                         endPoint: .trailing))
//                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating =  index
                        }
                        
                    }
                
            }
        }
    }
}

struct AnimatedStars_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedStars()
    }
}
