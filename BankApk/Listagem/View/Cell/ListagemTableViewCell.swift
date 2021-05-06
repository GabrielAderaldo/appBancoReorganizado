//
//  ListagemTableViewCell.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 02/05/21.
//

import UIKit
import Reusable
class ListagemTableViewCell: UITableViewCell,NibReusable {
    
    @IBOutlet weak var lbPreco: UILabel!
    
    @IBOutlet weak var lbData: UILabel!
    
    @IBOutlet weak var viewBackBround: UIView!
    @IBOutlet weak var lbNomeConta: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
           arrendondar(view: viewBackBround)
            sombra(view: viewBackBround, radius: 8)
    }
    
    func bind(nome:String,data:String,valor:String){
        lbNomeConta.text = nome
        lbData.text = data
        lbPreco.text = valor
    }
    
    
    func sombra(view:UIView,radius:Int){
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shadowRadius = CGFloat(radius)
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 1
        
    }
    
    func arrendondar(view:UIView){
        view.clipsToBounds = false
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
    }
    
    
      
    
   
    
}


