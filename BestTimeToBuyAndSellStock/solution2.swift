// Time: O(n)
// Space: 0(1)

func maxProfit(_ values: [Int]) -> Int {
	guard values.count > 2 else {
		return 0
	}

	var buy = values[0]
	var sell = 0
	var maximumProfit = 0

	for (index, _) in values.enumerated() {
		if index+1 >= values.count { break }
		
		sell = values[index + 1]
		
		if buy < sell {
			let profit = sell - buy
			if profit > maximumProfit {
				maximumProfit = profit
			}
		} else {
			buy = sell
		}
	}

	return maximumProfit
}

print(maxProfit([7,1,5,3,6,4]))
print(maxProfit([7,6,4,3,1]))
