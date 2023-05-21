//
//  PokemonCardModel.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 28/02/23.
//

import Foundation

public struct PokeCardModel: NullableMap {
    
    public var id: String?
    public var name: String?
    public var images: ImageCard?
    public var subTypes: [String]?
    public var types: [String]?
    public var superType: String?
    public var flavorText: String?
    public var hp: String?
    
    public init(id: String?, name: String?, images: ImageCard?, subtype: [String]?, type: [String]?, supertype: String?, flavorText: String?, hp: String?) {
        self.id = id
        self.name = name
        self.subTypes = subtype
        self.types = type
        self.superType = supertype
        self.flavorText = flavorText
        self.hp = hp
    }
    
    public init?(dict: [String : Any]?) {
        self.id = dict?["id"] as? String ?? ""
        self.name = dict?["name"] as? String
        if let images = dict?["images"] as? [String: Any] {
            self.images = ImageCard(dict: images)
        }
        if let subtypes = dict?["subtypes"] as? [String] {
            self.subTypes = subtypes.map({$0})
        }
        if let types = dict?["types"] as? [String] {
            self.types = types.map({$0})
        }
        self.superType = dict?["supertype"] as? String
        self.flavorText = dict?["flavorText"] as? String
        self.hp = dict?["hp"] as? String
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String: Any] = [:]
        result["id"] = id
        if let name = name { result["name"] = name }
        if let images = images { result["images"] = images }
        if let subTypes = subTypes { result["subtypes"] = subTypes }
        if let types = types { result["types"] = types }
        if let superType = superType { result["superType"] = superType }
        if let flavorText = flavorText { result["flavorText"] = flavorText }
        if let hp = hp { result["hp"] = hp }
        return result
    }

}
