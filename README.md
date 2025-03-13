# nbcampCalculator

# Swift 계산기 프로젝트

## 프로젝트 개요
Swift를 활용하여 간단한 계산기 클래스를 구현하는 프로젝트입니다. 연산을 직접 수행하는 기존 방식에서 연산 클래스를 분리하고, 객체지향적 설계를 적용하여 유지보수성을 향상시켰습니다.

## 사용 기술
- **언어**: Swift 5.9
- **개발 환경**: Xcode 16+
- **패턴 적용**: 단일 책임 원칙 (SRP)

## 프로젝트 구조
```
CalculatorProject/
├── Sources/
│   ├── Calculator.swift        # Calculator 클래스
│   ├── Operations/
│   │   ├── AddOperation.swift       # 더하기 연산 클래스
│   │   ├── SubtractOperation.swift  # 빼기 연산 클래스
│   │   ├── MultiplyOperation.swift  # 곱하기 연산 클래스
│   │   ├── DivideOperation.swift    # 나누기 연산 클래스
│   │   ├── ModuloOperation.swift    # 나머지 연산 클래스
├── README.md
```
를 시도했지만 브랜치 다루는 법이 미숙해 그냥.. 나중에 수정하기로 했어요

## 기능 설명

### 1. 기본 사칙연산 지원 (Lv1~Lv2)
- 덧셈 (`+`)
- 뺄셈 (`-`)
- 곱셈 (`*`)
- 나눗셈 (`/`)
- 나머지 연산 (`%`)

### 2. 객체지향적 설계 적용 (Lv3)
- 연산 클래스를 개별적으로 분리하여 `Calculator`가 직접 연산을 수행하지 않도록 개선
- 단일 책임 원칙(SRP)을 적용하여 각 클래스가 하나의 역할만 담당

## 코드 예시

### 연산 클래스 예시
```
class AddOperation {
    func operate(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}
```

### Calculator 클래스에서 연산 클래스 활용
```
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
}
```

### 테스트 예제
```swift
let calculator = Calculator()
print(calculator.calculate(operator: "+", firstNumber: 10, secondNumber: 5) ?? 0)  // 15
print(calculator.calculate(operator: "-", firstNumber: 10, secondNumber: 5) ?? 0)  // 5
print(calculator.calculate(operator: "*", firstNumber: 10, secondNumber: 5) ?? 0)  // 50
print(calculator.calculate(operator: "/", firstNumber: 20, secondNumber: 5) ?? 0)  // 4
print(calculator.calculate(operator: "%", firstNumber: 10, secondNumber: 3) ?? 0)  // 1
```

## 예외 처리
- `DivideOperation`: 0으로 나누는 경우 오류 메시지를 출력하고 `nil` 반환
- `ModuloOperation`: 0으로 나누는 경우 오류 메시지를 출력하고 `nil` 반환

## 개선 사항 & 향후 계획 (Lv4)
- **추상화(Protocol) 적용 예정**
  - `Calculator`가 연산 클래스에 직접 의존하지 않도록 개선
  - `Operation` 프로토콜을 도입하여 의존성 역전 원칙(DIP) 적용
- **연산 클래스를 동적으로 등록할 수 있는 방식으로 변경 검토**

## 과제 요구사항 반영 여부
- [V] Lv1: 기본 사칙연산 구현
- [v] Lv2: 나머지 연산 추가 및 예외 처리
- [v] Lv3: 연산 클래스를 분리하여 구조화
- [ ] Lv4: 추상화 적용 (다음 단계에서 진행 예정)

## 프로젝트 실행 방법
```bash
git clone https://github.com/내GitHub계정/SwiftCalculator.git
cd SwiftCalculator
open SwiftCalculator.xcodeproj
```
Xcode에서 실행 후 `Playground`에서 테스트 가능!

