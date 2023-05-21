//
//  AppDelegate+Providers.swift
//  MyPokedex
//
//  Created by Christian Adiputra on 27/03/23.
//

import Foundation
import UIKit
import Provider
import BusinessSearch

extension AppDelegate {
    func setupFeatureProviders() {
        BusinessProvider.instance = BusinessFeatureProvider()
    }
}
