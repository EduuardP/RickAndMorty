//
//  AlamosfireServiceMock.swift
//  RickAndMortyTests
//
//  Created by Eduuard Pinzon on 3/07/23.
//


@testable import RickAndMorty
import Alamofire

public class AlamofireServiceMock: AlamofireService {
    
    var result: Decodable!
    var success: Bool = false
    public override func get<T: Decodable> (url: String, completion: @escaping (AFResult<T>)-> Void) {
        
        if success {
            completion(AFResult.success(result as! T))
        } else {
            completion(AFResult.failure(.explicitlyCancelled))
        }
    }
}
