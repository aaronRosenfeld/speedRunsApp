//
//  CategoriesViewController.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import UIKit
import ReSwift

class CategoriesViewController: UIViewController, StoreSubscriber {
    typealias StoreSubscriberStateType = AppState
    
    var game: GameListable?
    
    var categories: [Category]?
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        mainStore.subscribe(self)
        if let game = game {
            mainStore.dispatch(getCategoriesThunk(game.id ?? ""))
        }
    }
    
    func newState(state: AppState) {
        categories = state.categories
        DispatchQueue.main.async { [unowned self] in
            self.tableView.reloadData()
        }
    }
    
    private func setupView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
}

extension CategoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name
        cell.detailTextLabel?.text = categories?[indexPath.row].rules
        return cell
    }
    
}
