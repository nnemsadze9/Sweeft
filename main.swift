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
func countWays(n: Int, steps: [Int]) -> Int {
   var d = Array(repeating: 0, count: n + 1)
   if steps[0] != 0 {
      d[1] = 1
   }
   if steps[1] != 0 {
      d[2] = d[1] + 1
   }
   if steps[0] == 0 && steps[1] == 0 {
      return 0
   }
   for i in 3...n {
      if steps[i - 2] == 0 && steps[i - 1] == 0 {
         return 0
      }
      if steps[i - 1] == 1 {
         d[i] = d[i - 1] + d[i - 2]
      }
   }
   return d[n] + d[n - 1]
}
func zeros(N: Int) -> Int {
    var cntr = 0
    for i in 1...N {
        var number = i
        while number % 5 == 0 {
            cntr += 1
            number /= 5
        }
    }
    return cntr
}
print(minSplit(amount:9))
print(minSplit(amount:26))
print(minSplit(amount:172))
print(sumOfDigits(start:7,end:8))
print(sumOfDigits(start:17,end:20))
print(sumOfDigits(start:10,end:12))
print(isProperly(sequence: "(()())"))
print(isProperly(sequence: ")(()"))
print(isProperly(sequence: "(()())("))
print(countWays(n: 3, steps: [0, 1, 0]))
print(countWays(n: 4, steps: [0, 1, 1, 0]))
print(countWays(n: 5, steps: [1, 1, 0, 1, 1]))
print(zeros(N: 7))
print(zeros(N: 12))
print(zeros(N: 490))
