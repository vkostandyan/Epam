class Stack<T> {
    private var elements: [T] = []
    
    func push(_ element: T) {
        elements.append(element)
    }
    
    func pop() -> T? {
        return elements.popLast()
    }
    
    func size() -> Int {
        return elements.count
    }
    func printStackContents() -> String {
        return elements.map { "\($0)" }.joined(separator: ", ")
    }
}
