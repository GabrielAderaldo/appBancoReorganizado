//
//  Contato.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 03/05/21.
//

import Foundation
import RealmSwift
import ObjectMapper


class Conta: Object, Mappable{
    
    @objc dynamic var id: String?
    @objc dynamic var nome: String?
    @objc dynamic var data: String?
    @objc dynamic var valor: String?
    @objc dynamic var userId: String?
    @objc dynamic var horaPostagem: String?
    
    required convenience init(map:Map){
        self.init()
    }
    
    override class func primaryKey() -> String?{
        return "id"
    }
    
    func mapping(map:Map){
        self.id <- map["_id"]
        self.nome <- map["nome"]
        self.data <- map["data"]
        self.valor <- map["valor"]
        self.userId <- map["user"]
        self.horaPostagem <- map["createdAt"]
    }
    
}
