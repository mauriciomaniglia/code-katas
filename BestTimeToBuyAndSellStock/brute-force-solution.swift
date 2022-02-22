// Time:  O(n ^ 2)
// Space: O(1)

func maxProfit(_ values: [Int]) -> Int {
	var maxProfit = 0
			
	for (index, value) in values.enumerated() {
		for (innerIndex, innerValue) in values.enumerated() {
			if (innerIndex <= index) { continue }
			var currentProfit = 0
	
			if innerValue > value {
				currentProfit = innerValue - value				
			}
			if currentProfit > maxProfit {
				maxProfit = currentProfit
			}
		}
	}

	return maxProfit
}

print(maxProfit([7,6,4,3,1]))
