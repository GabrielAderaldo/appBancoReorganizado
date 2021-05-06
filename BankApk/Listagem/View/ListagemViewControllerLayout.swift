//
//  ListagemViewControllerLayout.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 02/05/21.
//

import Foundation
import UIKit

extension ListagemViewController{
    
    func setupNavigation(){
        //self.title = SessionControll.shared.usuarioModel?.name
        
    }
    
    func setupLayout(){
        setupTableViewLayout()
        setupNavigation()
    }
    
    func setupTableViewLayout(){
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
