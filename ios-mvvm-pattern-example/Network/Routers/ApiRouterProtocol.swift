//
//  ApiRouterProtocol.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 2/4/17.
//  Copyright © 2017 Ivan Podibka. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiRouterProtocol: URLRequestConvertible {

    /// Router URL.
    var urlPath: URL { get }
    
    /// Path added to base url
    var path: String { get }
    
    /// HTTP method.
    var method: HTTPMethod { get }
    
    /// List of parameters for request (depends on http method)
    var parameters: Parameters { get }
    
    /// Request body.
    var body: String? { get }
    
    /// Additional request headers.
    var headers: [String: String] { get }
    
}

// MARK: - Default implementation for protocol
extension ApiRouterProtocol {
    
    var urlPath: URL {
        return Constants.API.baseUrl
    }
    
    var body: String? {
        return nil
    }
    
    var parameters: Parameters {
        return [:]
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    private var defaultHeaders: [String: String] {
        return ["Accept": "application/json",
                "Content-Type": "application/json"]
    }
    
    private var allHeaders: [String: String] {
        var map = defaultHeaders
        for (key, value) in headers {
            map[key] = value
        }
        return map
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try URLRequest(url: urlPath.appendingPathComponent(path),
                                        method: method,
                                        headers: allHeaders)
        urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        urlRequest.appendApiKey()
        
        if let body = body?.data(using: String.Encoding.utf8) {
            urlRequest.httpBody = body
        }
        
        return urlRequest
    }
    
}

private extension URLRequest {
    
    mutating func appendApiKey() {
        if let url = self.url {
            self.url = url.appendingApiKey()
        }
    }
    
}

private extension URL {
    
    func appendingApiKey() -> URL? {
        let queryItem = URLQueryItem(name: "api_key", value: Constants.API.apiKey)
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)
        
        if urlComponents?.queryItems?.isEmpty ?? true {
            urlComponents?.queryItems = [queryItem]
        } else {
            urlComponents?.queryItems?.append(queryItem)
        }
            
        return urlComponents?.url
    }
    
}
