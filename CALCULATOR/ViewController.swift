//
//  ViewController.swift
//  CALCULATOR
//
//  Created by Алишер Батыр on 26.07.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var firstValue = true
    var subTotal: Int?
    
    //var lastOperator: operatorType?
    

    
    
    var plusIsTapped: Bool = false {
        didSet {
            if plusIsTapped == true {
                plusButton.backgroundColor = .white
                plusButton.setTitleColor(.systemOrange, for: .normal)
            }else{
                plusButton.backgroundColor = .systemOrange
                plusButton.setTitleColor(.white, for: .normal)
            }
        }
    }
    var minusIsTapped: Bool = false {
        didSet {
            if minusIsTapped == true {
                minusButton.backgroundColor = .white
                minusButton.setTitleColor(.systemOrange, for: .normal)
            }else{
                minusButton.backgroundColor = .systemOrange
                minusButton.setTitleColor(.white, for: .normal)
            }
        }
    }
    var multiplyIsTapped: Bool = false {
        didSet {
            if multiplyIsTapped == true {
                multiplyButton.backgroundColor = .white
                multiplyButton.setTitleColor(.systemOrange, for: .normal)
            }else{
                multiplyButton.backgroundColor = .systemOrange
                multiplyButton.setTitleColor(.white, for: .normal)
            }
        }
    }
    var dividedIsTapped: Bool = false {
        didSet {
            if dividedIsTapped == true {
                divideButton.backgroundColor = .white
                divideButton.setTitleColor(.systemOrange, for: .normal)
            }else{
                divideButton.backgroundColor = .systemOrange
                divideButton.setTitleColor(.white, for: .normal)
            }
        }
    }

    
    
    
    var plusIsActive: Bool = false
    var minusIsActive: Bool = false
    var multiplyIsActive: Bool = false
    var dividedIsActive: Bool = false
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var result: Double = 0
    
    
    
    
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
        button.setTitle("x", for: .normal)
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
    
    private func clearAllTapped(){
        minusIsTapped = false
        plusIsTapped = false
        multiplyIsTapped = false
        dividedIsTapped = false
        minusIsActive = false
        plusIsActive = false
        multiplyIsActive = false
        dividedIsActive = false
    }
    
    private func operationTap(){
        
    }
    
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
        
       
       
        dividedIsActive = true
        clearAllTapped()
        dividedIsTapped = true
    }
    @objc func tarSeven(sender: UIButton) {
        
        if plusIsTapped == true{
            plusIsTapped = false
            firstNumber = Double(calcText) ?? 0
            calcText = "7"
        } else {
            calcNumberFunc(number: "7")
        }
        
        secondNumber = Double (calcLabel.text!)!
        
        if sevenButton.isEnabled == true {
            sevenButton.backgroundColor = .lightGray
        } else {
            sevenButton.backgroundColor = .darkGray
        }
    }
    @objc func tarEigth() {
        if plusIsTapped == true{
            plusIsTapped = false
            firstNumber = Double(calcText) ?? 0
            calcText = "8"
        } else {
            calcNumberFunc(number: "8")
        }
        

        
        if eightButton.isEnabled == true {
            eightButton.backgroundColor = .lightGray
        } else {
            eightButton.backgroundColor = .darkGray
        }
    }
    @objc func tarNine() {
        
        if plusIsTapped == true{
            plusIsTapped = false
            firstNumber = Double(calcText) ?? 0
            calcText = "9"
        } else {
            calcNumberFunc(number: "9")
        }
        
        
        if nineButton.isEnabled == true {
            nineButton.backgroundColor = .lightGray
        } else {
            nineButton.backgroundColor = .darkGray
        }
    }
    @objc func tarMultiply() {
  
      
        multiplyIsActive = true
        clearAllTapped()
        multiplyIsTapped = true
    }
    @objc func tarFour() {
        if plusIsTapped == true{
            plusIsTapped = false
            firstNumber = Double(calcText) ?? 0
            calcText = "4"
        } else {
            calcNumberFunc(number: "4")
        }
        
        
        if fourButton.isEnabled == true {
            fourButton.backgroundColor = .lightGray
        } else {
            fourButton.backgroundColor = .darkGray
        }
    }
    @objc func tarFive() {
        
        if plusIsTapped == true{
            plusIsTapped = false
            firstNumber = Double(calcText) ?? 0
            calcText = "5"
        } else {
            calcNumberFunc(number: "5")
        }
        
        
        if fiveButton.isEnabled == true {
            fiveButton.backgroundColor = .lightGray
        } else {
            fiveButton.backgroundColor = .darkGray
        }
    }
    @objc func tarSix() {
        
        if plusIsTapped == true{
            plusIsTapped = false
            firstNumber = Double(calcText) ?? 0
            calcText = "6"
        } else {
            calcNumberFunc(number: "6")
        }
        
        if sixButton.isEnabled == true {
            sixButton.backgroundColor = .lightGray
        } else {
            sixButton.backgroundColor = .darkGray
        }
    }
    @objc func tarMinus() {
       
       
        minusIsActive = true
        clearAllTapped()
        minusIsTapped = true
        //calcLabel.text = "0"
        //operation = "-"
    
      
    }
    @objc func tarOne() {
        
        if plusIsTapped == true{
            plusIsTapped = false
            firstNumber = Double(calcText) ?? 0
            calcText = "1"
        } else {
            calcNumberFunc(number: "1")
        }
        
        if plusIsActive == true{
            plusIsTapped = false
            firstNumber = Double(calcText) ?? 0
            calcText = "1"
        } else {
            calcNumberFunc(number: "1")
        }
        
        if oneButton.isEnabled == true {
            oneButton.backgroundColor = .lightGray
        } else {
            oneButton.backgroundColor = .darkGray
        }
    }
    @objc func tarTwo(){
    
        if plusIsTapped == true{
            plusIsTapped = false
            firstNumber = Double(calcText) ?? 0
            calcText = "2"
        } else {
            calcNumberFunc(number: "2")
        }
        
        
        if twoButton.isEnabled == true {
            twoButton.backgroundColor = .lightGray
        } else {
            twoButton.backgroundColor = .darkGray
        }
    }
    @objc func tarThree() {
        if plusIsTapped == true {
            plusIsTapped = false
            firstNumber = Double(calcText) ?? 0
            calcText = "3"
        }else{
            calcNumberFunc(number: "3")
        }
        
        if threeButton.isEnabled == true {
            threeButton.backgroundColor = .lightGray
        } else {
            threeButton.backgroundColor = .darkGray
        }
    }
    @objc func tarPlus() {
        clearAllTapped()
        plusIsTapped = true
        plusIsActive = true
    }
    
    @objc func tarZero() {
        calcNumberFunc(number: "0")
        if plusIsTapped == true{
            plusIsTapped = false
            firstNumber = Double(calcText) ?? 0
            calcText = "0"
        }else{
            calcNumberFunc(number: "0")
        }
        
        if zeroButton.isEnabled == true {
            zeroButton.backgroundColor = .lightGray
        } else {
            zeroButton.backgroundColor = .darkGray
        }
        
    }
    @objc func tarComma(){
        if isPressed == false{
            calcNumberFunc(number: ",")
            isPressed = true
        }
        
        
        if commaButton.isEnabled == true {
            commaButton.backgroundColor = .lightGray
        } else {
            commaButton.backgroundColor = .darkGray
        }
    }
    @objc func tarEqual(){
        
        if plusIsActive == true {
            secondNumber = Double(calcText) ?? 0
            calcText = "\(firstNumber + secondNumber)"
            firstNumber = firstNumber + secondNumber
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
        
        //calcText.text = "0"
        
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

