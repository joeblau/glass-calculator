//
//  ContentView.swift
//  Calculator
//
//  Created by Joe Blau on 12/26/20.
//

import SwiftUI
import CameraView
import SwiftUIVisualEffects

struct ContentView: View {
    var body: some View {
        GeometryReader { g in
            ZStack {
                CameraView()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: g.size.width, height: g.size.height)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 1) {
                    Text("12")
                        .font(.system(size: 80.0, weight: .ultraLight, design: .monospaced))
                        .frame(width: g.size.width, height: g.size.height * 2/7, alignment: .trailing)
                        .vibrancyEffect()
                        .background(BlurEffect().blurEffectStyle(.systemUltraThinMaterial))

                    HStack(spacing: 1) {
                        text(text: "C", g: g, widthFraction: 0.5, heightFraction: 1/7)
                        text(text: "←", g: g, widthFraction: 0.25, heightFraction: 1/7)
                        image(systemName: "divide", g: g, widthFraction: 0.25, heightFraction: 1/7)
                    }

                    HStack(spacing: 1) {
                        text(text: "7", g: g, widthFraction: 0.25, heightFraction: 1/7)
                        text(text: "9", g: g, widthFraction: 0.25, heightFraction: 1/7)
                        text(text: "8", g: g, widthFraction: 0.25, heightFraction: 1/7)
                        image(systemName: "multiply", g: g, widthFraction: 0.25, heightFraction: 1/7)
                    }

                    HStack(spacing: 1) {
                        text(text: "4", g: g, widthFraction: 0.25, heightFraction: 1/7)
                        text(text: "5", g: g, widthFraction: 0.25, heightFraction: 1/7)
                        text(text: "6", g: g, widthFraction: 0.25, heightFraction: 1/7)
                        image(systemName: "minus", g: g, widthFraction: 0.25, heightFraction: 1/7)
                    }

                    HStack(spacing: 1) {
                        VStack(spacing: 1) {
                            text(text: "3", g: g, widthFraction: 0.25, heightFraction: 1/7)
                            text(text: "0", g: g, widthFraction: 0.25, heightFraction: 1/7)
                        }
                        VStack(spacing: 1) {
                            text(text: "2", g: g, widthFraction: 0.25, heightFraction: 1/7)
                            text(text: ".", g: g, widthFraction: 0.25, heightFraction: 1/7)
                        }
                        VStack(spacing: 1) {
                            text(text: "1", g: g, widthFraction: 0.25, heightFraction: 1/7)
                            image(systemName: "equal", g: g, widthFraction: 0.25, heightFraction: 1/7)
                        }
                        image(systemName: "plus", g: g, widthFraction: 0.25, heightFraction: 2/7)
                    }
                }
            }.font(.system(size: 40.0, weight: .ultraLight, design: .monospaced))
        }
        .ignoresSafeArea()
    }
    
    func text(text: String, g: GeometryProxy, widthFraction: CGFloat, heightFraction: CGFloat) -> some View {
        Text(text)
            .frame(width: (g.size.width * widthFraction) + (0.5 == widthFraction ? 1 : 0), height: g.size.height * heightFraction)
            .vibrancyEffect()
            .background(BlurEffect().blurEffectStyle(.systemUltraThinMaterial))
    }
    
    func image(systemName: String, g: GeometryProxy, widthFraction: CGFloat, heightFraction: CGFloat) -> some View {
        Image(systemName: systemName)
            .frame(width: g.size.width * widthFraction, height: g.size.height * heightFraction)
            .vibrancyEffect()
            .background(BlurEffect().blurEffectStyle(.systemUltraThinMaterial))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
