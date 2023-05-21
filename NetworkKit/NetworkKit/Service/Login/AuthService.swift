//
//  LoginService.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 08/04/23.
//

import Foundation
import Moya

public class AuthService: AuthServiceProtocol, APIMappingProtocol {

    private let provider: BaseProvider<AuthProvider>
    
    public init(provider: BaseProvider<AuthProvider> = BaseProvider<AuthProvider>()) {
        self.provider = provider
    }
    
    public func login(name: String, pass: String, onSuccess: ((String) -> Void)?, onFailure: ((Error) -> Void)?) {
        provider.request(.login(email: name, pass: pass)) { [weak self] result in
            self?.handleLoginResult(result, onSuccess: onSuccess, onFailure: onFailure)
        }
    }
    
    public func getListUser(onSuccess: ((BaseListUser<UserModel>) -> Void)?, onFailure: ((Error) -> Void)?) {
        provider.request(.getUsers(page: 2)) { [weak self] result in
            self?.handleResultLisUser(result, typeResponse: UserModel.self, onSuccess: onSuccess, onFailure: onFailure)
        }
    }
    
    
    
    
}
