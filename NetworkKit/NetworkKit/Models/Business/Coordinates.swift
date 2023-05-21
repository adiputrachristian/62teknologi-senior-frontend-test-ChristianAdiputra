//
//  Coordinates.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 20/05/23.
//

import Foundation

public class Coordinates: NullableMap {
    
    public var latitude: Double?
    public var longitude: Double?
    
    public required init?(dict: [String : Any]?) {
        self.latitude = dict?["latitude"] as? Double
        self.longitude = dict?["longitude"] as? Double
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String: Any] = [:]
        if let latitude = latitude { result["latitude"] = latitude }
        if let longitude = longitude { result["longitude"] = longitude }
        return result
    }
    
    
}

extension Coordinates {
    
    public func getLatitude() -> Double {
        guard let latitude = latitude else { return 0 }
        return latitude
    }
    
    public func getLongitude() -> Double {
        guard let longitude = longitude else { return 0 }
        return longitude
    }
    
}
