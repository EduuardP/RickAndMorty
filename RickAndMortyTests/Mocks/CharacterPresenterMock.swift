//
//  CharacterPresenterMock.swift
//  RickAndMortyTests
//
//  Created by Eduuard Pinzon on 17/07/23.
//

@testable import RickAndMorty

class CharacterPresenterMock: CharacterPresenterProtocol {
    
    
    var view: RickAndMorty.CharacterViewProtocol?
    
    var getCharactersTimesCalled = 0
    func getCharacters(url: String) {
        getCharactersTimesCalled += 1
    }
    
    var loadCharactersTimesCalled = 0
    func loadCharacters(characters: [RickAndMorty.Character]) {
        loadCharactersTimesCalled += 1
        self.view?.loadCharacters(characters: characters)
    }
}
