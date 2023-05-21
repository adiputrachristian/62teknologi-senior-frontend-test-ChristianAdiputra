//
//  BusinessServiceProtocol.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 17/05/23.
//

import Foundation
import Moya

public protocol BusinessServiceProtocol {
    
    func getListBusiness(page: Int, param: String, price: String, onSuccess: ((BaseListBusinessModel<ListBusiness>)->Void)? , onFailure: ((String)->Void)?)
    
    func getDetailBusiness(id: String, onSuccess: ((ListBusiness)-> Void)?, onFailure: ((String)->Void)?)
    func getListReviews(id: String, onSuccess: ((BaseListBusinessModel<Review>)->Void)?, onFailure: ((String)->Void)?)
}


