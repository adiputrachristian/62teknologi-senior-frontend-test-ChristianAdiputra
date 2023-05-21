//
//  BusinessInterface.swift
//  Provider
//
//  Created by Christian Adiputra on 17/05/23.
//

import Foundation
import UIKit

public class BusinessProvider {
    public static var instance: BusinessInterface!
}

public protocol BusinessInterface {
    
    func createBusinessScreenVC() -> UIViewController
    
}
