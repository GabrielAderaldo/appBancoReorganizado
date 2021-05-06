//
//  SessionControll.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 28/04/21.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class SessionControll{
    
    static var shared = SessionControll()
    
    var headers: HTTPHeaders = ["token":""]
    
    var headersBeared: HTTPHeaders = ["authorization":"Bearer "]
    
    
    
    init() {}
    var usuario: UsuarioView? {
        return UsuarioViewModel.getUsuarioView()
    }
    
   
    
    var usuarioModel: UsuarioModel?{
        return UsuarioViewModel.getUsuario()
    }
    
    
    var isAtivo:Bool{
        return usuarioModel != nil
    }
  
    var isConnected:Bool{
        return NetworkReachabilityManager()?.isReachable ?? true
    }
    
    func setupInvalidHeader(){
        self.headers["token"] = ""
    }
    
    func setupHeaders(){
        if let token = self.usuarioModel?.token{
            self.headers["token"] = token
        }
    }
    
    func setupHeadersBearer(){
        if let token = self.usuarioModel?.token{
            self.headersBeared["authorization"] = "Bearer \(token)"
        }
    }
   
    
    
}
