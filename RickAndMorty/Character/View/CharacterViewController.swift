//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Eduuard Pinzon on 3/07/23.
//

import UIKit

protocol CharacterViewProtocol: ViewControllerProtocol {
    func loadCharacters(characters: [Character])
}


class CharacterViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.estimatedRowHeight = 134
        }
    }
    
    var presenter: CharacterPresenterProtocol = CharacterPresenter()
    var url: String?
    
    private var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.getCharacters(url: self.url ?? String())
    }
    
    
    private func registerCell() {
        tableView.register(UINib(nibName: Constanst.View.Cells.character, bundle: nil), forCellReuseIdentifier: Constanst.View.Cells.character)
    }
    
}

extension CharacterViewController: CharacterViewProtocol {
    
    func loadCharacters(characters: [Character]) {
        self.characters = characters
        self.tableView.reloadData()
    }
}


extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constanst.View.Cells.character) as? CharacterCell else {
            return UITableViewCell()
        }
        
        let character = self.characters[indexPath.row]
        cell.loadCharecter(character: character)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
}
