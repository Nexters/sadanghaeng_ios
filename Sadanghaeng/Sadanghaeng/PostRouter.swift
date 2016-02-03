//
//  PostRouter.swift
//  Sadanghaeng
//
//  Created by GoDonghyun on 2016. 1. 31..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import Foundation
import Alamofire

enum PostRouter: URLRequestConvertible {
    static let baseURLString = Resource.baseURLString
    static var OAuthToken: String?
    
    case CreatePost([String: AnyObject])
    case ReadPost(String)
    case ReadPosts([String: AnyObject])
    case UpdatePost(String, [String: AnyObject])
    case DestroyPost(String)
    
    var method: Alamofire.Method {
        switch self {
        case .CreatePost:
            return .POST
        case .ReadPost:
            return .GET
        case .ReadPosts:
            return .GET
        case .UpdatePost:
            return .PUT
        case .DestroyPost:
            return .DELETE
        }
    }
    
    var path: String {
        switch self {
        case .CreatePost:
            return "/api/v1/posts"
        case .ReadPost(let postId):
            return "/api/v1/posts/\(postId)"
        case .ReadPosts:
            return "/api/v1/posts"
        case .UpdatePost(let postId, _):
            return "/api/v1/posts/\(postId)"
        case .DestroyPost(let postId):
            return "/api/v1/posts/\(postId)"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: PostRouter.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
//        if let token = PostRouter.OAuthToken {
//            mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        }
        
        switch self {
        case .CreatePost(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        case .ReadPosts(let parameters):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        case .UpdatePost(_, let parameters):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
}