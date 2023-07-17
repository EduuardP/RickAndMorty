//
//  MainModel.swift
//  RickAndMorty
//
//  Created by Eduuard Pinzon on 3/07/23.
//

import Alamofire

protocol MenuModelProtocol: AnyObject {
    func loadApi()
    var presenter: MenuPresenterProtocol? { get set }
}



class MenuModel: MenuModelProtocol {
    
    private var alamofireService: AlamofireService
    var presenter: MenuPresenterProtocol?
    
    init(alamofireService: AlamofireService = AlamofireService()) {
        self.alamofireService = alamofireService
    }
    
    func loadApi() {
        self.alamofireService.get(url: Constanst.Url.menuUrl) { (response: AFResult<Menu>) in
            switch response {
            case .success(let result):
                self.presenter?.result(result: result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
