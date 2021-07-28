//
//  ViewController.swift
//  CALCULATOR
//
//  Created by Алишер Батыр on 26.07.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var count: Double = 0.0
    
    var first = "0"
    var second = "0"
    var function = ""
    var result = 0.0
    var userInput = ""
    
    private var calcText: String = "0" {
        didSet {
            calcLabel.text = calcText
            if calcLabel.text != "0" {
                cleanButton.setTitle("C", for: .normal)
            }else{
                cleanButton.setTitle("AC", for: .normal)
            }
        }
    }
    
    
    private var isPressed: Bool = false

    private let calcLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "0" 
        label.font = .systemFont(ofSize: 65)
        return label
    }()
    
    lazy var cleanButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("AC", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tarClean), for: .touchUpInside)
        return button
    }()
    
    lazy var plusMinusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("+/-", for: . normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tarPlusMinus), for: .touchUpInside)
        return button
    }()
    
    lazy var persentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("%", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tarPersent), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()
    
    lazy var divideButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("/", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.addTarget(self, action: #selector(tarDivide), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    lazy var sevenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("7", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarSeven), for: .touchUpInside)
        button.tintColor = .white
        button.tag = 7
        return button
    }()
    
    lazy var eightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("8", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarEigth), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    lazy var nineButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("9", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarNine), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    lazy var multiplyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("*", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarMultiply), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    lazy var fourButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("4", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarFour), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    lazy var fiveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("5", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.layer.cornerRadius = 35
        button.addTarget(self, action: #selector(tarFive), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    lazy var sixButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("6", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarSix), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("-", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarMinus), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    
    lazy var oneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("1", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarOne), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    lazy var twoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("2", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self , action: #selector(tarTwo), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    lazy var threeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("3", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarThree), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarPlus), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    lazy var zeroButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("0", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarZero), for: .touchUpInside)
        return button
    }()
    lazy var commaButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle(",", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarComma), for: .touchUpInside)
        return button
    }()
    lazy var equalsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("=", for: .normal)
        button.layer.cornerRadius = 35
        button.titleLabel?.font = .systemFont(ofSize: 33)
        button.addTarget(self, action: #selector(tarEqual), for: .touchUpInside)
        return button
    }()
    
    
    @objc func tarClean(){
        calcText = "0"
        isPressed = false
    }
    @objc func tarPlusMinus() {
        guard var text = calcLabel.text else {return}
        var newText: String = ""
        if text.starts(with: "-") {
            newText = text.replacingOccurrences(of: "-", with: "")
        }else{
            text.insert("-", at: text.startIndex)
            newText = text
        }
        calcLabel.text = newText
    }
    
    @objc func tarPersent() {
        var number = Double(calcLabel.text ?? "0")
        number = (number ?? 0) / 100
        calcLabel.text = "\(number ?? 0)"
    }
    
    @objc func tarDivide() {
        function = "/"
        first = calcText
        calcText = ""
    }
    
    @objc func tarSeven() {
        calcNumberFunc(number: "7")
        
        
        if sevenButton.isEnabled == true {
            sevenButton.backgroundColor = .lightGray
        } else {
            sevenButton.backgroundColor = .darkGray
        }
    }
    @objc func tarEigth() {
        calcNumberFunc(number: "8")
    }
    @objc func tarNine() {
        calcNumberFunc(number: "9")
    }
    @objc func tarMultiply() {
        function = "*"
        first = userInput
        userInput = ""
    }
    @objc func tarFour() {
        calcNumberFunc(number: "4")
    }
    @objc func tarFive() {
        calcNumberFunc(number: "5")
    }
    @objc func tarSix() {
        calcNumberFunc(number: "6")
    }
    @objc func tarMinus() {
        function = "-"
        first = userInput
        userInput = ""
    }
    @objc func tarOne() {
        calcNumberFunc(number: "1")
    }
    @objc func tarTwo(){
        calcNumberFunc(number: "2")
    }
    @objc func tarThree() {
        calcNumberFunc(number: "3")
    }
    @objc func tarPlus() {
        function = "+"
        first = userInput
        userInput = ""
    }
    
    @objc func tarZero() {
        calcNumberFunc(number: "0")
    }
    @objc func tarComma(){
        if isPressed == false{
            calcNumberFunc(number: ",")
            isPressed = true
        }
    }
    @objc func tarEqual(){
        
        second = userInput
        
        var firstInput = 0.0
        var secondInput = 0.0
        firstInput = Double(first)!
        secondInput = Double(second)!
        if(function == "+")
        {
            result  = (firstInput + secondInput)
            calcLabel.text = String(result)
        }
        else if (function == "-")
        {
           result = (firstInput - secondInput)
            calcLabel.text = String(result)
        }
        else if(function == "*")
        {
          result = (firstInput * secondInput)
            calcLabel.text = String(result)
        }
        else
        {
           result = (firstInput / secondInput)
            calcLabel.text = String(result)
        }
        
    }
    
    private func calcNumberFunc(number: String?){
        if calcText == "0" {
            calcText = number ?? "0"
        }else{
            calcText.append(number ?? "")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
        setupConstraints()
    }
    
    func setupView(){
        view.addSubview(calcLabel)
        view.addSubview(cleanButton)
        view.addSubview(plusMinusButton)
        view.addSubview(persentButton)
        view.addSubview(divideButton)
        view.addSubview(sevenButton)
        view.addSubview(eightButton)
        view.addSubview(nineButton)
        view.addSubview(multiplyButton)
        view.addSubview(fourButton)
        view.addSubview(fiveButton)
        view.addSubview(sixButton)
        view.addSubview(minusButton)
        view.addSubview(oneButton)
        view.addSubview(twoButton)
        view.addSubview(threeButton)
        view.addSubview(plusButton)
        view.addSubview(zeroButton)
        view.addSubview(commaButton)
        view.addSubview(equalsButton)
    }
    
    
    func setupConstraints(){
        calcLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.right.equalToSuperview().inset(10)
        }
        cleanButton.snp.makeConstraints { (make) in
            make.top.equalTo(calcLabel.snp.top).inset(150)
            make.size.equalTo(70)
            make.left.equalToSuperview().inset(20)
        }
        plusMinusButton.snp.makeConstraints { (make) in
            make.top.equalTo(calcLabel.snp.top).inset(150)
            make.size.equalTo(70)
            make.left.equalTo(cleanButton.snp.right).offset(20)
        }
        persentButton.snp.makeConstraints { (make) in
            make.top.equalTo(calcLabel.snp.top).inset(150)
            make.size.equalTo(70)
            make.left.equalTo(plusMinusButton.snp.right).offset(20)
        }
        divideButton.snp.makeConstraints { (make) in
            make.top.equalTo(calcLabel.snp.top).inset(150)
            make.size.equalTo(70)
            make.left.equalTo(persentButton.snp.right).offset(20)
        }
        sevenButton.snp.makeConstraints { (make) in
            make.top.equalTo(cleanButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalToSuperview().inset(20)
        }
        
        eightButton.snp.makeConstraints { (make) in
            make.top.equalTo(cleanButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalTo(sevenButton.snp.right).offset(20)
        }
        nineButton.snp.makeConstraints { (make) in
            make.top.equalTo(cleanButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalTo(eightButton.snp.right).offset(20)
        }
        multiplyButton.snp.makeConstraints { (make) in
            make.top.equalTo(cleanButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalTo(nineButton.snp.right).offset(20)
        }
        fourButton.snp.makeConstraints { (make) in
            make.top.equalTo(sevenButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalToSuperview().inset(20)
        }
        fiveButton.snp.makeConstraints { (make) in
            make.top.equalTo(sevenButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalTo(fourButton.snp.right).offset(20)
        }
        sixButton.snp.makeConstraints { (make) in
            make.top.equalTo(sevenButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalTo(fiveButton.snp.right).offset(20)
        }
        minusButton.snp.makeConstraints { (make) in
            make.top.equalTo(sevenButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalTo(sixButton.snp.right).offset(20)
        }
        
        oneButton.snp.makeConstraints { (make) in
            make.top.equalTo(minusButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalToSuperview().inset(20)
        }
        twoButton.snp.makeConstraints { (make) in
            make.top.equalTo(minusButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalTo(oneButton.snp.right).offset(20)
        }
        threeButton.snp.makeConstraints { (make) in
            make.top.equalTo(minusButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalTo(twoButton.snp.right).offset(20)
        }
        plusButton.snp.makeConstraints { (make) in
            make.top.equalTo(minusButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalTo(threeButton.snp.right).offset(20)
        }
        
        zeroButton.snp.makeConstraints { (make) in
            make.top.equalTo(plusButton.snp.bottom).offset(20)
            make.width.equalTo(160)
            make.height.equalTo(70)
            make.left.equalToSuperview().inset(20)
        }
        commaButton.snp.makeConstraints { (make) in
            make.top.equalTo(plusButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalTo(zeroButton.snp.right).offset(20)
        }
        equalsButton.snp.makeConstraints { (make) in
            make.top.equalTo(plusButton.snp.bottom).offset(20)
            make.size.equalTo(70)
            make.left.equalTo(commaButton.snp.right).offset(20)
        }
        
    }

}

