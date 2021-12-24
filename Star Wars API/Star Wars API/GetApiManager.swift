//
//  GetApiManager.swift
//  Star Wars API
//
//  Created by admin on 24/12/2021.
//

import Foundation

// calling API
class GetApiManager {
    
    class func getApiResponse( urlPath: String , completionHandler : @escaping (Data?, Error?) -> Void ) {
        let urlSession = URLSession.shared
        guard let url = URL.init(string: urlPath) else {
            return
        }
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error)
                completionHandler(nil, error)
            }else {
                completionHandler(data, nil)
            }
        }
        task.resume()
    }
}
