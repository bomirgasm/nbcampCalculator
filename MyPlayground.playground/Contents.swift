//import UIKit
var greeting = "Hello, playground"

//이건 두 번째 커밋

import UIKit

class AddOperation {
    func operate(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

class SubtractOperation {
    func operate(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

class MultiplyOperation {
    func operate(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

class DivideOperation {
    func operate(_ a: Double, _ b: Double) -> Double? {
        guard b != 0 else {
            print("오류: 0으로 나눌 수 없습니다.")
            return nil
        }
        return a / b
    }
}

class ModuloOperation {
    func operate(_ a: Double, _ b: Double) -> Double? {
        guard b != 0 else {
            print("오류: 0으로 나머지 연산을 할 수 없습니다.")
            return nil
        }
        return Double(Int(a) % Int(b))
    }
}

class Calculator {
    private let addOperation = AddOperation()
    private let subtractOperation = SubtractOperation()
    private let multiplyOperation = MultiplyOperation()
    private let divideOperation = DivideOperation()
    private let moduloOperation = ModuloOperation()

    func calculate(operator: String, firstNumber: Double, secondNumber: Double) -> Double? {
        switch `operator` {
        case "+":
            return addOperation.operate(firstNumber, secondNumber)
        case "-":
            return subtractOperation.operate(firstNumber, secondNumber)
        case "*":
            return multiplyOperation.operate(firstNumber, secondNumber)
        case "/":
            return divideOperation.operate(firstNumber, secondNumber)
        case "%":
            return moduloOperation.operate(firstNumber, secondNumber)
        default:
            print("오류: 지원하지 않는 연산자입니다.")
            return nil
        }
    }
    
    /*
    func calculate(operator: String, firstNumber: Double, secondNumber: Double) -> Double? {
        switch `operator` {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            if secondNumber == 0 {
                print("오류: 0으로 나눌 수 없습니다.")
                return nil
            }
            return firstNumber / secondNumber
        case "%":
            if secondNumber == 0 {
                print("오류: 0으로 나머지 연산을 할 수 없습니다.")
                return nil
            }
            return Double(Int(firstNumber) % Int(secondNumber))
        default:
            print("오류: 지원하지 않는 연산자입니다.")
            return nil
        }
    }
     */
    
}

// 인스턴스 생성 후 테스트
let calculator = Calculator()

// 사칙연산 테스트
print(calculator.calculate(operator: "+", firstNumber: 40, secondNumber: 70) ?? 0)  // 110
print(calculator.calculate(operator: "-", firstNumber: 100, secondNumber: 30) ?? 0)  // 70
print(calculator.calculate(operator: "*", firstNumber: 6, secondNumber: 7) ?? 0)  // 42
print(calculator.calculate(operator: "/", firstNumber: 20, secondNumber: 5) ?? 0)  // 4
print(calculator.calculate(operator: "/", firstNumber: 10, secondNumber: 0) ?? 0)  // 오류 메시지 출력
print(calculator.calculate(operator: "%", firstNumber: 10, secondNumber: 3) ?? 0)  // 1
