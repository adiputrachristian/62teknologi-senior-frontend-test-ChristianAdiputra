//
//  BaseModelBusiness.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 17/05/23.
//

import Foundation

public struct BaseListBusinessModel<T>: NullableMap where T:NullableMap {
    
    public var business: [T]?
    public var reviews: [T]?
    
    public init?(dict: [String: Any]?) {
        guard let dict = dict else {return nil}
        
        business = nil
        reviews = nil
        if let business = dict["businesses"] as? [[String: Any]] {
            self.business = business.compactMap({T(dict: $0)})
        }
        
        if let reviews = dict["reviews"] as? [[String: Any]] {
            self.reviews = reviews.compactMap({T(dict: $0)})
        }
        
    }
    public func dictionary() -> [String: Any]? {
        var dict = [String: Any]()
        dict["businesses"] = business?.compactMap({$0.dictionary()})
        return dict
    }
    
}
