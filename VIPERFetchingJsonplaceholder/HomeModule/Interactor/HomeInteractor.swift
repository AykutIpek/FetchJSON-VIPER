//
//  Etkilesimci.swift
//  VIPERFetchingJsonplaceholder
//
//  Created by aykut ipek on 7.03.2023.
//

import Foundation

final class HomeInteractor: PresenterToInteractorHomeProtocol{
    var homePresenterObject: InteractorToPresenterHomeProtocol?
    func getAllPosts() {
        Service().fetchAllPosts{ result in
            switch result{
            case .success(let posts):
                self.homePresenterObject?.sendDataToPresenter(postList: posts)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
