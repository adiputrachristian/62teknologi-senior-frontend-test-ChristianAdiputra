//
//  ImageCard.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 28/02/23.
//

import Foundation

public struct ImageCard: NullableMap {
    public var smallImg: String?
    public var largeImg: String?
    
    public init?(dict: [String : Any]?) {
        self.smallImg = dict?["small"] as? String
        self.largeImg = dict?["large"] as? String
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String: Any] = [:]
        if let smallImg = smallImg { result["small"] = smallImg }
        if let largeImg = largeImg { result["large"] = largeImg }
        return result
    }
    
    
}
