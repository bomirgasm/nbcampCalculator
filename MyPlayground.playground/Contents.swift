//import UIKit
var greeting = "Hello, playground"

//이건 두 번째 커밋

import UIKit

class Calculator {
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
}

// 인스턴스 생성 후 테스트
let calculator = Calculator()
if let result = calculator.calculate(operator: "+", firstNumber: 40, secondNumber: 70) {
    print("결과: \(result)")
}
