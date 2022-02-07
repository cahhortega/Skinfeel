//
//  Products+CoreDataProperties.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 31/01/22.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var nome: String?
    @NSManaged public var hidratacaoProd: Hidratacao?
    @NSManaged public var limpezaProd: Limpeza?
    @NSManaged public var protecaoProd: Protecao?

}

extension Products : Identifiable {

}
