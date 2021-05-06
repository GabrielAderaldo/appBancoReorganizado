//
//  AuthService.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 28/04/21.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class AuthService{
    
    var loginRequest:Request?
    var listarContatoRequest:Request?
    
    
    var delegate:ServiceDelegate?
    
    init(delegate: ServiceDelegate) {
        self.delegate = delegate
    }

    func login(email:String,senha:String){
        self.loginRequest?.cancel()
        
        self.loginRequest = AuthRequestFactory.login(email: email, senha: senha).validate().responseObject(completionHandler: { (response: DataResponse<UsuarioModel>) in
            
            switch response.result{
            
            case .success:
                if let usuario = response.value{
                    UsuarioViewModel.save(usuario)
                    SessionControll.shared.setupHeaders()
                }
                self.delegate?.sucess(type: .login)
                
            case .failure:
                self.delegate?.failure(type: .login, error: "")
            }
        })
    }
    
    func listarConta(){
        
        self.listarContatoRequest?.cancel()
        self.listarContatoRequest = AuthRequestFactory.listar().validate().responseArray(keyPath:"Contas",completionHandler: { (response:DataResponse<[Conta]>) in
            switch response.result{
            
            case .success:
                if let conta = response.value{
                    ContaViewModel.save(conta)
                }
                self.delegate?.sucess(type: .listagem)
                
            case .failure(let error):
                self.delegate?.failure(type: .listagem, error: error.localizedDescription)
            }
        })
}

}
