/**

Design an algorithm to encode a list of strings to a single string. 
The encoded string is then decoded back to the original list of strings.

Please implement encode and decode

Example 1:

Input: ["neet","code","love","you"]
Output:["neet","code","love","you"]

Example 2:

Input: ["we","say",":","yes"]
Output: ["we","say",":","yes"]

**/



func encode(_ list: [String]) -> String {
    var encodedString = ""

    for s in list {
        encodedString += "#\(s.count)" + s
    }
    
    return encodedString
}

func decode(_ s: String) -> [String] {
    var decodedArray = [String]()
    let list = Array(s)
    var d = ""

    for i in 0..<list.count {
        if list[i] == "#" {
            d = "#"
            continue
        }

        if let number = Int(String(list[i])), d == "#" {
            let word = s.dropFirst(i+1).prefix(number)
            decodedArray.append(String(word))
        }
    }

    return decodedArray
}

let input = ["apple","banana","car","blue", "world"]
let e = encode(input)


print(encode(input))
print(decode(e))
