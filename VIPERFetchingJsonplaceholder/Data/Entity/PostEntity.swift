//
//  PostEntity.swift
//  VIPERFetchingJsonplaceholder
//
//  Created by aykut ipek on 7.03.2023.
//

import Foundation

struct PostEntity: Decodable{
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}
