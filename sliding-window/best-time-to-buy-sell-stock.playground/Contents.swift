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
        var maxProfitValue = 0
        var startIndex = 0
        var endIndex = prices.count-1
        
        while startIndex < endIndex {
            let profit = prices[endIndex] - prices[startIndex]
            
            if profit > maxProfitValue {
                maxProfitValue = profit
            }
            
            startIndex += 1
            endIndex -= 1
        }
        
        return maxProfitValue
    }
}

let solution1 = Solution1()
solution1.maxProfit([7,1,5,3,6,4])
solution1.maxProfit([7,1,5,3,8,4])
solution1.maxProfit([7,2,5,3,9,4])
solution1.maxProfit([7,6,4,3,1])
