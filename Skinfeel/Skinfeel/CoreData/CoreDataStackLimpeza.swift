//
//  CoreDataStackLimpeza.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 31/01/22.
//

import Foundation
import CoreData

class CoreDataStackLimpeza{
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { _, error in
            if let erro = error{
                preconditionFailure(erro.localizedDescription)
            }
            
        }
        return container
    }()
    
    static var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    static func saveContext() throws{
        if context.hasChanges{
            try context.save()
        }
    }
    
    static func createLimpeza(periodo: Int32, produtos: Products) throws -> Limpeza{
        guard let limpeza = NSEntityDescription.insertNewObject(forEntityName: "Limpeza", into: context) as? Limpeza else {preconditionFailure()}
        
        limpeza.periodo = periodo
        limpeza.addToProduto(produtos)
        
        try saveContext()
        return limpeza
    }
    
    static func getLimpeza() throws -> [Limpeza] {
        return try context.fetch(Limpeza.fetchRequest())
    }
    
    static func deleteLimpeza(limpeza: Limpeza) throws{
        context.delete(limpeza)
        try saveContext()
    }
    
    
}
