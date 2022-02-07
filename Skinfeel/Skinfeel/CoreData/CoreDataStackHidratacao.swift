//
//  CoreDataStackHidratacao.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 31/01/22.
//

import Foundation
import CoreData

class CoreDataStackHidratacao{
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
    
    static func createHidratacao(periodo: Int32) throws -> Hidratacao{
        guard let hidratacao = NSEntityDescription.insertNewObject(forEntityName: "Hidratacao", into: context) as? Hidratacao else {preconditionFailure()}
       
        hidratacao.periodo = periodo
        
        try saveContext()
        return hidratacao
    }
    
    static func getHidratacao() throws -> [Hidratacao] {
        return try context.fetch(Hidratacao.fetchRequest())
    }
    
    static func deleteHidratacao(hidratacao: Hidratacao) throws{
        context.delete(hidratacao)
        try saveContext()
    }
    
}
