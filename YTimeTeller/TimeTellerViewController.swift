//
//  ViewController.swift
//  TimeTeller
//
//  Created by Yohannes on 5/22/23.
//

import UIKit

public class TimeTellerViewController: UIViewController {

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 27, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "HI 👋🏾"
        return label
    }()
    
    private let tellMeBtn: UIButton = {
        let button = UIButton()
        button.setTitle("WHAT TIME IS IT NOW?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews(){
        view.backgroundColor = .black
        view.addSubview(timeLabel)
        view.addSubview(tellMeBtn)
        tellMeBtn.addTarget(self, action: #selector(tellMeTapped), for: .touchUpInside)
        applyConstraints()
    }
    
    private func applyConstraints(){
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        tellMeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let timeConstraints = [
            timeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            timeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            timeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            timeLabel.heightAnchor.constraint(equalToConstant: 120)
        ]
        
        let tellMeConstraints = [
            tellMeBtn.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 80),
            tellMeBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            tellMeBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            tellMeBtn.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(timeConstraints)
        NSLayoutConstraint.activate(tellMeConstraints)
    }
    
    @objc
    func tellMeTapped(){
        tellTime()
    }
    
    private func tellTime(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        timeLabel.text = "\(hour):\(minutes)"
    }

}

