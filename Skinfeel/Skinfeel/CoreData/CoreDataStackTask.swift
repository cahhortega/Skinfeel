//
//  CoreDataStackTask.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 31/01/22.
//

import Foundation
import CoreData

class CoreDataStackTask{
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
    
    static func createTask() throws ->Task{
        guard let task = NSEntityDescription.insertNewObject(forEntityName: "Task", into: context) as? Task else {preconditionFailure()}
        
        try saveContext()
        return task
    }
    
    static func getTask() throws -> [Task] {
        return try context.fetch(Task.fetchRequest())
    }
    
    static func deleteTask(task: Task) throws{
        context.delete(task)
        try saveContext()
    }
    
}
