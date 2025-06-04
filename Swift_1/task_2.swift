import Foundation

public func isBalancedParentheses(input: String) -> Bool {
    let leftCount = input.filter { $0 == "(" }.count
    let rightCount = input.filter { $0 == ")" }.count
    if leftCount != rightCount {
        return false
    }
    
    var stack = [Character]()
    for char in input {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            }
            stack.removeLast()
        }
    }
    
    return stack.isEmpty
}