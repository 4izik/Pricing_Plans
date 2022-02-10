//
//  ViewController.swift
//  Pricing_Plans
//
//  Created by Настя on 09.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    let period = ["6 месяцев","1 месяц","Навсегда"]
    let price = ["1990 руб.","499 руб.","4999 руб."]
    let options = ["Пробный период три дня, бесплатная отмена","Ежемесячная подписка","Один платеж"]

    @IBOutlet weak var appLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Setup View
    
    private func setupUI() {
        subscribeButton.clipsToBounds = true
        subscribeButton.layer.cornerRadius = 25
        
        if UIScreen.main.bounds.height < 700 {
            appLabelTopConstraint.constant = 15
        } else {
            appLabelTopConstraint.constant = 45
        }
    }

}
// MARK: - TableView Delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.priceLabel.text = price[indexPath.row]
        cell.optionLabel.text = options[indexPath.row]
        cell.periodLabel.text = period[indexPath.row]
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        selectCell(cell: cell)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        deselectCell(cell: cell)
    }
    
    private func selectCell(cell: TableViewCell) {
        cell.view.backgroundColor = UIColor(red: 0.14, green: 0.85, blue: 0.47, alpha: 1)
        cell.contentView.backgroundColor = .white
        cell.optionLabel.textColor = .black
        cell.pathImageView.isHidden = false
        cell.leftPathConstraint.constant = 15
    }
    
    private func deselectCell(cell: TableViewCell) {
        cell.view.backgroundColor = UIColor(red: 0.93, green: 0.94, blue: 0.95, alpha: 1)
        cell.optionLabel.textColor = UIColor(red: 0.43, green: 0.47, blue: 0.52, alpha: 1)
        cell.pathImageView.isHidden = true
        cell.leftPathConstraint.constant = -5
    }
    
}
