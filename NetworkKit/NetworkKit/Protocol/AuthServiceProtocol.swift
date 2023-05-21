//
//  LoginServiceProtocol.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 08/04/23.
//

import Foundation
import Moya

public protocol AuthServiceProtocol {
    
    func login(name: String, pass: String, onSuccess: ((String)->Void)?, onFailure: ((Error)->Void)?)
    
    func getListUser(onSuccess: ((BaseListUser<UserModel>)->Void)?, onFailure: ((Error)->Void)?)
    
}
