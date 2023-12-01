# 묵찌빠 프로그램 토이 프로젝트

> **묵찌빠 프로그램** <br>
>
> 프로젝트 소개: SeSAC 토이 프로젝트 - 묵찌빠 콘솔 프로그램    
> 프로젝트 기간: 2023.11.23 ~ 2023.12.01

## 팀원 소개
| <img src="https://github.com/tasty-code/ios-rock-scissor-paper/assets/63277563/129dca38-b8b6-401e-893d-5a6ba5e0f927.png" width="200"> | <img src="https://github.com/tasty-code/ios-rock-scissor-paper/assets/63277563/74858b2b-9ffd-4f86-8b6f-fe6b4c03874d.png" width="200"> |
|:----------:|:---------:|
| **Jane** | **Nnn** |
| [@jane1choi](https://github.com/jane1choi) |  [@Nnn-Park](https://github.com/Nnn-Park)) | 
<br>

## 구현 내용
### Step 1 : 가위, 바위, 보 게임 구현
- 최초 실행 시 출력
    - `가위(1), 바위(2), 보(3)! <종료 : 0> :`
    - 사용자에게 `0`, `1`, `2`, `3` 중 한 가지를 입력받아 결과를 출력합니다.
    - 컴퓨터의 패는 임의의 패를 정하여 냅니다.
    - 비긴 경우: `“비겼습니다!”` 출력 후 다시 최초 실행 상태로 복귀
    - 이긴 경우: `“이겼습니다!”` 출력 후 게임 종료
    - 진 경우: `“졌습니다!”` 출력 후 게임 종료
    - `0`을 입력받은 경우: 게임 종료
    - `0~3`이 아닌 값을 입력받은 경우: `“잘못된 입력입니다. 다시 시도해주세요.”` 출력 후 최초 실행 상태로 복귀

### Step 2 : 묵찌빠 게임 구현
- Step 1의 게임 중 가위, 바위, 보 후에 결과에 따라 게임을 이어갑니다.
    - 가위, 바위, 보를 비긴 경우: 다시 가위, 바위, 보 게임 진행
    - 가위, 바위, 보 게임에서 승패가 갈린 경우: 묵찌빠로 이어서 게임 진행
- 묵, 찌, 빠 실행 시 출력
    - `[*** 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :`
        - `[*** 턴]` 위치에는 현재 누구의 턴인지 표시합니다.
        - 가위, 바위, 보 게임 혹은 지난 턴에서 이긴 사람이 턴을 쥡니다.
        - 잘못된 입력을 한 경우 컴퓨터에게 턴을 넘깁니다.
- 사용자에게 `0, 1, 2, 3` 중 한 가지를 입력받아 결과를 출력합니다.
    - 사용자의 패와 컴퓨터의 패가 동일한 경우: 턴을 쥐고 있는 쪽이 승리합니다.
        - `“***의 승리!”` 출력 후 게임 종료
    - 사용자의 패와 컴퓨터의 패가 다른 경우: 이긴 쪽이 턴을 쥡니다.
        - `“***의 턴입니다”` 출력 후 묵, 찌, 빠 계속 실행
    - `0`을 입력받은 경우: 게임 종료
 
### ⚠️ 제약사항
- 코드에 느낌표(!)를 사용하지 않습니다.
- Swift API Design Guidelines의 문서대로 코드를 작성합니다.
- 코드에 주석을 남기지 않습니다.
- exit() 함수를 사용하지 않습니다.

## 폴더 구조
```
RockPaperScissors
├── 📁Constants
│   ├── AdvancedRockPaperScissorsType.swift
│   ├── GameError.swift
│   ├── GameResultType.swift
│   ├── PlayerType.swift
│   └── RockPaperScissorsType.swift
├── 📁GameManagers
│   ├── AdvancedRockPaperScissorsManager.swift
│   └── RockPaperScissorsManager.swift
├── 📁Protocols
│   ├── Convertible.swift
│   └── Playable.swift
└── main.swift
```
## 구현 화면
<img src="https://github.com/tasty-code/ios-rock-scissor-paper/assets/63277563/dac1ee99-0716-40e4-82e8-d7a55dcbd55c.png" width="500">
<br>
<img src="https://github.com/tasty-code/ios-rock-scissor-paper/assets/63277563/9d930a2b-f062-4f8c-a691-967f4071c988.png" width="500">

## 구현 사항
- `~Manager` 클래스가 각 게임의 진행을 담당합니다.
- `main.swift`에서 `.playGame()` 을 통해 게임 프로그램을 구동합니다.
```Swift
private let rockPaperScissorsManager = RockPaperScissorsManager()
private let advancedRockPaperScissorsManager = AdvancedRockPaperScissorsManager(rockPaperScissorsManager: rockPaperScissorsManager)

private let rockPaperScissorsResult = rockPaperScissorsManager.playGame(.default)

switch rockPaperScissorsResult {
case .exit:
    break
default:
    advancedRockPaperScissorsManager.playGame(rockPaperScissorsResult)
}
```
------
## 구현 포인트
### 1. 프로토콜을 이용한 추상화
객체 지향적 설계를 위해 프로토콜을 활용했습니다.   
프로토콜을 통해 두 게임(가위바위보, 묵찌빠) 객체의 인터페이스를 동일하게 설계함으로써 공통된 부분을 묶어 객체를 추상화하고,    
구체적인 클래스 내부 구현을 다르게 해서 다형성을 구현했습니다.

**프로토콜을 사용해서 설계한 이유:**   
두 게임의 전체적인 동작 구조는 같기 때문에(유저입력 유효성 검사 -> 게임진행 -> 메시지 출력 등) 프로토콜을 이용해 동일한 인터페이스로 설계하였고,   
두 게임의 구체적인 동작 방식(내부 구현)만 다르도록 구현했습니다.    
또한, `protocol extension` 에서의 메서드 기본 구현을 통해 두 게임에서 공통적으로 사용되는 로직을 하나로 묶을 수 있도록 했습니다.


**프로토콜을 사용했을 때의 장점:**
- 구체적인 내부 구현을 숨겨(캡슐화) `main`을 단순화 할 수 있었습니다.
- 특정 게임의 로직이 변경된다면 `main`을 수정할 필요없이 `~Manager` 클래스에서 필요한 부분만 찾아서 코드를 수정할 수 있게 되기 때문에 좀 더 유연한 설계가 됩니다.
- 두 게임 클래스의 인터페이스가 같기 때문에(= 같은 이름의 함수로 각자 다른 동작) 읽기 쉬운 코드가 됩니다.

```Swift
protocol Playable {
    func validateUserInput(_ input: String?) throws -> Int
    func showMessage(_ messageType: GameResultType, _ turn: PlayerType)
    func playGame(_ result: GameResultType) -> GameResultType
}

extension Playable {
    
    func validateUserInput(_ input: String?) throws -> Int {
        guard let input = input,
              let num = Int(input),
              (0...3).contains(num) else {
            throw GameError.invalidInput
        }
        
        return num
    }
}
```
```Swift
protocol JudgeRockPaperScissors {
    func judgeGame(userChoice: RockPaperScissorsType?, computerChoice: RockPaperScissorsType?) -> GameResultType
}

protocol JudgeAdvancedRockPaperScissors {
    func judgeGame(userChoice: AdvancedRockPaperScissorsType?, computerChoice: AdvancedRockPaperScissorsType?, turn: PlayerType) -> GameResultType
}
```
### 2. 프로토콜을 활용한 타입 Convert
`Convertible` 프로토콜을 활용해 `enum` 타입을 변환할 수 있도록 하였습니다.   
각 게임에서 `0~3` 숫자가 의미하는 것이 다르므로 다른 `rawValue`를 가진 `enum`타입을 생성해주었고,   
묵찌빠 클래스 내에서 가위바위보 게임의 판단 로직 이용 시 프로토콜의 `convertedType` 프로퍼티를 통해 타입 변환을 해줄 수 있도록 구현했습니다.    

```Swift
protocol Convertible {
    associatedtype T
    
    var convertedType: T { get }
}
```
```Swift
enum AdvancedRockPaperScissorsType: Int, Convertible {
    case none = 0
    case rock = 1
    case scissors = 2
    case paper = 3
    
    typealias T = RockPaperScissorsType
    
    var convertedType: T {
        switch self {
        case .none:
            return .none
        case .rock:
            return .rock
        case .scissors:
            return .scissors
        case .paper:
            return .paper
        }
    }
}
```
```Swift
let result = rockPaperScissorsManager.judgeGame(userChoice: userChoice?.convertedType, computerChoice: computerChoice?.convertedType)
```

### 3. GameError 타입과 에러처리문을 활용한 에러 케이스 처리
`GameError`타입을 이용해 입력 유효성 검사를 하는 함수 내 에러 케이스에서 에러를 `throw`하고,    
`do catch`문에서의 처리를 통해 `nil`값을 안전하게 처리할 수 있도록 했습니다.
```Swift
enum  GameError: Error {
    case  invalidInput
}
```
```Swift
do {
    validatedInput = try validateUserInput(input)
    userChoice = AdvancedRockPaperScissorsType(rawValue: validatedInput)
} catch {
    print("잘못된 입력입니다. 다시 시도해주세요.")
    continue
}
```
