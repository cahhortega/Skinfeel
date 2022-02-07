//
//  Task+CoreDataProperties.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 31/01/22.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var hidratacao: NSSet?
    @NSManaged public var limpeza: NSSet?
    @NSManaged public var protecao: NSSet?
    @NSManaged public var routine: Routine?

}

// MARK: Generated accessors for hidratacao
extension Task {

    @objc(addHidratacaoObject:)
    @NSManaged public func addToHidratacao(_ value: Hidratacao)

    @objc(removeHidratacaoObject:)
    @NSManaged public func removeFromHidratacao(_ value: Hidratacao)

    @objc(addHidratacao:)
    @NSManaged public func addToHidratacao(_ values: NSSet)

    @objc(removeHidratacao:)
    @NSManaged public func removeFromHidratacao(_ values: NSSet)

}

// MARK: Generated accessors for limpeza
extension Task {

    @objc(addLimpezaObject:)
    @NSManaged public func addToLimpeza(_ value: Limpeza)

    @objc(removeLimpezaObject:)
    @NSManaged public func removeFromLimpeza(_ value: Limpeza)

    @objc(addLimpeza:)
    @NSManaged public func addToLimpeza(_ values: NSSet)

    @objc(removeLimpeza:)
    @NSManaged public func removeFromLimpeza(_ values: NSSet)

}

// MARK: Generated accessors for protecao
extension Task {

    @objc(addProtecaoObject:)
    @NSManaged public func addToProtecao(_ value: Protecao)

    @objc(removeProtecaoObject:)
    @NSManaged public func removeFromProtecao(_ value: Protecao)

    @objc(addProtecao:)
    @NSManaged public func addToProtecao(_ values: NSSet)

    @objc(removeProtecao:)
    @NSManaged public func removeFromProtecao(_ values: NSSet)

}

extension Task : Identifiable {

}
