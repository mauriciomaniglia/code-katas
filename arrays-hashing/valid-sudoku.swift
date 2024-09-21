/** 

Valid Sudoku

You are given a a 9 x 9 Sudoku board board. A Sudoku board is valid if the following rules are followed:

- Each row must contain the digits 1-9 without duplicates.
- Each column must contain the digits 1-9 without duplicates.
- Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without duplicates.

Return true if the Sudoku board is valid, otherwise return false

Note: A board does not need to be full or be solvable to be valid.

Example 1: 

Input: board = 
[["1","2",".",".","3",".",".",".","."],
 ["4",".",".","5",".",".",".",".","."],
 [".","9","8",".",".",".",".",".","3"],
 ["5",".",".",".","6",".",".",".","4"],
 [".",".",".","8",".","3",".",".","5"],
 ["7",".",".",".","2",".",".",".","6"],
 [".",".",".",".",".",".","2",".","."],
 [".",".",".","4","1","9",".",".","8"],
 [".",".",".",".","8",".",".","7","9"]]

Output: true

Example 2:

Input: board = 
[["1","2",".",".","3",".",".",".","."],
 ["4",".",".","5",".",".",".",".","."],
 [".","9","1",".",".",".",".",".","3"],
 ["5",".",".",".","6",".",".",".","4"],
 [".",".",".","8",".","3",".",".","5"],
 ["7",".",".",".","2",".",".",".","6"],
 [".",".",".",".",".",".","2",".","."],
 [".",".",".","4","1","9",".",".","8"],
 [".",".",".",".","8",".",".","7","9"]]

Output: false
Explanation: There are two 1's in the top-left 3x3 sub-box.

**/

func isValidSudoku(_ board: [[Character]]) -> Bool {
    // Initialize dictionaries to store sets of numbers seen in each row, column, and sub-box.
    var rows = Array(repeating: Set<Character>(), count: 9)
    var columns = Array(repeating: Set<Character>(), count: 9)
    var boxes = Array(repeating: Set<Character>(), count: 9)

    // Iterate through the entire 9x9 Sudoku board
    for i in 0..<9 {
        for j in 0..<9 {
            let current = board[i][j]

            // Ignore empty cells
            if current == "." { 
                continue 
            }

            // Check if current number already exists in the row
            if rows[i].contains(current) {
                return false
            }
            
            // Check if the current number already exists in the column
            if columns[j].contains(current) {
                return false
            }

            // Determine the index of the sub-box using the formula (i / 3) * 3 + (j / 3)
            let boxIndex = (i / 3) * 3 + j / 3
            
            if boxes[boxIndex].contains(current) {
                return false
            }

            // Add the number to the respective row, column, and box sets
            rows[i].insert(current)
            columns[j].insert(current)
            boxes[boxIndex].insert(current)
        }
    }

    return true
}


let validSudokuBoard: [[Character]] = [
    ["5", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"]
]

print(isValidSudoku(validSudokuBoard))  // Output should be true


let invalidSudokuBoard: [[Character]] = [
    ["5", "3", ".", ".", "7", ".", ".", ".", "5"], // Invalid: Duplicate '5' in this row
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"]
]

print(isValidSudoku(invalidSudokuBoard))  // Output should be false
