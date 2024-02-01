//
//  ToDoManager.swift
//  ToDoList
//
//  Created by 박민정 on 1/23/24.
//

import Foundation

//todo에 대한 CRUD 관리하는 매니저 (읽기, 저장, 수정, 삭제)
final class ToDoManager {
    
    //싱글톤 형태
    static var shared: ToDoManager = .init()
    //데이터 저장에 사용되는 키 지정
    private let key = "ToDoList"
    
    private init() { }
    
    //R와 C와 결합된 형태의 데이터 설정
    var datas: [TODO] {
        //R
        get {
            if let savedData = UserDefaults.standard.data(forKey: key),
               let decodedData = try? JSONDecoder().decode([TODO].self, from: savedData) {
                return decodedData
            }
            return []
        }
        //C -> 데이터에 저장된 값들
        set {
            if let encodedData = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encodedData, forKey: key)
            }
        }
    }
    
    //카테고리에 따라서 불러오기
    func readAllAndCategorize() -> [String: [TODO]] {
        let todoList = datas
        return Dictionary(grouping: todoList) {todo in
            todo.section
        }
    }
    
    //U
    func add(_ todo: TODO) {
        
        var todoList = datas
        
        todoList.append(todo)
        
        guard let data = try?
                JSONEncoder().encode(todoList)
        else{
            return
        }
        
        UserDefaults.standard.setValue(data, forKey: key)
    }
    
    func update(todoId: Int, isComplete: Bool? = nil) {
        
        var todoList = datas
        
        guard let targetIndex = todoList.firstIndex(where: { $0.id == todoId })
        else {
            return
        }
        
        if let newIsComplete = isComplete {
            todoList[targetIndex].isComplete = newIsComplete
        }
    }
    
    //D
    func delete(todoid: Int) {
        
        var todoList = datas
        
        todoList.removeAll { data in
            data.id == todoid
        }
        
        //TODO 지워진 상태
        guard let data = try?
                JSONEncoder().encode(todoList)
        else{
            return
        }
        UserDefaults.standard.setValue(data, forKey: key)
    }
}

