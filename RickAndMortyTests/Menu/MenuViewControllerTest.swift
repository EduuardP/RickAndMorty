//
//  MenuViewControllerTest.swift
//  RickAndMortyUITests
//
//  Created by Eduuard Pinzon on 3/07/23.
//

import Foundation
import Quick
import Nimble
import UIKit
@testable import RickAndMorty

class MenuViewControllerTest: QuickSpec {
	
	private var presenter: MenuPresenterMock!
	private var viewController: MenuViewController!
	private var navigationController: UINavigationController!
	
	override func spec() {
		beforeEach {
			self.presenter = MenuPresenterMock()
			self.viewController = MenuViewController()
			self.viewController.presenter = self.presenter
			self.navigationController = UINavigationController()
			self.navigationController.pushViewController(self.viewController, animated: false)
		}
		
		describe("did load Menu view controller") {
			context("load initial view") {
				it("get Api content") {
					self.viewController.viewDidLoad()
					
					expect(self.presenter.loadApiTimesCalled).to(equal(1))
					
				}
			}
			
			context("when user use CTA for to go other screen") {
				it("when user used character button") {
					self.viewController.viewDidLoad()
					let menu = Menu(characters: "testCharacters", locations: "testLocations", episodes: nil)
					self.presenter.result(result: menu)
					
					self.viewController.clickCharactersButton()
					
					expect(self.navigationController.viewControllers.first is CharacterViewController).toEventually(beFalse())
				}
                
                it("when user used character button") {
                    self.viewController.viewDidLoad()
                    
                    self.viewController.clickCharactersButton()
                    
                    expect(self.navigationController.viewControllers.first is CharacterViewController).toEventually(beFalse())
                }
                
                it("when user used locations button") {
                    self.viewController.viewDidLoad()
                    let menu = Menu(characters: "testCharacters", locations: "testLocations", episodes: nil)
                    self.presenter.result(result: menu)
                    
                    self.viewController.clickLocationsButton()
                    
                    expect(self.navigationController.viewControllers.first is CharacterViewController).toEventually(beFalse())
                }
                
                it("when user used locations button") {
                    self.viewController.viewDidLoad()
                    
                    self.viewController.clickLocationsButton()
                    
                    expect(self.navigationController.viewControllers.first is CharacterViewController).toEventually(beFalse())
                }
                
                it("when user used Episodes button") {
                    self.viewController.viewDidLoad()
                    let menu = Menu(characters: "testCharacters", locations: "testLocations", episodes: "testEpisodes")
                    self.presenter.result(result: menu)
                    
                    self.viewController.clickEpisodesButton()
                    
                    expect(self.navigationController.viewControllers.first is CharacterViewController).toEventually(beFalse())
                }
                
                it("when user used Episodes button") {
                    self.viewController.viewDidLoad()
                    
                    self.viewController.clickEpisodesButton()
                    
                    expect(self.navigationController.viewControllers.first is CharacterViewController).toEventually(beFalse())
                }
			}
		}
	}
}
