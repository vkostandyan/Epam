import Foundation

let books: [[String: Any]] = [
    ["title": "Swift Fundamentals", "author": "John Doe", "year": 2015, "price": 40, "genre": ["Programming", "Education"]],
    ["title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "year": 1925, "price": 15, "genre": ["Classic", "Drama"]],
    ["title": "Game of Thrones", "author": "George R. R. Martin", "year": 1996, "price": 30, "genre": ["Fantasy", "Epic"]],
    ["title": "Big Data, Big Dupe", "author": "Stephen Few", "year": 2018, "price": 25, "genre": ["Technology", "Non-Fiction"]],
    ["title": "To Kill a Mockingbird", "author": "Harper Lee", "year": 1960, "price": 20, "genre": ["Classic", "Drama"]]
]

let discountedPrices: [Double] = books.compactMap { dict in
    guard let price = dict["price"] as? Double ?? (dict["price"] as? Int).map(Double.init) else {
        return nil
    }
    return price * 0.9
}

let booksPostedAfter2000: [String] = books.compactMap { dict in
    if let year = dict["year"] as? Int, year > 2000 {
        return dict["title"] as? String
    }
    return nil
}

let allGenres: Set<String> = Set(books.flatMap { dict in
    dict["genre"] as? [String] ?? []
})
let totalCost: Int = books.reduce(0) { total, dict in
    let price = dict["price"] as? Int ?? 0
    return total + price
}
