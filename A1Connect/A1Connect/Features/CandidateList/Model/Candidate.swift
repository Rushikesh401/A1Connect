//
//  Candidate.swift
//  A1Connect
//
//  Created by Rushikesh Suradkar on 22/09/25.
//

import Foundation

struct Candidate: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let email: String
    let age: Int
    let dob: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case name, email, age, dob
        case imageURL = "image"
    }
}

// mock data for UI development
extension Candidate {
    static let mock = Candidate(
        name: "Darla Morar",
        email: "Jo.Goodwin43@gmail.com",
        age: 46,
        dob: "1988-10-31",
        imageURL: "https://avatars.githubusercontent.com/u/46814303"
    )

    static let mockData = [
        Candidate(name: "Lucas Blanda PhD", email: "Chelsea79@hotmail.com", age: 46, dob: "1950-09-15", imageURL: "https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/female/512/41.jpg"),
        Candidate(name: "Darla Morar", email: "Jo.Goodwin43@gmail.com", age: 46, dob: "1988-10-31", imageURL: "https://avatars.githubusercontent.com/u/46814303"),
        Candidate(name: "Roy Osinski", email: "Trever_Zemlak@yahoo.com", age: 40, dob: "1979-05-19", imageURL: "https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/male/512/7.jpg"),
        Candidate(name: "Miss Hazel Hilpert", email: "Kobe82@hotmail.com", age: 67, dob: "1969-12-28", imageURL: "https://avatars.githubusercontent.com/u/62831508"),
        Candidate(name: "Harvey McClure", email: "Delilah.Bradtke@hotmail.com", age: 33, dob: "1970-01-25", imageURL: "https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/male/512/63.jpg")
    ]
}
