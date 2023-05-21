//
//  UserModel.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 08/04/23.
//

import Foundation

public struct UserModel: NullableMap {

    
    public var id: Int?
    public var email: String?
    public var firstName: String?
    public var lastName: String?
    public var avatar: String?
    
    public init?(dict: [String : Any]?) {
        self.email = dict?["email"] as? String
        self.firstName = dict?["first_name"] as? String
        self.lastName = dict?["last_name"] as? String
        self.avatar = dict?["avatar"] as? String
        self.id = dict?["id"] as? Int
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String: Any] = [:]
        if let email = email { result["email"] = email }
        if let firstName = firstName { result["first_name"] = firstName }
        if let lastName = lastName { result["last_name"] = lastName }
        if let avatar = avatar { result["avatar"] = avatar }
        if let id = id { result["id"] = id }
        return result
    }
    
}
