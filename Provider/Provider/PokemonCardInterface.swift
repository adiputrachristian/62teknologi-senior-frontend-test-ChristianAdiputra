//
//  Interface.swift
//  Provider
//
//  Created by Christian Adiputra on 28/02/23.
//

import Foundation
import UIKit

public class PokemonCardProvider {
    public static var instance: PokemonCardInterface!
}

public protocol PokemonCardInterface {
    
    /// Create a home screen page
    func createCardScreenVC() -> UIViewController

}
