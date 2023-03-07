//
//  Yönlendirici.swift
//  VIPERFetchingJsonplaceholder
//
//  Created by aykut ipek on 7.03.2023.
//

import Foundation


final class HomeRouter: PresenterToRouterHomeProtocol{
    static func execModule(ref: HomeViewController) {
        let presenter = HomePresenter()
        
        //View
        ref.homePresenterObject = presenter
        
        //Presenter
        ref.homePresenterObject?.homeInteractorObject = HomeInteractor()
        ref.homePresenterObject?.homeViewObject = ref
        
        //Interactor
        ref.homePresenterObject?.homeInteractorObject?.homePresenterObject = presenter
    }
}
