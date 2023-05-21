//
//  LoginInterface.swift
//  Provider
//
//  Created by Christian Adiputra on 08/04/23.
//

import Foundation
import UIKit

public class LoginProvider {
    public static var instance: LoginInterface!
}

public protocol LoginInterface {
    
    /// Create a home screen page
    func createLoginScreenVC() -> UIViewController

}
