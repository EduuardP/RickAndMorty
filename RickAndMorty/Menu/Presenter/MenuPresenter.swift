//
//  MainPresenter.swift
//  RickAndMorty
//
//  Created by Eduuard Pinzon on 3/07/23.
//

protocol MenuPresenterProtocol: AnyObject {
    func loadApi()
    func result(result: Menu)
    var view: MenuViewProtocol? { set get}
}

class MenuPresenter: MenuPresenterProtocol {
    
    private var model: MenuModelProtocol
    var view: MenuViewProtocol?
    
    init(model: MenuModelProtocol = MenuModel()) {
        self.model = model
        self.model.presenter = self
    }
    
    func loadApi() {
        self.model.loadApi()
    }
    
    func result(result: Menu) {
        self.view?.result(result: result)
    }
}
