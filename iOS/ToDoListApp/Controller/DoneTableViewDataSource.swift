//
//  DoneTableViewDataSource.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/08.
//

import Foundation
import UIKit

class DoneTableViewDataSource: NSObject, UITableViewDataSource {
    var cardManager = CardManager.shared
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cardManager.count(states: .Done)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell") as? CardCell
        else {
            return UITableViewCell()
        }
        
        cardManager.setCell(states: .Done, index: indexPath.section) { card in
            cell.title.text = card.title
            cell.contents.text = card.body
            cell.author.text = card.author
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let index = tableView.numberOfSections - indexPath.section - 1
            cardManager.remove(states: .Done, at: index)
            tableView.reloadData()
        }
    }
}
