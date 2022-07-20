//
//  FilterOptionsView.swift
//  GitAPI
//
//  Created by Miran Hrupački on 20.07.2022..
//

import UIKit

@objc protocol FilterOptionsViewDelegate: AnyObject {
    func filterOptionSelected(btnTag: Int)
    func filterButtonTapped(_ sender: UIButton)
}

class FilterOptionsView: UIView {
    @IBOutlet var buttons: [UIButton]!
    var selectedFilter = 0
    var xibView: UIView!
    weak var delegate: FilterOptionsViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibView.translatesAutoresizingMaskIntoConstraints = true
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        xibView.frame = self.bounds
    }
    
    func setButtonsTitle(titles: [String]) {
        var index = 0

        for button in buttons {
            button.setTitle(titles[index], for: .normal)
            index += 1
        }
    }
    
    private func commonInit() {
        xibView = Bundle.main.loadNibNamed("FilterOptionsView", owner: self, options: nil)?[0] as? UIView
        self.addSubview(xibView)
        buttons.forEach({
            $0.layer.cornerRadius = $0.frame.height/2
            $0.backgroundColor = UIColor.white
        })
        buttons[0].backgroundColor = UIColor.white
        buttons[0].setTitleColor(UIColor.systemOrange, for: .normal)
    }
    
    @IBAction func filterOptionButtonPressed(_ sender: UIButton) {
        selectButton(sender)
        selectedFilter = sender.tag
        delegate?.filterOptionSelected(btnTag: sender.tag)
        delegate?.filterButtonTapped(sender)
    }
    
    func selectButton(_ sender: UIButton) {
        for button in buttons {
            button.setTitleColor(UIColor.darkGray, for: .normal)
            button.backgroundColor = UIColor.white
        }
        sender.setTitleColor(UIColor.systemOrange, for: .normal)

        sender.backgroundColor = UIColor.white
    }
    
    func resetFilters() {
        for button in buttons {
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.setTitleColor(UIColor.darkGray, for: .normal)

            button.backgroundColor = UIColor.white
        }
    }
}
