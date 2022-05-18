//
//  Trip+CoreDataProperties.swift
//  Trippie
//
//  Created by Thiele Oliveira on 18/05/22.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var arrivalDate: Date?
    @NSManaged public var checkoutDate: Date?
    @NSManaged public var city: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var thumbnail: String?
    @NSManaged public var todoList: NSSet?

}

// MARK: Generated accessors for todoList
extension Trip {

    @objc(addTodoListObject:)
    @NSManaged public func addToTodoList(_ value: TodoList)

    @objc(removeTodoListObject:)
    @NSManaged public func removeFromTodoList(_ value: TodoList)

    @objc(addTodoList:)
    @NSManaged public func addToTodoList(_ values: NSSet)

    @objc(removeTodoList:)
    @NSManaged public func removeFromTodoList(_ values: NSSet)

}

extension Trip : Identifiable {

}
