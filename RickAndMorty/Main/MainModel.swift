//
//  MainModel.swift
//  RickAndMorty
//
//  Created by Eduuard Pinzon on 3/07/23.
//

import Alamofire

protocol MainModelProtocol: AnyObject {
    func loadApi()
    var presenter: MainPresenterProtocol? { get set }
}



class MainModel: MainModelProtocol {
    
    private var alamofireService: AlamofireService
    var presenter: MainPresenterProtocol?
    
    init(alamofireService: AlamofireService = AlamofireService()) {
        self.alamofireService = alamofireService
    }
    
    func loadApi() {
        self.alamofireService.get(url: Constanst.mainUrl) { (response: AFResult<Main>) in
            switch response {
            case .success(let result):
                self.presenter?.result(result: result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
