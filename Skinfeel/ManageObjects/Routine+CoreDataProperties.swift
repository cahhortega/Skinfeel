//
//  Routine+CoreDataProperties.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 02/02/22.
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
    @NSManaged public var protecaomanha: [String]?
    @NSManaged public var protecaonoite: [String]?
    @NSManaged public var hidratacaomanha: [String]?
    @NSManaged public var protecaotarde: [String]?
    @NSManaged public var esfoliacaonoite: [String]?
    @NSManaged public var limpezamanha: [String]?
    @NSManaged public var limpezanoite: [String]?

}

extension Routine : Identifiable {

}
