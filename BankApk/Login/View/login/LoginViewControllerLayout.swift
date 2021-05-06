//
//  LoginViewControllerLayout.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 27/04/21.
//

import Foundation
import  UIKit

extension ViewController{
    
    
    func setupLayout(){
        
        setupLogo()
        setupLogin()
        setupSenha()
        setupBntLogin()
        
    }
    
    func setupLogo(){
        self.view.addSubview(self.logoImage)
       
        NSLayoutConstraint.activate([
            self.logoImage.widthAnchor.constraint(equalToConstant: 125),
            self.logoImage.heightAnchor.constraint(equalToConstant: 70),
            self.logoImage.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 36),
            self.logoImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant:126),
            self.logoImage.rightAnchor.constraint(greaterThanOrEqualTo:self.view.leftAnchor, constant: -32)
        ])
    }
    
    
    func setupLogin(){
        self.view.addSubview(self.loginTextFild)
        NSLayoutConstraint.activate([
            self.loginTextFild.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor,constant: 105),
            self.loginTextFild.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            self.loginTextFild.rightAnchor.constraint(greaterThanOrEqualTo: self.view.rightAnchor, constant: -32)
        ])
    }
    
    
    func setupSenha(){
        self.view.addSubview(self.senhaTextFild)
        NSLayoutConstraint.activate([
            self.senhaTextFild.topAnchor.constraint(equalTo: self.loginTextFild.bottomAnchor, constant: 32),
            self.senhaTextFild.leftAnchor.constraint(equalTo: self.loginTextFild.leftAnchor, constant: 0),
            self.senhaTextFild.rightAnchor.constraint(equalTo: self.loginTextFild.rightAnchor, constant: 0)
           
        ])
        
    }
    
    
    func setupBntLogin(){
        
        self.view.addSubview(self.bntLogin)
        NSLayoutConstraint.activate([
            self.bntLogin.topAnchor.constraint(equalTo: self.loginTextFild.bottomAnchor, constant: 220),
            self.bntLogin.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            self.bntLogin.rightAnchor.constraint(greaterThanOrEqualTo: self.view.rightAnchor,constant: -32)
        ])
    }
}
