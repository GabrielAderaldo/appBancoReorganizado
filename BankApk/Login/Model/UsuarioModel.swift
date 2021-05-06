//
//  UsuarioModel.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 30/04/21.
//

import Foundation
import RealmSwift
import ObjectMapper

class UsuarioModel:Object,Mappable {
 
    @objc dynamic var id:String?
    @objc dynamic var name:String?
    @objc dynamic var email:String?
    @objc dynamic var conta:String?
    @objc dynamic var saldo:String?
    @objc dynamic var token:String?
    
    
    required convenience init(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        self.id <- map["Usuario._id"]
        self.name <- map["Usuario.name"]
        self.email <- map["Usuario.email"]
        self.conta <- map["Usuario.conta"]
        self.saldo <- map["Usuario.saldo"]
        self.token <- map["Token"]
    }
}
