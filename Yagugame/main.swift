import Foundation
/*
func startGame() {
    print("게임 시작.")
    print("숫자를 입력하세요.")
    
    while (true) {
        let input = readLine()!
        var a = Int(input)!
        if a > 999 {
            print("숫자를 잘못 입력하셨습니다. 세 자리 수 까지만 가능합니다.")
        }
    }
}
startGame()
*/

var numberArray1: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
numberArray1.shuffle()
var numberArray2 = [numberArray1[0], numberArray1[1], numberArray1[2]]
print("게임을 시작하겠습니다. 숫자를 입력하세요. 같은 숫자 중복은 안됩니다. 첫 자리 0도 안됩니다.")
while true {
    let abc = readLine()!
    let bcd = Array(abc)
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
print("정답이에요!")


/*
print (numberArray)
let a = numberArray[0]
let b = numberArray[1]
let c = numberArray[2]
print("첫번째 숫자를 입력하세요")
let d = readLine()!
print("두번째 숫자를 입력하세요")
let e = readLine()!
print("세번째 숫자를 입력하세요")
let f = readLine()!
 
 a==d || b==e
*/




/*
print ("첫번째 숫자입니다 <\(a)>")
print ("두번째 숫자입니다 <\(b)>")
print ("세번째 숫자입니다 <\(c)>")

// random.numberArray()
*/
