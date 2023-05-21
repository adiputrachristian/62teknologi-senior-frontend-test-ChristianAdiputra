//
//  BusinessService.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 17/05/23.
//

import Foundation
import Moya

public class BusinessService: BusinessMappingProtocol, BusinessServiceProtocol {

    

    private let provider: BaseProvider<BusinessProvider>
    public init (provider: BaseProvider<BusinessProvider> = BaseProvider<BusinessProvider>()) {
        self.provider = provider
    }
    
    public func getListBusiness(page: Int, param: String, price: String ,onSuccess: ((BaseListBusinessModel<ListBusiness>) -> Void)?, onFailure: ((String) -> Void)?) {
        provider.request(.getListBusiness(param: param, offset: page, price: price)) { [weak self] result in
            self?.handleResultListBusiness(result, typeResponse: ListBusiness.self, onSuccess: onSuccess, onFailure: onFailure)
        }
    }
    
    public func getDetailBusiness(id: String, onSuccess: ((ListBusiness) -> Void)?, onFailure: ((String) -> Void)?) {
        provider.request(.getDetailBusiness(id: id)) { [weak self] result in
            self?.handleResultDetailBusiness(result, typeResponse: ListBusiness.self, onSuccess: onSuccess, onFailure: onFailure)
        }
    }
    
    public func getListReviews(id: String, onSuccess: ((BaseListBusinessModel<Review>) -> Void)?, onFailure: ((String) -> Void)?) {
        provider.request(.getListReviews(id: id)) { [weak self] result in
            self?.handleResultListBusiness(result, typeResponse: Review.self, onSuccess: onSuccess, onFailure: onFailure)
        }
    }
    
        
    
    
    
}
