//
//  BusinessDetailPresenter.swift
//  BusinessSearch
//
//  Created by Christian Adiputra on 19/05/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import NetworkKit

final class BusinessDetailPresenter {

    // MARK: - Private properties -

    private unowned let view: BusinessDetailViewInterface
    private let interactor: BusinessDetailInteractorInterface
    private let wireframe: BusinessDetailWireframeInterface
    var business: ListBusiness?

    // MARK: - Lifecycle -

    init(
        view: BusinessDetailViewInterface,
        interactor: BusinessDetailInteractorInterface,
        wireframe: BusinessDetailWireframeInterface,
        business: ListBusiness
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.business = business
        fetchDetailBusiness()
        fetchListReviews()
    }
    
}

// MARK: - Extensions -

extension BusinessDetailPresenter: BusinessDetailPresenterInterface {
    func fetchListReviews() {
        guard let id = business?.id else { return }
        interactor.getListReview(id: id)
    }
    
    func getReviews() -> [Review] {
        guard let reviews = interactor.reviews else { return [] }
        return reviews
    }
    
    func getReview(index: Int) -> Review {
        guard let review = interactor.reviews?[index] else { return Review() }
        return review
    }
    
    func getDetail() -> ListBusiness {
        guard let business = interactor.business else { return ListBusiness() }
        return business
    }
    
    func fetchDetailBusiness() {
        guard let id = business?.id else { return }
        interactor.getDetailBusiness(id: id)
    }
    
}

extension BusinessDetailPresenter: BusinessDetailOutputInteractorInterface {
    
    func didSucessGetDetail() {
        view.showData()
    }
    
    func didFailedGetDetail(message: String) {
        view.showAlert(message: message)
    }
    
    func didSucessGetReviews() {
        view.showReviews()
    }
    
    func didFailedGetReviews(message: String) {
        view.showAlert(message: message)
    }
    
    
}
