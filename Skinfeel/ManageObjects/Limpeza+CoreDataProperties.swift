//
//  Limpeza+CoreDataProperties.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 31/01/22.
//
//

import Foundation
import CoreData


extension Limpeza {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Limpeza> {
        return NSFetchRequest<Limpeza>(entityName: "Limpeza")
    }

    @NSManaged public var periodo: Int32
    @NSManaged public var produto: NSSet?
    @NSManaged public var task: Task?

}

// MARK: Generated accessors for produto
extension Limpeza {

    @objc(addProdutoObject:)
    @NSManaged public func addToProduto(_ value: Products)

    @objc(removeProdutoObject:)
    @NSManaged public func removeFromProduto(_ value: Products)

    @objc(addProduto:)
    @NSManaged public func addToProduto(_ values: NSSet)

    @objc(removeProduto:)
    @NSManaged public func removeFromProduto(_ values: NSSet)

}

extension Limpeza : Identifiable {

}
