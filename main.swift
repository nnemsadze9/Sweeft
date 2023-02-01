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
print(minSplit(amount:172))
print(minSplit(amount:172))
print(minSplit(amount:172))
