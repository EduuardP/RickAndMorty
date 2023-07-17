//
//  AlamofireService.swift
//  RickAndMorty
//
//  Created by Eduuard Pinzon on 3/07/23.
//

import Alamofire

public class AlamofireService {
    
    func get<T: Decodable> (url: String, completion: @escaping (AFResult<T>)-> Void) {
        AF.request(url, method: .get)
            .responseDecodable(of: T.self) { response in
                completion(response.result)
            }
    }
}
