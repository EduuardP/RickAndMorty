//
//  MenuModelTest.swift
//  RickAndMortyTests
//
//  Created by Eduuard Pinzon on 3/07/23.
//
import Foundation
import Quick
import Nimble
@testable import RickAndMorty

class MenuModelTest: QuickSpec {
    
    private var alamofireService: AlamofireServiceMock!
    private var presenter: MenuPresenterMock!
    private var model: MenuModelProtocol!
    
    override func spec() {
        beforeEach {
            self.alamofireService = AlamofireServiceMock()
            self.presenter = MenuPresenterMock()
            self.model = MenuModel(alamofireService: self.alamofireService)
            self.model.presenter = self.presenter
        }
        
        describe("when load of app") {
            context("load App") {
                it("when the endpoint response success") {
                    self.alamofireService.result = Menu(characters: nil, locations: nil, episodes: nil)
                    self.alamofireService.success = true
                    self.model.loadApi()
                    
                    expect(self.presenter.resultTimesCalled).toEventually(equal(1))
                }
				
				it("when the endpoint response failature") {
					self.alamofireService.result = Menu(characters: nil, locations: nil, episodes: nil)
					self.alamofireService.success = false
					self.model.loadApi()
					
					expect(self.presenter.resultTimesCalled).toEventually(equal(0))
				}
            }
        }
    }
}
