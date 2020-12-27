//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Joe Blau on 12/26/20.
//

import SwiftUI
import ComposableArchitecture

@main
struct CalculatorApp: App {
    let store: Store = Store(initialState: CalculatorState(),
                             reducer: calculatorReducer,
                             environment: CalculatorEnvironment())
    var body: some Scene {
        WindowGroup {
            CalculatorView(store: store)
        }
    }
}
