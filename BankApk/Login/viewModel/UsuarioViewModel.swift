//
//  UsuarioViewModel.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 01/05/21.
//

import Foundation



struct UsuarioView {
    
    var id:String = " "
    var name:String = " "
    var email:String = " "
    var conta:String = " "
    var saldo:String = " "
    var token:String = " "
    
}

class UsuarioViewModel {
    
    
    static func save(_ usuario:UsuarioModel){
        self.removeUser()
        try? uiRealm.write{
            uiRealm.add(usuario,update: .modified)
        }
    }
    
    static func removeUser(){
        let objects = uiRealm.objects(UsuarioModel.self)
        
        try? uiRealm.write{
            uiRealm.delete(objects)
        }
        
    }
    
    static func getAsView(_ usuario:UsuarioModel?) -> UsuarioView{
        guard let usuario = usuario else{ return UsuarioView() }
        
        var usuarioView = UsuarioView()
        
        usuarioView.id = usuario.id ?? ""
        usuarioView.name = usuario.name
         ?? ""
        usuarioView.email = usuario.email ?? ""
        usuarioView.saldo = usuario.saldo ?? ""
        usuarioView.conta = usuario.conta ?? ""
        usuarioView.token = usuario.token ?? ""
        
        return usuarioView
    }
    
    static func getAsView(sequence: [UsuarioModel] ) -> [UsuarioView]{
        var usuarios: [UsuarioView] = []
        
        sequence.forEach { (usuario) in
            usuarios.append(self.getAsView(usuario))
        }
        return usuarios
    }
    
    static func get() -> [UsuarioModel]{
        let result = uiRealm.objects(UsuarioModel.self)
        var usuarios: [UsuarioModel] = []
        usuarios.append(contentsOf: result)
        return usuarios
    }
    
    static func getView() -> [UsuarioView]{
        return self.getAsView(sequence: self.get())
    }
    
    static func getUsuario() -> UsuarioModel?{
        return uiRealm.objects(UsuarioModel.self).first
    }
    
    static func getUsuarioView() -> UsuarioView{
        return self.getAsView(self.getUsuario())
    }
    
    static func removeAll(){
        try? uiRealm.write{
            uiRealm.deleteAll()
        }
    }
}
