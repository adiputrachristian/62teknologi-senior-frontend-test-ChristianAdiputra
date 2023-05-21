//
//  APIMappingProtocol.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 28/02/23.
//

import Moya

protocol APIMappingProtocol {
    
}

extension APIMappingProtocol {
    func handleLoginResult(_ result: Result<Moya.Response, MoyaError>,
                                           onSuccess: ((String) -> Void)?,
                                           onFailure: ((Error) -> Void)? ) {
        switch result {
        case .success(let response):
            self.mapResponseUser(response, onSuccess: onSuccess, onFailure: onFailure)
        case .failure(let error):
            onFailure?(error)
        }
    }
    
    func handleResultLisCard<T: NullableMap>(_ result: Result<Moya.Response, MoyaError>,
                                             typeResponse: T.Type,
                                             onSuccess: ((BaseListPokeCardModel<T>) -> Void)?,
                                             onFailure: ((Error) -> Void)? ) {
        switch result {
        case .success(let response):
            self.mapResponse(response, type: typeResponse, onSuccess: onSuccess, onFailure: onFailure)
        case .failure(let error):
            onFailure?(error)
        }
    }
    
    func handleResultLisUser<T: NullableMap>(_ result: Result<Moya.Response, MoyaError>,
                                             typeResponse: T.Type,
                                             onSuccess: ((BaseListUser<T>) -> Void)?,
                                             onFailure: ((Error) -> Void)? ) {
        switch result {
        case .success(let response):
            self.mapResponseUser(response, type: typeResponse, onSuccess: onSuccess, onFailure: onFailure)
        case .failure(let error):
            onFailure?(error)
        }
    }
    
    func handleResultLisPokemon<T: NullableMap>(_ result: Result<Moya.Response, MoyaError>,
                                                typeResponse: T.Type,
                                                onSuccess: ((BaseListPokedexModel<T>) -> Void)?,
                                                onFailure: ((Error) -> Void)? ) {
        switch result {
        case .success(let response):
            self.mapResponsePokedex(response, type: typeResponse, onSuccess: onSuccess, onFailure: onFailure)
        case .failure(let error):
            onFailure?(error)
        }
    }
    
    func handleResultDetailPokemon(_ result: Result<Moya.Response, MoyaError>, typeResponse: PokemonDetail.Type, onSuccess: ((PokemonDetail) -> Void)?, onFailure: ((Error) -> Void)? ) {
        switch result {
        case .success(let response):
            self.mapResponseDetailPokemon(response, type: typeResponse, onSuccess: onSuccess, onFailure: onFailure)
        case .failure(let error):
            onFailure?(error)
        }
    }
    
    private func mapResponseUser(_ response: Moya.Response,
                                             onSuccess: ((String) -> Void)?,
                                             onFailure: ((Error) -> Void)? ) {
        DispatchQueue(label: "map_queue").async {
            do {
                let obj = try response.mapJSON()
                if let obj = obj as? [String: Any], let error = ErrorModel(object: obj, httpCode: response.statusCode) {
                    DispatchQueue.main.async { onFailure?(error) }
                } else {
                    guard let obj = obj as? [String: Any]
                    else {
                        DispatchQueue.main.async { onFailure?(CommonError.mappingError) }
                        return
                    }
                    
                    
                    if (obj["token"] != nil) {
                        DispatchQueue.main.async { onSuccess?(obj["token"] as! String) }
                    }
                }
                
            } catch {
                DispatchQueue.main.async { onFailure?(error) }
            }
        }
    }

    
    private func mapResponse<T: NullableMap>(_ response: Moya.Response,
                                             type: T.Type,
                                             onSuccess: ((BaseListPokeCardModel<T>) -> Void)?,
                                             onFailure: ((Error) -> Void)? ) {
        DispatchQueue(label: "map_queue").async {
            do {
                let obj = try response.mapJSON()
                if let obj = obj as? [String: Any], let error = ErrorModel(object: obj, httpCode: response.statusCode) {
                    DispatchQueue.main.async { onFailure?(error) }
                } else {
                    guard let obj = obj as? [String: Any],
                          let response = BaseListPokeCardModel<T>(dict: obj)
                    else {
                        DispatchQueue.main.async { onFailure?(CommonError.mappingError) }
                        return
                    }
                    
                    DispatchQueue.main.async { onSuccess?(response) }
                }
                
            } catch {
                DispatchQueue.main.async { onFailure?(error) }
            }
        }
    }
    
    private func mapResponseUser<T: NullableMap>(_ response: Moya.Response,
                                             type: T.Type,
                                             onSuccess: ((BaseListUser<T>) -> Void)?,
                                             onFailure: ((Error) -> Void)? ) {
        DispatchQueue(label: "map_queue").async {
            do {
                let obj = try response.mapJSON()
                if let obj = obj as? [String: Any], let error = ErrorModel(object: obj, httpCode: response.statusCode) {
                    DispatchQueue.main.async { onFailure?(error) }
                } else {
                    guard let obj = obj as? [String: Any],
                          let response = BaseListUser<T>(dict: obj)
                    else {
                        DispatchQueue.main.async { onFailure?(CommonError.mappingError) }
                        return
                    }
                    
                    DispatchQueue.main.async { onSuccess?(response) }
                }
                
            } catch {
                DispatchQueue.main.async { onFailure?(error) }
            }
        }
    }
    
    private func mapResponsePokedex<T: NullableMap>(_ response: Moya.Response,
                                                    type: T.Type,
                                                    onSuccess: ((BaseListPokedexModel<T>) -> Void)?,
                                                    onFailure: ((Error) -> Void)? ) {
        DispatchQueue(label: "map_").async {
            do {
                let obj = try response.mapJSON()
                if let obj = obj as? [String: Any], let error = ErrorModel(object: obj, httpCode: response.statusCode) {
                    DispatchQueue.main.async { onFailure?(error) }
                } else {
                    guard let obj = obj as? [String: Any],
                          let response = BaseListPokedexModel<T>(dict: obj)
                    else {
                        DispatchQueue.main.async { onFailure?(CommonError.mappingError) }
                        return
                    }
                    
                    DispatchQueue.main.async { onSuccess?(response) }
                }
                
            } catch {
                DispatchQueue.main.async { onFailure?(error) }
            }
        }
    }
    
    private func mapResponseDetailPokemon(_ response: Moya.Response, type: PokemonDetail.Type, onSuccess: ((PokemonDetail) -> Void)?, onFailure: ((Error) -> Void)? ) {
        DispatchQueue(label: "map_").async {
            do {
                let obj = try response.mapJSON()
                if let obj = obj as? [String: Any], let error = ErrorModel(object: obj, httpCode: response.statusCode) {
                    DispatchQueue.main.async { onFailure?(error) }
                } else {
                    guard let obj = obj as? [String: Any],
                          let response = PokemonDetail(dict: obj)
                    else {
                        DispatchQueue.main.async { onFailure?(CommonError.mappingError) }
                        return
                    }
                    
                    DispatchQueue.main.async { onSuccess?(response) }
                }
                
            } catch {
                DispatchQueue.main.async { onFailure?(error) }
            }
        }
    }
    
}
