//
//  ToDo.swift
//  ToDoList
//
//  Created by 박민정 on 1/23/24.
//

import Foundation

//TODO 구조
struct TODO : Codable {
    var id : Int
    var description : String
    var date : String
    var isComplete : Bool
    var section : String
}

//TODO 값 초기 세팅해주는 init
extension TODO {
    init(description: String, date: String, section: String) {
        self.id = UUID().hashValue
        self.description = description
        self.date = date
        self.isComplete = false
        self.section = section
    }
}
