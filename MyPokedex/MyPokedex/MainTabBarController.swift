//
//  MainTabBarController.swift
//  MyPokedex
//
//  Created by Christian Adiputra on 28/03/23.
//

import Foundation
import UIKit
import DesignKit
import Provider

class MainTabBarController: BaseTabBarController, UITabBarControllerDelegate {
    
    var currentSelectedTab = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupTabbar()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        object_setClass(self.tabBar, TabBarViewController.self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTabbar() {
        self.tabBar.tintColor = UIColor.black
        
        setupTabBarItem()
        changeRadiusTabbar()
        setupShadowTabbar()
    }

    func setupTabBarItem() {

        // Create the first view controller and set its tab bar item
//        let firstViewController = PokemonCardProvider.instance.createCardScreenVC()
        let firstViewController = BusinessProvider.instance.createBusinessScreenVC()
        let firstNavController = UINavigationController(rootViewController: firstViewController)
        var imagepokecard = ImageProvider.image(named: "pokecard")
//        imagepokecard = imagepokecard?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        firstViewController.tabBarItem = UITabBarItem(title: "Pokecard",
                                                       image: imagepokecard,
                                                       tag: 0)
        firstViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        // Create the second view controller and set its tab bar item
        let secondViewController = PokedexProvider.instance.createPokedexScreenVC()
        let secondNavController = UINavigationController(rootViewController: secondViewController)
        var image = ImageProvider.image(named: "pokeball")
//        image = image?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            
        secondViewController.tabBarItem = UITabBarItem(title: "Pokedex",
                                                       image: image,
                                                      tag: 0)
        
        viewControllers = [firstNavController, secondNavController]
        
    }
    
    func changeRadiusTabbar() {
        tabBar.isTranslucent = true
        tabBar.backgroundColor = .white
        tabBar.layer.cornerRadius = 10
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func setupShadowTabbar() {
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController) else { return }

        if currentSelectedTab == 0 && selectedIndex == 0 {
            scrollToTop()
        }
        
        if selectedIndex == 0 {
            resetTitleTabbar()
            self.tabBar.items?[0].title = "Pokecard"
        } else if selectedIndex == 1 {
            resetTitleTabbar()
            self.tabBar.items?[1].title = "Pokedex"
        }

        currentSelectedTab = selectedIndex
    }
    
    func resetTitleTabbar() {
        guard let items = self.tabBar.items else { return }
        for item in items {
            item.title = ""
        }
    }
    
}
