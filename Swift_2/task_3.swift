class Person {
    var name: String
    var age: Int

    static let minAgeForEnrollment = 16
    var isAdult: Bool {
        return age >= 18
    }
    lazy var profileDescription: String = {
        return "\(name) is \(age) years old."
    }()

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    init?(name: String, age: Int, checkAge: Bool) {
        guard age >= Person.minAgeForEnrollment else {
            print("Failed: \(name) is too young to enroll.")
            return nil
        }
        self.name = name
        self.age = age
    }
}

class Student: Person {
    static var studentCount = 0

    var studentID: String
    var major: String

    weak var advisor: Professor?

    var formattedID: String {
        return "ID: \(studentID.uppercased())"
    }
    required init(name: String, age: Int, studentID: String, major: String) {
        self.studentID = studentID
        self.major = major
        super.init(name: name, age: age)
        Student.studentCount += 1
    }

    convenience init(studentID: String) {
        self.init(name: "Unnamed", age: 18, studentID: studentID, major: "Undeclared")
    }

    deinit {
        Student.studentCount -= 1
        print("Student \(name) deinitialized")
    }
}

class Professor: Person {
    static var professorCount = 0

    var faculty: String
    var fullTitle: String {
        return "Prof. \(name), Faculty of \(faculty)"
    }
    init(name: String, age: Int, faculty: String) {
        self.faculty = faculty
        super.init(name: name, age: age)
        Professor.professorCount += 1
    }

    deinit {
        Professor.professorCount -= 1
        print("Professor \(name) deinitialized")
    }
}


struct University {
    var name: String
    var location: String
    var description: String {
        return "University '\(name)' located in \(location)"
    }
}
