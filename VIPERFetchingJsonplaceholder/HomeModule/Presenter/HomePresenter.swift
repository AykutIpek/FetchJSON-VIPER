//
//  Sunucu.swift
//  VIPERFetchingJsonplaceholder
//
//  Created by aykut ipek on 7.03.2023.
//

import Foundation

final class HomePresenter: ViewToPresenterHomeProtocol{
    var homeInteractorObject: PresenterToInteractorHomeProtocol?
    var homeViewObject: PresenterToViewHomeProtocol?
    
    func viewPosts() {
        homeInteractorObject?.getAllPosts()
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol{
    func sendDataToPresenter(postList: [PostEntity]) {
        homeViewObject?.sendDataToView(postList: postList)
    }
}
