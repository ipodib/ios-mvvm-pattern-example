//
//  ServerDataProvider.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 11/8/16.
//  Copyright © 2018 Ivan Podbika. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RxAlamofire
import RxSwift

class DataProvider {
    
    private let sessionManager: SessionManager
    fileprivate var cachedRequests = [Request]()
    
    convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        self.init(SessionManager(configuration: configuration))
    }
    
    /// Initialize data provider with session manager.
    ///
    /// - Parameter sessionManager: Configured session manager.
    init(_ sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    /// Execute request with object response.
    ///
    /// - Parameters:
    ///   - request: Request to be executed.
    ///   - completion: Completion handler with response object.
    func execute<T : Mappable>(request: URLRequestConvertible) -> Observable<T> {
        return observable(for: request)
            .json()
            .map { json -> T in
                guard let response = Mapper<T>().map(JSONObject: json) else {
                    throw RxError.noElements
                }
                return response
            }
    }
    
    /// Execute request with list response.
    ///
    /// - Parameters:
    ///   - request: Request to be called.
    ///   - completion: Completion handler with response list.
    func execute<T : Mappable>(request: URLRequestConvertible) -> Observable<[T]> {
        return observable(for: request)
            .json()
            .map { json -> [T] in
                guard let response = Mapper<T>().mapArray(JSONObject: json) else {
                    throw RxError.noElements
                }
                return response
            }
    }

    /// Execute request with no response.
    ///
    /// - Parameters:
    ///   - request: Request to be called.
    ///   - completion: Completion handler.
    func execute(request: URLRequestConvertible) -> Observable<Void> {
        return sessionManager.rx
            .request(urlRequest: request)
            .observeOn(MainScheduler.instance)
            .map { _ in Void() }
    }
    
    private func observable(for request: URLRequestConvertible) -> Observable<DataRequest> {
        return sessionManager.rx
            .request(urlRequest: request)
            .observeOn(MainScheduler.instance)
    }
}
