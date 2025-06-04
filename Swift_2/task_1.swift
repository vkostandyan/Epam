import Foundation


struct User {
    let username: String
    let email: String
    let passwordHash: String

    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.passwordHash = User.hash(password: password)
    }

    static func hash(password: String) -> String {
        return String(password.reversed())
    }

    func verifyPassword(_ password: String) -> Bool {
        return User.hash(password: password) == passwordHash
    }
}

class UserManager {
    public var users: [String: User] = [:]

    var userCount: Int {
        return users.count
    }

    func registerUser(username: String, email: String, password: String) -> Bool {
        guard users[username] == nil else {
            print("Registration failed: Username already exists.")
            return false
        }

        let newUser = User(username: username, email: email, password: password)
        users[username] = newUser
        print("User '\(username)' registered successfully.")
        return true
    }

    func login(username: String, password: String) -> Bool {
        guard let user = users[username] else {
            print("Login failed: User not found.")
            return false
        }

        if user.verifyPassword(password) {
            print("User '\(username)' logged in successfully.")
            return true
        } else {
            print("Login failed: Incorrect password.")
            return false
        }
    }

    func removeUser(username: String) -> Bool {
        if users.removeValue(forKey: username) != nil {
            print("User '\(username)' removed successfully.")
            return true
        } else {
            print("Remove failed: User not found.")
            return false
        }
    }
}

class AdminUser: UserManager {
    func listAllUsers() -> [String] {
        return users.keys.map { $0 }
    }

    deinit {
        print("AdminUser instance deinitialized.")
    }
}
