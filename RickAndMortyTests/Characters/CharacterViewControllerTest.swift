//
//  CharacterViewControllerTest.swift
//  RickAndMortyTests
//
//  Created by Eduuard Pinzon on 3/07/23.
//

import Quick
import Nimble
import UIKit
@testable import RickAndMorty

class CharacterViewControllerTest: QuickSpec {
    
    private var presenter: CharacterPresenterMock!
    private var viewController: CharacterViewController!
    
    override func spec() {
        beforeEach {
            self.presenter = CharacterPresenterMock()
            self.viewController = CharacterViewController()
            self.viewController.presenter = self.presenter
        }
        
        describe("did load character view controller") {
            context("load initial view") {
                it("get characters") {
                    self.viewController.loadView()
                    self.viewController.viewDidLoad()
                    expect(self.presenter.getCharactersTimesCalled).toEventually(equal(1))
                }
            }
            
            context("when user use CTA for to go other screen") {
                it("when user used character button") {
                    self.viewController.loadView()
                    self.viewController.viewDidLoad()
                    self.viewController.viewWillAppear(false)
                    
                    let characters = [Character(id: 0,
                                                name: "test",
                                                status: .alive,
                                                species: .alien,
                                                type: "test",
                                                gender: .male,
                                                origin: nil,
                                                location: nil,
                                                image: "test",
                                                episode: nil,
                                                url: nil,
                                                created: nil),
                                      Character(id: 1, name: "test2", status: .dead, species: .human, type: "test2", gender: .female, origin: nil, location: nil, image: "test2", episode: nil, url: nil, created: nil)]
                    self.presenter.loadCharacters(characters: characters)
                }
            }
        }
    }
    
    
}
