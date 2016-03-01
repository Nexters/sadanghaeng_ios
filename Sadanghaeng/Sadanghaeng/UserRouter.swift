//
//  UserRouter.swift
//  Sadanghaeng
//
//  Created by GoDonghyun on 2016. 2. 3..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import Foundation
import Alamofire

enum UserRouter: URLRequestConvertible {
    static let baseURLString = Resource.baseURLString
    static var OAuthToken: String?
    
    case LoginUser([String: AnyObject])
    case CreateUser([String: AnyObject])
    case ReadUser(String)
    case UpdateUser(String, [String: AnyObject])
    
    var method: Alamofire.Method {
        switch self {
        case .LoginUser:
            return .POST
        case .CreateUser:
            return .POST
        case .ReadUser:
            return .GET
        case .UpdateUser:
            return .PUT
        }
    }
    
    var path: String {
        switch self {
        case .LoginUser:
            return "/api/v1/users/login"
        case .CreateUser:
            return "/api/v1/users/register"
        case .ReadUser(let userId):
            return "/api/v1/users/\(userId)"
        case .UpdateUser(let userId, _):
            return "/api/v1/users/\(userId)"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: UserRouter.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        switch self {
        case .LoginUser(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        case .CreateUser(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        case .UpdateUser(_, let parameters):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
}