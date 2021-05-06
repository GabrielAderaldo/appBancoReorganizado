//
//  CintaView.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 03/05/21.
//

import Foundation


struct  ContaView {
    var id:String = ""
    var nome:String = ""
    var data:String = ""
    var valor:String = ""
    var idUsuario:String = ""
    var horaPostagem:String = ""
    
}

class ContaViewModel{
    static func save(_ conta: Conta){
        try? uiRealm.write{
            uiRealm.add(conta,update: .modified)
        }
    }
    
    static func save(_ contas:[Conta]){
        self.removeConta()
        try? uiRealm.write{
            uiRealm.add(contas,update: .modified)
        }
    }
    
    static func removeConta(){
        let objects = uiRealm.objects(Conta.self)
        
        try? uiRealm.write{
            uiRealm.delete(objects)
        }
    }
    
    static func getAsModel(_ contaView: ContaView) -> Conta{
        let conta = Conta()
        
        conta.id = contaView.id.isEmpty ? nil : contaView.id
        conta.nome = contaView.nome
        conta.data = contaView.data
        conta.valor = contaView.valor
        conta.userId = contaView.idUsuario
        conta.horaPostagem = contaView.horaPostagem
        
        return conta
    }
    
    static func getAsView(_ conta:Conta?) -> ContaView{
        guard let conta = conta else { return ContaView() }
        var contaView = ContaView()
        contaView.id = conta.id ?? ""
        contaView.nome = conta.nome ?? ""
        contaView.data = conta.data ?? ""
        contaView.valor = conta.valor ?? ""
        contaView.idUsuario = conta.userId ?? ""
        contaView.horaPostagem = contaView.horaPostagem ?? ""
        
        return contaView
    }
    
    
    static func getAsView(sequence:[Conta]) -> [ContaView]{
        var contas:[ContaView] = []
        
        sequence.forEach { (conta) in
            contas.append(self.getAsView(conta))
        }
        return contas
    }
    
    static func get() -> [Conta]{
        let results = uiRealm.objects(Conta.self)
        
        var contas:[Conta] = []
        contas.append(contentsOf: results)
        return contas
    }
    
    static func getViews() -> [ContaView]{
        return self.getAsView(sequence: self.get())
    }
    
    static func getConta() -> Conta?{
        return uiRealm.objects(Conta.self).first
    }
    
    static func getContaView() -> ContaView{
        return self.getAsView(self.getConta())
    }
    
    
    
}
