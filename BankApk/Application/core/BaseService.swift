//
//  BaseService.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 28/04/21.
//

import Foundation

protocol ServiceDelegate{
    func sucess(type: ResponseType)
    func failure(type:ResponseType, error:String)
}
