//
//  MainPresenter.swift
//  RickAndMorty
//
//  Created by Eduuard Pinzon on 3/07/23.
//

protocol MainPresenterProtocol: AnyObject {
    func loadApi()
    func result(result: Main)
    var view: MainViewProtocol? { set get}
}

class MainPresenter: MainPresenterProtocol {
    
    private var model: MainModelProtocol
    var view: MainViewProtocol?
    
    init(model: MainModelProtocol = MainModel()) {
        self.model = model
        self.model.presenter = self
    }
    
    func loadApi() {
        self.model.loadApi()
    }
    
    func result(result: Main) {
        self.view?.result(result: result)
    }
}
