func minSplit(amount: Int) -> Int {
    let coins = [1, 5, 10, 20, 50]
    var dp = Array(repeating: Int.max, count: amount + 1)
    dp[0] = 0
    
    for i in 1...amount {
        for j in 0..<coins.count {
            if coins[j] <= i {
                dp[i] = min(dp[i], dp[i - coins[j]] + 1)
            }
        }
    }
    
    return dp[amount]
}
func sumOfDigits(start: Int, end: Int) -> Int {
    var sum = 0
    for i in start...end {
        var number = i
        while number > 0 {
            sum += number % 10
            number /= 10
        }
    }
    return sum
}
func isProperly(sequence: String) -> Bool {
    var cntr = 0
    for char in sequence {
        if char == "(" {
            cntr += 1
        } else if char == ")" {
            cntr -= 1
            if cntr < 0 {
                return false
            }
        }
    }
    return cntr == 0
}
print(minSplit(amount:172))
print(minSplit(amount:172))
print(minSplit(amount:172))
print(sumOfDigits(start:7,end:8))
print(sumOfDigits(start:17,end:20))
print(sumOfDigits(start:10,end:12))
print(isProperly(sequence: "(()())"))
print(isProperly(sequence: ")(()"))
print(isProperly(sequence: "(()())("))
