//
//  HeaderView.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 02/05/21.
//

import UIKit
import Reusable
class HeaderView: UIView ,NibOwnerLoadable{
    
    @IBOutlet weak var lbNome: UILabel!
  
    @IBOutlet weak var lbConta: UILabel!
    
    @IBOutlet weak var lbSaldo: UILabel!
    
    let lista = StoryboardScene.Main.listagemViewController.instantiate()
    
    
    @IBAction func bntClose(_ sender: UIButton) {
        
       //Esqueci de fazer a rota de logout na API por isso o logout vai ser removendo tudo.
        UsuarioViewModel.removeAll()
        SessionControll.shared.setupInvalidHeader()
        exit(0)
    
    }
    
    override func awakeFromNib() {
       
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.awakeFromNib()
        self.loadNibContent()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func bind(usuario:UsuarioView){
        self.lbNome.text = usuario.name
        self.lbConta.text = usuario.conta
        self.lbSaldo.text = usuario.saldo
        
        
    }
    
}
