//
//  SampleCalculatorReducer.swift
//  Calculator
//
//  Created by Joe Blau on 12/26/20.
//

#if DEBUG
import Foundation
import ComposableArchitecture

let sampleCalculatorStore = Store(initialState: CalculatorState(),
                                  reducer: calculatorReducer,
                                  environment: CalculatorEnvironment())

#endif
