//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Eduuard Pinzon on 3/07/23.
//

import UIKit


protocol MainViewProtocol: AnyObject {
    func result(result: Main)
}


class MainViewController: UIViewController {

    private var presenter: MainPresenterProtocol = MainPresenter()
    private var result: Main?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.loadApi()
    }
    
    @IBAction func clickCharactersButton() {
        print(self.result?.characters ?? String())
    }
    
    @IBAction func clickLocationsButton() {
        print(self.result?.locations ?? String())
    }
    
    @IBAction func clickEpisodesButton() {
        print(self.result?.episodes ?? String())
    }
}

extension MainViewController: MainViewProtocol {
    func result(result: Main) {
        self.result = result
    }
}

