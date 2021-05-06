//
//  ViewController.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 26/04/21.
//

import UIKit
import IHKeyboardAvoiding
import SVProgressHUD

class ViewController: UIViewController, ServiceDelegate{
    
   
    
    func sucess(type: ResponseType) {
        self.tekaListagem.modalPresentationStyle = .fullScreen
        self.dismiss(animated: true) {
            self.present(self.tekaListagem, animated: true)
        }
    }
    
    func failure(type: ResponseType, error: String) {
       
        print("erro:\(error)")
    }
    
    //instanciando a Storyboard
    let tekaListagem = StoryboardScene.Main.listagemViewController.instantiate()
    //Começando a criar os componentes do Login
    
    //crindo a imagem de logo da tela de login
    let logoImage:UIImageView = {
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "Logo")
        return logoImage
    }()
    
    
    //Criando o inpult de login
    let loginTextFild:UITextField = {
        let textFild = UITextField()
        textFild.placeholder = "User"
        textFild.borderStyle = UITextField.BorderStyle.roundedRect
        textFild.translatesAutoresizingMaskIntoConstraints = false
        textFild.autocapitalizationType = .none
        return textFild
    }()
    
    //criando o inpult de senha
    let senhaTextFild:UITextField = {
        let textFild = UITextField()
        textFild.placeholder = "Password"
        textFild.borderStyle = UITextField.BorderStyle.roundedRect
        textFild.translatesAutoresizingMaskIntoConstraints = false
        textFild.autocapitalizationType = .none
        textFild.isSecureTextEntry = true
        return textFild
    }()
    
    //criando o buão de login
    let bntLogin:UIButton = {
        let bntLogin = UIButton()
        bntLogin.translatesAutoresizingMaskIntoConstraints = false
        bntLogin.backgroundColor = .systemBlue
        bntLogin.clipsToBounds = true
        bntLogin.layer.cornerRadius = 5
        bntLogin.setTitle("Login", for: .normal)
        return bntLogin
    }()
    
    var auth: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = AuthService(delegate: self)
        self.setupLayout()
        self.bntLogin.addTarget(self, action: #selector(logar(sender:)), for: .touchUpInside)
        KeyboardAvoiding.avoidingView = self.view
        self.configDismiss()
    }
    

    
    
    
   


}

extension ViewController{
    
    
    
    ///MARK: Aqui vai ficar as funções dos butões e os seus regex.
    public func isValidPassword(pass:String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z])(?=.*?[0-9]).{8,}$"
        let isPass = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return isPass.evaluate(with: pass)
    }
    
    public func isNumber(pass:String) -> Bool{
        let passwordRegex = "^(?=.*(?=.*?[0-9]).{11,}$"
        let isPass = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return isPass.evaluate(with: pass)
    }

    @objc func logar(sender: UIButton!){
       //verificando se não está nulo os inpults
        if let localLogin = self.loginTextFild.text, let localSenha = self.senhaTextFild.text{
            
            if localLogin.isEmpty || localSenha.isEmpty{
                failure(type: .login, error: "Preencha os campos nessesários...")
                return
            }
            ///TODO:Fazendo as validações de REGEX
            if isValidPassword(pass: localSenha) != true{
                
                failure(type: .login, error: "Preencha os campos")
            }else{
                self.auth.login(email: localLogin, senha: localSenha)
                print("Carregando...")
            }
            
                
            
            
        }
    }
    

}
extension ViewController{
    ///MARK:para ajeitar o problema do teclado do simulador...
    func configDismiss(){
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeKeyBoard)))
    }
    
    @objc func closeKeyBoard(){
        self.view.endEditing(true)
    }
}

