import Cocoa

/*
 121. Best Time to Buy and Sell Stock
 
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

  

 Example 1:
 Input: prices = [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
 
 Example 2:
 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transactions are done and the max profit = 0.
 */



/*
 Solution1
 
 Time: O(n)
 Space: O(1)
 */
class Solution1 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count >= 2 else { return 0 }

        var maxProfit = 0
        var leftPointer = 0
        var rightPointer = 1

        while rightPointer < prices.count {
            let leftValue = prices[leftPointer]
            let rightValue = prices[rightPointer]
            let currentProfit = prices[rightPointer] - prices[leftPointer]

            if leftValue > rightValue {
                leftPointer = rightPointer
            }

            if currentProfit > maxProfit {
                maxProfit = currentProfit
            }

            rightPointer += 1
        }

        return maxProfit
    }
}

let solution1 = Solution1()
solution1.maxProfit([7,1,5,3,6,4])
solution1.maxProfit([7,1,5,3,8,4])
solution1.maxProfit([7,2,5,3,9,4])
solution1.maxProfit([7,6,4,3,1])



/*
 Solution2
 
 Time: O(n^2)
 Space: O(1)
 */
class Solution2 {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        
        for (i, iv) in prices.enumerated() {
            for (j, jv) in prices.enumerated() {
                if j <= i { continue }
                
                let profit = jv - iv
                
                if profit > maxProfit {
                    maxProfit = profit
                }
            }
        }
        
        return maxProfit
    }
}

let solution2 = Solution2()
solution2.maxProfit([7,1,5,3,6,4])
solution2.maxProfit([7,1,5,3,8,4])
solution2.maxProfit([7,2,5,3,9,4])
solution2.maxProfit([7,6,4,3,1])


