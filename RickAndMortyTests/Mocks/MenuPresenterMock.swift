//
//  MenuPresenterMock.swift
//  RickAndMortyTests
//
//  Created by Eduuard Pinzon on 16/07/23.
//


@testable import RickAndMorty

class MenuPresenterMock: MenuPresenterProtocol {
    
    var view: MenuViewProtocol?
    
    func loadApi() {
    }
    
    var resultTimesCalled = 0
    func result(result: Menu) {
        resultTimesCalled += 1
    }
}
