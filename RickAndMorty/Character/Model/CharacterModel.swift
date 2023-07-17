//
//  MainModel.swift
//  RickAndMorty
//
//  Created by Eduuard Pinzon on 3/07/23.
//

import Alamofire

protocol CharacterModelProtocol: AnyObject {
    func getCharacters(url: String)
    var presenter: CharacterPresenterProtocol? { get set }
}

class CharacterModel: CharacterModelProtocol {
    
    private var alamofireService: AlamofireService
    var presenter: CharacterPresenterProtocol?
    
    init(alamofireService: AlamofireService = AlamofireService()) {
        self.alamofireService = alamofireService
    }
    
    func getCharacters(url: String) {
        self.alamofireService.get(url: url) { (response: AFResult<InfoCharacter>) in
            switch response {
            case .success(let result):
                self.presenter?.loadCharacters(characters: result.results ?? [])
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
