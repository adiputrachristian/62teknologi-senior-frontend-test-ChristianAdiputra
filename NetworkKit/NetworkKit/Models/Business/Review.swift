//
//  Review.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 19/05/23.
//

import Foundation

public class Review: NullableMap {
 
    public var id: String?
    public var text: String?
    public var rating: Float?
    public var user: UserReview?
    
    public init(id: String? = nil, text: String? = nil, rating: Float? = nil, user: UserReview? = nil) {
        self.id = id
        self.rating = rating
        self.text = text
        self.user = user
    }
    
    public required init?(dict: [String : Any]?) {
        self.id = dict?["id"] as? String
        self.text = dict?["text"] as? String
        if let userDictionary = dict?["user"] as? [String: Any] {
            user = UserReview(dict: userDictionary)
        }
        self.rating = dict?["rating"] as? Float
    }
    
    public func dictionary() -> [String : Any]? {
        nil
    }
   
}

extension Review {
    public func getRating() -> String {
        guard let rating = self.rating else { return "" }
        return "\(rating)"
    }
}
