//
//  PokedexModel.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 05/03/23.
//

import Foundation
import IGListKit
import IGListDiffKit

public class PokedexModel: NullableMap {
    
    public var id: String?
    public var name: String?
    public var url: String?
    
    public init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
    
    required public init?(dict: [String : Any]?) {
        self.name = dict?["name"] as? String
        self.url = dict?["url"] as? String
        self.id = url?.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "").filter("0123456789.".contains)
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String: Any] = [:]
        if let name = name { result["name"] = name }
        if let url = url { result["url"] = url }
        return result
    }

}

extension PokedexModel: ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
        return id! as any NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self.name == (object as! PokedexModel).name
    }
    
    
}

