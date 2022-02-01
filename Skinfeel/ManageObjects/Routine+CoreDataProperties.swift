//
//  Routine+CoreDataProperties.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 01/02/22.
//
//

import Foundation
import CoreData


extension Routine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Routine> {
        return NSFetchRequest<Routine>(entityName: "Routine")
    }

    @NSManaged public var dateEnd: Date?
    @NSManaged public var dateStart: Date?
    @NSManaged public var dom: Bool
    @NSManaged public var qua: Bool
    @NSManaged public var qui: Bool
    @NSManaged public var routineName: String?
    @NSManaged public var sab: Bool
    @NSManaged public var seg: Bool
    @NSManaged public var sex: Bool 
    @NSManaged public var ter: Bool
    @NSManaged public var task: Task?

}

extension Routine : Identifiable {

}
