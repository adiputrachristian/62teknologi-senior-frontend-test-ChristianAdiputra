//
//  PokeCardService.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 28/02/23.
//

import Foundation
import Moya

public class PokeCardService: PokeCardServiceProtocol, APIMappingProtocol {
    
    private let provider: BaseProvider<PokeCardProvider>
    public init(provider: BaseProvider<PokeCardProvider> = BaseProvider<PokeCardProvider>()) {
        self.provider = provider
    }
    
    public func getAllCard(page: Int, onSuccess: ((BaseListPokeCardModel<PokeCardModel>) -> Void)?, onFailure: ((Error) -> Void)?) {
        provider.request(.getAllPokemonCard(page: page)) { [weak self] result in
            self?.handleResultLisCard(result, typeResponse: PokeCardModel.self, onSuccess: onSuccess, onFailure: onFailure)
        } 
    }
    
    public func getCardbyName(name: String, onSuccess: ((BaseListPokeCardModel<PokeCardModel>) -> Void)?, onFailure: ((Error) -> Void)?) {
        provider.request(.searchPokemonCard(name: name)) { [weak self] result in
            self?.handleResultLisCard(result, typeResponse: PokeCardModel.self, onSuccess: onSuccess, onFailure: onFailure)
        }
    }
    
    public func getRecCard(page: Int, subtype: String, type: String, onSuccess: ((BaseListPokeCardModel<PokeCardModel>) -> Void)?, onFailure: ((Error) -> Void)?) {
        provider.request(.getRecCard(page: page, subtype: subtype, type: type)) { [weak self] result in
            self?.handleResultLisCard(result, typeResponse: PokeCardModel.self, onSuccess: onSuccess, onFailure: onFailure)
        }
    }

    
    
    
}
