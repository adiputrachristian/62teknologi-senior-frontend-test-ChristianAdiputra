//
//  BusinessProvider.swift
//  BusinessSearch
//
//  Created by Christian Adiputra on 17/05/23.
//

import Foundation
import UIKit
import Provider
import NetworkKit

public class BusinessFeatureProvider: BusinessInterface {
    
    public func createBusinessScreenVC() -> UIViewController {
        return BusinessHomeWireframe().viewController
    }
    
    
    
    public init() {}


}
