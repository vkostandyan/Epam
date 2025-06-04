import Foundation

protocol Borrowable {
    var borrowDate: Date? { get set }
    var returnDate: Date? { get set }
    var isBorrowed: Bool { get set }

    func isOverdue() -> Bool
    mutating func checkIn()
}

extension Borrowable {
    func isOverdue() -> Bool {
        guard let returnDate = returnDate else { return false }
        return Date() > returnDate
    }

    mutating func checkIn() {
        borrowDate = nil
        returnDate = nil
        isBorrowed = false
        print("Item checked in successfully.")
    }
}

class Item {
    let id: String
    let title: String
    let author: String

    init(id: String, title: String, author: String) {
        self.id = id
        self.title = title
        self.author = author
    }
}

class Book: Item, Borrowable {
    var borrowDate: Date?
    var returnDate: Date?
    var isBorrowed: Bool = false
}

enum LibraryError: Error {
    case itemNotFound
    case itemNotBorrowable
    case alreadyBorrowed
}

class Library {
    private var items: [String: Item] = [:]

    func addBook(_ book: Book) {
        items[book.id] = book
    }

    func borrowItem(by id: String) throws -> Item {
        guard let item = items[id] else {
            throw LibraryError.itemNotFound
        }

        guard var borrowableItem = item as? Borrowable else {
            throw LibraryError.itemNotBorrowable
        }

        guard !borrowableItem.isBorrowed else {
            throw LibraryError.alreadyBorrowed
        }

        borrowableItem.borrowDate = Date()
        borrowableItem.returnDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
        borrowableItem.isBorrowed = true

        if let book = item as? Book {
            book.borrowDate = borrowableItem.borrowDate
            book.returnDate = borrowableItem.returnDate
            book.isBorrowed = true
            items[id] = book
        }

        print("Item '\(item.title)' borrowed successfully.")
        return item
    }
}


