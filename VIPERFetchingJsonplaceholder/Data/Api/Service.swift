//
//  Service.swift
//  VIPERFetchingJsonplaceholder
//
//  Created by aykut ipek on 7.03.2023.
//

import Foundation

protocol ServiceProtocol {
    func fetchAllPosts(completion: @escaping(Result<[PostEntity],Error>)->Void)
}

final class Service: ServiceProtocol{
    private var serviceUrl: String = "https://jsonplaceholder.typicode.com/"
    func fetchAllPosts(completion: @escaping (Result<[PostEntity], Error>) -> Void) {
        guard let url = URL(string: "\(serviceUrl)posts") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                print("Error: \(error!.localizedDescription)")
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([PostEntity].self, from: data)
                completion(.success(posts))
            } catch {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
