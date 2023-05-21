//
//  PokemonCardProvider.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 28/02/23.
//

import Foundation
import Moya

public protocol PokeCardServiceProtocol {
    
    func getAllCard(page: Int, onSuccess: ((BaseListPokeCardModel<PokeCardModel>)->Void)?, onFailure: ((Error)->Void)?)
    func getCardbyName(name: String, onSuccess: ((BaseListPokeCardModel<PokeCardModel>)->Void)?, onFailure: ((Error)->Void)?)
    func getRecCard(page: Int, subtype: String, type: String, onSuccess: ((BaseListPokeCardModel<PokeCardModel>)->Void)?, onFailure: ((Error)->Void)?)
    
}
