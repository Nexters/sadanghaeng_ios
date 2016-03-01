//
//  UnivRouter.swift
//  Sadanghaeng
//
//  Created by GoDonghyun on 2016. 3. 1..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import Foundation
import Alamofire

enum UnivRouter: URLRequestConvertible {
    static let baseURLString = Resource.baseURLString
    static var OAuthToken: String?
    
    case ReadUnivPosts([String: AnyObject])
    
    var method: Alamofire.Method {
        switch self {
        case .ReadUnivPosts:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .ReadUnivPosts(let univId):
            return "/api/v1/universities/\(univId)/posts"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: PostRouter.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        switch self {
        case .ReadUnivPosts(let parameters):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
}