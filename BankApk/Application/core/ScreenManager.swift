//
//  ScreenManager.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 01/05/21.
//

import Foundation
import UIKit
class ScreenManager{
    static func setupInicialViewController(){
        if SessionControll.shared.isAtivo{
            let listagem = StoryboardScene.Main.listagemViewController.instantiate()
            UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: listagem)
        }else{
            UIApplication.shared.windows.first?.rootViewController = StoryboardScene.Main.initialScene.instantiate()
        }
    }
}
