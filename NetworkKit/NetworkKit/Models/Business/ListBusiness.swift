//
//  ListBusiness.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 17/05/23.
//

import Foundation

public class ListBusiness: NullableMap {
    public var id: String?
    public var name: String?
    public var imageUrl: String?
    public var price: String?
    public var phone: String?
    public var rating: Float?
    public var reviewCount: Int?
    public var distance: Double?
    public var photos: [String]?
    public var coordinates: Coordinates?
    
    public init(id: String? = nil, name: String? = nil, imageUrl: String? = nil, price: String? = nil, phone: String? = nil, rating: Float? = nil, reviewCount: Int? = nil, distance: Double? = nil, photos: [String]? = []) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.price = price
        self.phone = phone
        self.rating = rating
        self.reviewCount = reviewCount
        self.distance = distance
        self.photos = photos
    }
    
    required public init?(dict: [String : Any]?) {
        self.name = dict?["name"] as? String
        self.imageUrl = dict?["image_url"] as? String
        self.id = dict?["id"] as? String
        self.price = dict?["price"] as? String
        self.phone = dict?["phone"] as? String
        self.rating = dict?["rating"] as? Float
        self.distance = dict?["distance"] as? Double
        self.reviewCount = dict?["review_count"] as? Int
        self.photos = dict?["photos"] as? [String]
        if let coordinates = dict?["coordinates"] as? [String: Any] {
            self.coordinates = Coordinates(dict: coordinates)
        }
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String: Any] = [:]
        if let name = name { result["name"] = name }
        if let imageUrl = imageUrl { result["image_url"] = imageUrl }
        if let id = id { result["id"] = id }
        if let price = price { result["price"] = price }
        if let phone = phone { result["phone"] = phone }
        if let rating = rating { result["rating"] = rating }
        if let distance = distance { result["distance"] = distance }
        if let reviewCount = reviewCount { result["review_count"] = reviewCount }
        if let photos = photos { result["photos"] =  photos }
        
        return result
    }
    
    
}


extension ListBusiness {
    public func getPrice() -> String {
        guard let price = self.price,  price != "" else { return "-" }
        return price
    }
    
    public func getRating() -> String {
        guard let rating = self.rating else { return "-" }
        return "\(rating)"
    }
    
    public func getDistance() -> String {
        guard let distance = self.distance else { return "-" }
        let roundedDistance = round(distance)
        return "\(roundedDistance)"
    }
    
    public func getReviewCount() -> String {
        guard let reviewCount = self.reviewCount else { return "-" }
        return "\(reviewCount)"
    }

}

