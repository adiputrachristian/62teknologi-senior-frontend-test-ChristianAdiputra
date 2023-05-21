//
//  BusinessHomePresenter.swift
//  BusinessSearch
//
//  Created by Christian Adiputra on 15/05/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import NetworkKit

final class BusinessHomePresenter {

    // MARK: - Private properties -

    private unowned let view: BusinessHomeViewInterface
    private let interactor: BusinessHomeInteractorInterface
    private let wireframe: BusinessHomeWireframeInterface

    // MARK: - Lifecycle -

    init(
        view: BusinessHomeViewInterface,
        interactor: BusinessHomeInteractorInterface,
        wireframe: BusinessHomeWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension BusinessHomePresenter: BusinessHomePresenterInterface {
    func setFilterPrice(filter: [Int]) {
        interactor.setFilterPrice(filter: filter)
    }
    
    
    func getBusiness(index: Int) -> ListBusiness {
        let business = interactor.getBusiness(index: index)
        return business
    }
    
    func getNextPage() {
        interactor.getNextList()
    }
    
    func searchBusiness(param: String) {
        view.fetching()
        interactor.searchBusiness(param: param)
    }
    
    func goToDetailBusiness(index: Int) {
        guard let business = interactor.listBusiness?[index] else { return }
        wireframe.goToDetailBusiness(id: business)
    }
    
    func getTotalList() -> Int {
        guard let total = interactor.listBusiness?.count else { return 0 }
        return total
    }
    
}

extension BusinessHomePresenter: BusinessHomeOutputInterface {
    
    func didSuccessNextPage() {
        view.hideLoader()
        view.reloadData()
    }
    
    func didSuccessGetData() {
        self.view.reloadData()
    }
    
    func didFailedGetData(message: String) {
        view.showAlert(message: message)
    }
    
    func didFailedGetNextPage(message: String) {
        view.showAlert(message: message)
    }
    
    
}
