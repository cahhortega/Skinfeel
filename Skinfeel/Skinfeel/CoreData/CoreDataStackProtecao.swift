//
//  CoreDataStackProtecao.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 31/01/22.
//

import Foundation
import CoreData

class CoreDataStackProtecao{
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
    
    static func createProtecao(periodo:Int32, produtos: Products) throws -> Protecao{
        guard let protecao = NSEntityDescription.insertNewObject(forEntityName: "Protecao", into: context) as? Protecao else {preconditionFailure()}
        
        protecao.periodo = periodo
        protecao.addToProduto(produtos)
        
        try saveContext()
        return protecao
    }
    
    static func getProtecao() throws -> [Protecao] {
        return try context.fetch(Protecao.fetchRequest())
    }
    
    static func deleteProtecao(protecao: Protecao) throws{
        context.delete(protecao)
        try saveContext()
    }
   
    

}
