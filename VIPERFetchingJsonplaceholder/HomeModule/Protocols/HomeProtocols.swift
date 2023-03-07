//
//  Protokol.swift
//  VIPERFetchingJsonplaceholder
//
//  Created by aykut ipek on 7.03.2023.
//

import Foundation

protocol ViewToPresenterHomeProtocol{
    var homeInteractorObject: PresenterToInteractorHomeProtocol? {get set}
    var homeViewObject: PresenterToViewHomeProtocol? {get set}
    func viewPosts()
}

protocol PresenterToInteractorHomeProtocol{
    var homePresenterObject: InteractorToPresenterHomeProtocol? {get set}
    func getAllPosts()
}

protocol InteractorToPresenterHomeProtocol{
    func sendDataToPresenter(postList:[PostEntity])
}

protocol PresenterToViewHomeProtocol{
    func sendDataToView(postList:[PostEntity])
}

protocol PresenterToRouterHomeProtocol{
    static func execModule(ref: HomeViewController)
}
