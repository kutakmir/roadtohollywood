//
//  Resource.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation

enum Resource<T> {
    case loading
    case success(T)
    case error(Error)
}

extension Resource {

    static func resource<T>(from result: Result<T, Error>) -> Resource<T> {
        switch result {
        case .success(let item):
            return .success(item)
        case .failure(let error):
            return .error(error)
        }
    }
}
