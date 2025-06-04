import Foundation

public func isPalindrome(input: String) -> Bool {
    let length = input.count
    if length <= 1 {
        return false
    }
    
    let chars = input.lowercased().map { $0 }
    
    var filteredChars: [Character] = []
    
    for char in chars {
        if char.isLetter || char.isNumber {
            filteredChars.append(char)
        }
    }
    
    if filteredChars.count <= 1 {
        return false
    }
    
    var left = 0
    var right = filteredChars.count - 1
    
    while left < right {
        if filteredChars[left] != filteredChars[right] {
            return false
        }
        left += 1
        right -= 1
    }
    
    return true
}