//
//  Review.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 19/05/23.
//

import Foundation

public class UserReview: NullableMap {
    
    public var id: String?
    public var imageUrl: String?
    public var name: String?
    
    public required init?(dict: [String : Any]?) {
        self.id = dict?["id"] as? String
        self.name = dict?["name"] as? String
        self.imageUrl = dict?["image_url"] as? String
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String: Any] = [:]
        if let name = name { result["name"] = name }
        if let imageUrl = imageUrl { result["image_url"] = imageUrl }
        if let id = id { result["id"] = id }
        
        return result
    }
    
}
