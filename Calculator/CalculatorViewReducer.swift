//
//  CalculatorViewReducer.swift
//  Calculator
//
//  Created by Joe Blau on 12/26/20.
//

import Foundation
import ComposableArchitecture

enum Operation {
    case add
    case subtract
    case multiply
    case divide
}

struct CalculatorState: Equatable {
    var output: String = ""
    var left: Double? = nil
    var right: Double? = nil
    var operation: Operation? = nil
}

enum CalculatorAction: Equatable {
    case clear
    case operation(Operation)
    case insertDigit(Int)
    case insertDecimalPoint
    case deleteDigit
    case apply
    case formatOutput
}

struct CalculatorEnvironment {
    var outputFormatter: NumberFormatter {
        let f = NumberFormatter()
        f.minimumFractionDigits = 0
        f.numberStyle = .decimal
        return f
    }
}

let calculatorReducer = Reducer<CalculatorState, CalculatorAction, CalculatorEnvironment> { state, action, env in
    
    switch action {
    case .clear:
        state.output.removeAll()
        
    case let .operation(operation):
        state.left = Double(state.output)
        state.operation = operation
        state.output.removeAll()
        
    case let .insertDigit(digit):
        state.output.append("\(digit)")
        return Effect(value: .formatOutput)
        
    case .insertDecimalPoint:
        state.output.append(".")

    case .deleteDigit:
        state.output.removeLast()
        return Effect(value: .formatOutput)

    case .apply:
        state.right = Double(state.output)
        guard let operation = state.operation,
              let left = state.left,
              let right = state.right else { return .none }
        switch operation {
        case .add:
            state.output = "\(left + right)"
        case .subtract:
            state.output = "\(left - right)"
        case .multiply:
            state.output = "\(left * right)"
        case .divide:
            state.output = "\(left / right)"
        }
        return Effect(value: .formatOutput)
        
    case .formatOutput:
        guard let number =  Double(state.output) else { return .none }
        state.output = env.outputFormatter.string(from: number as NSNumber) ?? "Undefined"
    }
    
    return .none
}
