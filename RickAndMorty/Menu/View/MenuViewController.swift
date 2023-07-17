//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Eduuard Pinzon on 3/07/23.
//

import UIKit


protocol MenuViewProtocol: AnyObject {
    func result(result: Menu)
}


class MenuViewController: UIViewController {

    var presenter: MenuPresenterProtocol = MenuPresenter()
    private var result: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.loadApi()
    }
    
    @IBAction func clickCharactersButton() {
        guard let urlCharacters = self.result?.characters else { return }
        self.loadModule(module: Constanst.View.StoryBoards.character, url: urlCharacters)
    }
    
    @IBAction func clickLocationsButton() {
        print(self.result?.locations ?? String())
    }
    
    @IBAction func clickEpisodesButton() {
        print(self.result?.episodes ?? String())
    }
    
    private func loadModule(module: String, url: String) {
        let storyboard = UIStoryboard(name: module, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: module)
        
        if let viewController = vc as? ViewControllerProtocol {
            viewController.url = url
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MenuViewController: MenuViewProtocol {
    func result(result: Menu) {
        self.result = result
    }
}

