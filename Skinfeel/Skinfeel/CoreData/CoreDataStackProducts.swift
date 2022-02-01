//
//  CoreDataStackProducts.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 31/01/22.
//

import Foundation
import CoreData

class CoreDataStackProducts{
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
    
    static func createProducts(nome: String) throws -> Products{
        guard let products = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context) as? Products else {preconditionFailure()}
        
        products.nome = nome
        
        try saveContext()
        return products
    }
    
    static func getProducts() throws -> [Products] {
        return try context.fetch(Products.fetchRequest())
    }
    
    static func deleteProducts(products: Products) throws{
        context.delete(products)
        try saveContext()
    }

    
}
