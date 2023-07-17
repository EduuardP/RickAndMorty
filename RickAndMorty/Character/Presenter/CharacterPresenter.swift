//
//  CharacterPresenter.swift
//  RickAndMorty
//
//  Created by Eduuard Pinzon on 3/07/23.
//

protocol CharacterPresenterProtocol: AnyObject {
    func getCharacters(url: String)
    func loadCharacters(characters: [Character])
    var view: CharacterViewProtocol? { set get }
}

class CharacterPresenter: CharacterPresenterProtocol {
    
    var view: CharacterViewProtocol?

    private var model: CharacterModelProtocol
    
    init(model: CharacterModelProtocol = CharacterModel()) {
        self.model = model
        self.model.presenter = self
    }
    
    func getCharacters(url: String) {
        self.model.getCharacters(url: url)
    }
    
    func loadCharacters(characters: [Character]) {
        self.view?.loadCharacters(characters: characters)
    }
}
