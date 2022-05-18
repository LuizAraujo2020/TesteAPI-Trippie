//
//  TodoItem+CoreDataProperties.swift
//  Trippie
//
//  Created by Thiele Oliveira on 18/05/22.
//
//

import Foundation
import CoreData


extension TodoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoItem> {
        return NSFetchRequest<TodoItem>(entityName: "TodoItem")
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var title: String?
    @NSManaged public var todoList: TodoList?

}

extension TodoItem : Identifiable {

}
