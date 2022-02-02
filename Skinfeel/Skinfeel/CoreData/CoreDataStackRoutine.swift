//
//  CoreDataStack.swift
//  Skincare
//
//  Created by Carolina Ortega on 14/12/21.
//
//
import Foundation
import CoreData

class CoreDataStackRoutine{
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
    
    static func createRoutine(dateStart: Date, dateEnd: Date, dom: Bool, sab: Bool, sex: Bool, qui: Bool, qua:Bool, ter:Bool, seg:Bool, routineName:String, protecaomanha: [String], protecaotarde: [String], protecaonoite: [String], limpezamanha: [String], limpezanoite: [String], hidratacaomanha: [String], esfoliacaonoite: [String]) throws -> Routine{
        guard let routine = NSEntityDescription.insertNewObject(forEntityName: "Routine", into: context) as? Routine else {preconditionFailure()}
        routine.dateStart = dateStart
        routine.dateEnd = dateEnd
        routine.dom = dom
        routine.sab = sab
        routine.sex = sex
        routine.qui = qui
        routine.qua = qua
        routine.ter = ter
        routine.seg = seg
        routine.routineName = routineName
        routine.protecaomanha = protecaomanha
        routine.protecaotarde = protecaotarde
        routine.protecaonoite = protecaonoite
        routine.limpezamanha = limpezamanha
        routine.limpezanoite = limpezanoite
        routine.hidratacaomanha = hidratacaomanha
        routine.esfoliacaonoite = esfoliacaonoite
        
        try saveContext()
        return routine
    }
    
    static func getRoutine() throws -> [Routine] {
        return try context.fetch(Routine.fetchRequest())
    }
    
    static func deleteRoutine(routine: Routine) throws{
        context.delete(routine)
        try saveContext()
    }
    
}
