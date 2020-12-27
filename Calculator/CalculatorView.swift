//
//  ContentView.swift
//  Calculator
//
//  Created by Joe Blau on 12/26/20.
//

import SwiftUI
import CameraView
import SwiftUIVisualEffects
import ComposableArchitecture

enum ButtonType {
    case text(String)
    case image(String)
}

struct CalculatorView: View {
    let store: Store<CalculatorState, CalculatorAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                CameraView()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 1) {
                    Text(viewStore.output)
                        .font(.system(size: 60.0, weight: .ultraLight, design: .monospaced))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2/7, alignment: .trailing)
                        .vibrancyEffect()
                        .background(BlurEffect().blurEffectStyle(.systemUltraThinMaterial))
                    
                    HStack(spacing: 1) {
                        button(type: .text("C"), action: .clear, widthFraction: 0.5, heightFraction: 1/7)
                        button(type: .text("←"), action: .deleteDigit, widthFraction: 0.25, heightFraction: 1/7)
                        button(type: .image("divide"), action: .operation(.divide), widthFraction: 0.25, heightFraction: 1/7)
                    }
                    
                    HStack(spacing: 1) {
                        button(type: .text("7"), action: .insertDigit(7), widthFraction: 0.25, heightFraction: 1/7)
                        button(type: .text("8"), action: .insertDigit(8), widthFraction: 0.25, heightFraction: 1/7)
                        button(type: .text("9"), action: .insertDigit(9), widthFraction: 0.25, heightFraction: 1/7)
                        button(type: .image("multiply"), action: .operation(.multiply), widthFraction: 0.25, heightFraction: 1/7)
                    }
                    
                    HStack(spacing: 1) {
                        button(type: .text("4"), action: .insertDigit(4), widthFraction: 0.25, heightFraction: 1/7)
                        button(type: .text("5"), action: .insertDigit(5), widthFraction: 0.25, heightFraction: 1/7)
                        button(type: .text("6"), action: .insertDigit(6), widthFraction: 0.25, heightFraction: 1/7)
                        button(type: .image("minus"), action: .operation(.subtract), widthFraction: 0.25, heightFraction: 1/7)
                    }
                    
                    HStack(spacing: 1) {
                        VStack(spacing: 1) {
                            button(type: .text("3"), action: .insertDigit(3), widthFraction: 0.25, heightFraction: 1/7)
                            button(type: .text("0"), action: .insertDigit(0), widthFraction: 0.25, heightFraction: 1/7)
                        }
                        VStack(spacing: 1) {
                            button(type: .text("2"), action: .insertDigit(2), widthFraction: 0.25, heightFraction: 1/7)
                            button(type: .text("."), action: .insertDecimalPoint, widthFraction: 0.25, heightFraction: 1/7)
                        }
                        VStack(spacing: 1) {
                            button(type: .text("1"), action: .insertDigit(1), widthFraction: 0.25, heightFraction: 1/7)
                            button(type: .image("equal"), action: .apply, widthFraction: 0.25, heightFraction: 1/7)
                        }
                        button(type: .image("plus"), action: .operation(.add), widthFraction: 0.25, heightFraction: 2/7)
                    }
                }
            }.font(.system(size: 40.0, weight: .ultraLight, design: .monospaced))
            .ignoresSafeArea()
        }
    }
    
    func button(type: ButtonType, action: CalculatorAction, widthFraction: CGFloat, heightFraction: CGFloat) -> some View {
        Button(action: {
            ViewStore(store).send(action)
        }, label: {
            Group {
                switch type {
                case let .text(text): Text(text)
                case let .image(text): Image(systemName: text)
                }
            }
            .frame(width: ( UIScreen.main.bounds.width * widthFraction) + (0.5 == widthFraction ? 1 : 0), height:  UIScreen.main.bounds.height * heightFraction)
            .vibrancyEffect()
            .background(BlurEffect().blurEffectStyle(.systemUltraThinMaterial))
        })
    }
}

#if DEBUG
struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(store: sampleCalculatorStore)
    }
}
#endif
