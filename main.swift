  //Task1
  print("Task 1: ")
  print(lengthOfLongestSubstring("abcabcbb"))
  print(lengthOfLongestSubstring("bbbbb"))
  
  //Task2
  print("Task 2: ")
  print(minWindow("ADOBECODEBANC","ABC"))
  print(minWindow("a","aa"))
  
  //Task3 
  print("Task 3: ")
  print(wordBreak("leetcode", ["leet", "code"]))
  print(wordBreak("applepenapple",["apple", "pen"]))

  //Task4
  print("Task 4: ")
  print(topKFrequent([1,1,1,2,2,3],2))
  print(topKFrequent([1], 1))
  
  //Task5
  print("Task 5: ")
  print(minMeetingRooms([[0, 30],[5, 10],[15, 20]]))
  print(minMeetingRooms([[7,10],[2,4]]))
  
  
  //Task1
  func lengthOfLongestSubstring(_ s: String) -> Int {
        var i = 0, j = 0, longest = 0
        var charCount = [Character : Int]()
        let characters = Array(s)

        while j < characters.count {
            let char = characters[j]
            if let lastIndex = charCount[char] { 
                i = max(i, lastIndex + 1)
            }
            charCount[char] = j 
            longest = max(longest, j - i + 1)
            
            j += 1
        }
        return longest
    }
  
  //Task2
  func minWindow(_ s: String, _ t: String) -> String {
            if s.isEmpty || t.isEmpty {
            return ""
        }

        var dictT = [Character: Int]()
        for c in t {
            dictT[c, default: 0] += 1
        }

        let required = dictT.count
        var l = 0, r = 0
        var formed = 0
        var windowCounts = [Character: Int]()
        var ans = [-1, 0, 0]

        let sArray = Array(s)

        while r < sArray.count {
            let c = sArray[r]
            windowCounts[c, default: 0] += 1

            if let count = dictT[c], windowCounts[c] == count {
                formed += 1
            }

            while l <= r, formed == required {
                let c = sArray[l]

                if ans[0] == -1 || r - l + 1 < ans[0] {
                    ans[0] = r - l + 1
                    ans[1] = l
                    ans[2] = r
                }

                windowCounts[c]! -= 1
                if let count = dictT[c], windowCounts[c]! < count {
                    formed -= 1
                }

                l += 1
            }

            r += 1
        }

        return ans[0] == -1 ? "" : String(sArray[ans[1]...ans[2]])
    }
    
    
    //Task3
  func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let n = s.count
    var dp = [Bool](repeating: false, count: n + 1)
    dp[0] = true
    var maxLen = 0
    for word in wordDict {
        maxLen = max(maxLen, word.count)
    }

    for i in 1...n {
        for j in stride(from: i - 1, through: max(i - maxLen - 1, 0), by: -1) {
           let substring = String(s[s.index(s.startIndex, offsetBy: j)..<s.index(s.startIndex, offsetBy: i)])
            if dp[j] && wordDict.contains(substring) {
                dp[i] = true
                break
            }
        }
    }

    return dp[n] 
    }
    
    
    //Task4
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var ans = [Int](repeating: 0, count: k)
        var map = [Int: Int]()
        var bucket = [Set<Int>?](repeating: nil, count: nums.count + 1)

        for num in nums {
            map[num, default: 0] += 1
        }

        for (key, value) in map {
            if bucket[value] == nil {
                bucket[value] = Set<Int>()
            }
            bucket[value]?.insert(key)
        }

        var index = 0
        for j in (0...nums.count).reversed() {
            if let b = bucket[j] {
                for val in b {
                    ans[index] = val
                    index += 1
                    if index == k {
                        return ans
                    }
                }
            }
        }
        return ans
    }
    
    
    //Task5
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    let n = 1000000
    var delta = [Int](repeating: 0, count: n)
    
    for e in intervals {
        delta[e[0]] += 1
        delta[e[1]] -= 1
    }
    
    var res = delta[0]
    
    for i in 1..<n {
        delta[i] += delta[i - 1]
        res = max(res, delta[i])
    }
    
    return res
}
