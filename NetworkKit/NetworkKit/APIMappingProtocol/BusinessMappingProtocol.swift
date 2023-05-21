//
//  BusinessMappingProtocol.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 19/05/23.
//

import Foundation
import Moya

public class BusinessMappingProtocol: APIMappingProtocol {
    
    func handleResultListReviews (_ result: Result<Moya.Response, MoyaError>, onSuccess: (([Review]) -> Void)?,onFailure: ((String) -> Void)? ) {
        switch result {
        case .success(let response):
            self.mapResponseListReview(response, onSuccess: onSuccess, onFailure: onFailure)
        case .failure(let error):
            onFailure?(error.localizedDescription)
        }
    }
    
    private func mapResponseListReview(_ response: Moya.Response,
                                             onSuccess: (([Review]) -> Void)?,
                                             onFailure: ((String) -> Void)? ) {
        DispatchQueue(label: "map_queue").async {
            do {
                let obj = try response.mapJSON()
                if let obj = obj as? [String: Any], let error = ErrorModel(object: obj, httpCode: response.statusCode) {
                    DispatchQueue.main.async { onFailure?(error.errorMessage) }
                } else {
                    guard let obj = obj as? [String: Any], let listReview = obj["reviews"]
                    else {
                        DispatchQueue.main.async { onFailure?(CommonError.mappingError.message) }
                        return
                    }
                    
                    
                    DispatchQueue.main.async {
                        onSuccess?(listReview as! [Review])
                    }
                    
                }
            } catch {
                DispatchQueue.main.async { onFailure?(error.localizedDescription) }
            }
        }
    }
    
    func handleResultDetailBusiness<T: NullableMap>(_ result: Result<Moya.Response, MoyaError>,
                                             typeResponse: T.Type,
                                                    onSuccess: ((ListBusiness) -> Void)?,
                                             onFailure: ((String) -> Void)? ) {
        switch result {
        case .success(let response):
            self.mapResponseDetailBusiness(response, onSuccess: onSuccess, onFailure: onFailure)
        case .failure(let error):
            onFailure?(error.localizedDescription)
        }
    }
    
    private func mapResponseDetailBusiness(_ response: Moya.Response,
                                             onSuccess: ((ListBusiness) -> Void)?,
                                             onFailure: ((String) -> Void)? ) {
        DispatchQueue(label: "map_queue").async {
            do {
                let obj = try response.mapJSON()
                if let obj = obj as? [String: Any], let error = ErrorModel(object: obj, httpCode: response.statusCode) {
                    DispatchQueue.main.async { onFailure?(error.errorMessage) }
                } else {
                    guard let obj = obj as? [String: Any], let response = ListBusiness(dict: obj)
                    else {
                        DispatchQueue.main.async { onFailure?(CommonError.mappingError.message) }
                        return
                    }
                    
                    DispatchQueue.main.async {
                        onSuccess?(response)
                    }
                }
                
            } catch {
                DispatchQueue.main.async { onFailure?(error.localizedDescription) }
            }
        }
    }
    
    func handleResultListBusiness<T: NullableMap>(_ result: Result<Moya.Response, MoyaError>,
                                             typeResponse: T.Type,
                                             onSuccess: ((BaseListBusinessModel<T>) -> Void)?,
                                             onFailure: ((String) -> Void)? ) {
        switch result {
        case .success(let response):
            self.mapResponseBusiness(response, type: typeResponse, onSuccess: onSuccess, onFailure: onFailure)
        case .failure(let error):
            onFailure?(error.localizedDescription)
        }
    }
    
    private func mapResponseBusiness<T: NullableMap>(_ response: Moya.Response,
                                             type: T.Type,
                                             onSuccess: ((BaseListBusinessModel<T>) -> Void)?,
                                             onFailure: ((String) -> Void)? ) {
        DispatchQueue(label: "map_queue").async {
            do {
                let obj = try response.mapJSON()
                if let obj = obj as? [String: Any], let error = ErrorModel(object: obj, httpCode: response.statusCode) {
                    DispatchQueue.main.async { onFailure?(error.errorMessage) }
                } else {
                    guard let obj = obj as? [String: Any],
                          let response = BaseListBusinessModel<T>(dict: obj)
                    else {
                        DispatchQueue.main.async { onFailure?(CommonError.mappingError.message) }
                        return
                    }
                    
                    DispatchQueue.main.async { onSuccess?(response) }
                }
                
            } catch {
                DispatchQueue.main.async { onFailure?(error.localizedDescription) }
            }
        }
    }

}

//let error = ErrorModel(object: obj, httpCode: response.statusCode)
