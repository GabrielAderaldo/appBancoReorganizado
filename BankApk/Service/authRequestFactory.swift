//
//  authRequestFactory.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 28/04/21.
//

import Foundation
import Alamofire

class AuthRequestFactory{

    
    static func login(email:String,senha:String) -> DataRequest{
        let params:Parameters = ["email":email,"password":senha]
        
        return Alamofire.request("http://bancoapiselecao-net.umbler.net/auth/login",method: .post,parameters: params,encoding: JSONEncoding.default)
        
    }
    
    static func listar() -> DataRequest{
        var headers = ["":""]
        if let token = SessionControll.shared.usuario?.token{
            headers = ["authorization":"Bearer \(token)"]
            
        }
        return Alamofire.request("http://bancoapiselecao-net.umbler.net/user/", method: .get,  encoding: JSONEncoding.default, headers: headers)
    }
   
}
