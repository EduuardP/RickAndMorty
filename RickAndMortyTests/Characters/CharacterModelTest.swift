//
//  CharacterModelTest.swift
//  RickAndMortyTests
//
//  Created by Eduuard Pinzon on 3/07/23.
//

import Foundation
import Quick
import Nimble
@testable import RickAndMorty

class CharacterModelTest: QuickSpec {
    
    private var alamofireService: AlamofireServiceMock!
    private var presenter: CharacterPresenterMock!
    private var model: CharacterModelProtocol!
    
    override func spec() {
        beforeEach {
            self.alamofireService = AlamofireServiceMock()
            self.presenter = CharacterPresenterMock()
            self.model = CharacterModel(alamofireService: self.alamofireService)
            self.model.presenter = self.presenter
        }
        
        describe("when load of app") {
            context("load App") {
                it("when the endpoint response success") {
                    let infoCharacter = InfoCharacter(info: nil, results: nil)
                    self.alamofireService.result = infoCharacter
                    self.alamofireService.success = true
                    
                    self.model.getCharacters(url: "urlTest")
                    
                    expect(self.presenter.loadCharactersTimesCalled).toEventually(equal(1))
                }
                
                it("when the endpoint response failature") {
                    let infoCharacter = InfoCharacter(info: nil, results: nil)
                    self.alamofireService.result = infoCharacter
                    self.alamofireService.success = false
                    self.model.getCharacters(url: "urlTest")
                    
                    expect(self.presenter.loadCharactersTimesCalled).toEventually(equal(0))
                }
            }
        }
    }
}
