import Foundation

var gameRecords: [Int] = []
var gameIndex = 0
func startGame() {
    gameIndex += 1
    var numberArray1: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    numberArray1.shuffle()
    var numberArray2 = [numberArray1[0], numberArray1[1], numberArray1[2]]
    if numberArray2[0] == 0 {
        numberArray2 = [numberArray1[1], numberArray1[2], numberArray1[3]]
    }
    print("--- 정답 미리 알려드릴게요 ---")
    print(numberArray2)
    print("⚾️ \(gameIndex)번째 게임을 시작하겠습니다. 숫자를 입력해주세요.")
    var tryCount = 0
    while true {
        let abc = readLine()!
            tryCount += 1
        if abc.count != 3 {
            print("⚾️ 세 자리 숫자만 입력 가능합니다.")
            continue
        }
        let bcd = Array(abc)
        let containsOnlyDigits = bcd.allSatisfy {$0.isNumber}
        if !containsOnlyDigits {
            print("⚾️ 문자를 입력할 수 없습니다.")
            continue
        }
        let uniqueDigit = Set(bcd)
        if uniqueDigit.count != 3 {
            print("⚾️ 중복된 숫자는 입력할 수 없습니다.")
            continue
        }
        if bcd[0] == "0" {
            print("⚾️ 앞 자리에 0을 입력할 수 없습니다.")
            continue
        }
        var strike = 0
        var ball = 0
        for (index, element) in bcd.enumerated() {
            if Int(String(element))! == numberArray2[index] {
                strike += 1
            }
            else if numberArray2.contains(Int(String(element))!) {
                ball += 1
            }
        }
        if strike == 3 {
            break
        }
    print ("\(strike)스트라이크 \(ball)볼 입니다.")
    }
    print("🎉 정답이에요!")
    gameRecords.append(tryCount)
    print("⚾️ 게임 다시 하실래요?")
    while true {
        print("(1) 네.\n(2) 게임 기록 볼래요.\n(3) 여기서 게임 종료할게요.")
        if let choicee = readLine() {
            switch choicee {
            case "1":
//                 print("\(gameIndex + 1)번째 게임을 시작하겠습니다. 숫자를 입력해주세요.")
                startGame()
            case "2":
                viewRecords()
            case "3":
                print("⚾️ 게임을 종료합니다.")
                exit(0)
            default:
                print("⚾️ 다시 선택해주세요.")
                return
            }
        }
    }
}

print("⚾️ 안녕하세요. 원하시는 번호를 입력해주세요.")
func showMenu() {
    while true {
        print("(1) 게임 시작하기\n(2) 게임 기록보기\n(3) 게임 종료하기")
        if let choice = readLine() {
            switch choice {
            case "1":
                startGame()
                return
            case "2":
                viewRecords()
            case "3":
                print("⚾️ 게임을 종료합니다.")
                return
            default:
                print("⚾️ 다시 선택해주세요.")
            }
        }
    }
}
showMenu()

func viewRecords() {
    print("⚾️ 게임 기록을 확인하겠습니다.")
    if gameRecords.isEmpty {
        print("- 기록이 없습니다. -")
    }
    else {
        for (index, record) in gameRecords.enumerated() {
            print("\(index + 1)번째 게임 : 시도 횟수 \(record)회")
        }
    }
    print("⚾️ 이전 화면으로 돌아갈까요?")
    while true {
        print("(1) 네.\n(2) 여기서 게임 종료할게요.")
        if let choiceee = readLine() {
            switch choiceee {
            case "1":
                print("⚾️ 초기 화면으로 돌아갑니다.\n⚾️ 안녕하세요. 원하시는 번호를 입력해주세요.")
                showMenu()
                return
            case "2":
                print("⚾️ 게임을 종료합니다.")
                exit(0)
            default:
                print("⚾️ 다시 선택해주세요.")
                return
            }
        }
    }
}
