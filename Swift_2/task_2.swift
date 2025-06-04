class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    init?(name: String, age: Int, checkAge: Bool) {
        guard age >= 16 else {
            print("Initialization failed: age must be at least 16.")
            return nil
        }
        self.name = name
        self.age = age
    }
}

class Student: Person {
    var studentID: String
    var major: String

    required init(name: String, age: Int, studentID: String, major: String) {
        self.studentID = studentID
        self.major = major
        super.init(name: name, age: age)
    }

    convenience init(studentID: String) {
        self.init(name: "Unknown", age: 18, studentID: studentID, major: "Undeclared")
    }
}

class Professor: Person {
    var faculty: String

    init(name: String, age: Int, faculty: String) {
        self.faculty = faculty
        super.init(name: name, age: age)
    }
}

struct University {
    var name: String
    var location: String
}



