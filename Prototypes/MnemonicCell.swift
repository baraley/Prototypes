//
//  MnemonicsPhraseView.swift
//  kuailian_wallet_ios
//
//  Created by OLEKSANDR SEMENIUK on 04.01.2021.
//

import UIKit

protocol MnemonicCellDelegate: UITextFieldDelegate {
  
  func textField(_ textField: UITextField, textDidChange text: String)
  func textFieldDeleteInEmptyStringDidTap(_ textField: UITextField)
}

class MnemonicCell: UICollectionViewCell {
  static let identifier: String = String(describing: MnemonicCell.self)
  
  private let svContainer: UIStackView = UIStackView()
  private let tfText: PasteLessTextField = .init()
  private let lbText: UILabel = UILabel()
  
  weak var delegate: MnemonicCellDelegate? { didSet { tfText.delegate = delegate } }

  var isEditing: Bool = false {
    didSet {
      updateUI()
    }
  }
  
  var text: String {
    get {
      tfText.text ?? ""
    } set {
      tfText.text = newValue
      lbText.text = newValue
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    updateUI()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func setupUI() {
    
    lbText.textAlignment = .center
    
    tfText.borderStyle = .none
    tfText.delegate = delegate
    tfText.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    tfText.textAlignment = .center
    tfText.autocapitalizationType = .none
	tfText.autocorrectionType = .no
    
    svContainer.alignment = .center
    svContainer.addArrangedSubview(tfText)
    svContainer.addArrangedSubview(lbText)
    svContainer.translatesAutoresizingMaskIntoConstraints = false
    
    contentView.backgroundColor = UIColor(white: 0.9, alpha: 1)
    contentView.layer.borderWidth = 1
    contentView.layer.borderColor = UIColor.lightGray.cgColor
    contentView.layer.cornerRadius = 10
    contentView.addSubview(svContainer)
    
    NSLayoutConstraint.activate([
      svContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
      svContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
      svContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
      svContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)
    ])
  }
  
  private func updateUI() {
    
    lbText.isHidden = isEditing
    tfText.isHidden = !isEditing
    contentView.backgroundColor = isEditing ? .white : .init(white: 0.9, alpha: 1)
    
    if isEditing {
      tfText.becomeFirstResponder()
    } else {
      tfText.resignFirstResponder()
    }
  }
  
  @objc private func textDidChange() {
    lbText.text = tfText.text
    delegate?.textField(tfText, textDidChange: tfText.text ?? "")
  }
}

class PasteLessTextField: UITextField {
  override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
    return action == #selector(UIResponderStandardEditActions.paste(_:)) ?
      false : super.canPerformAction(action, withSender: sender)
  }

  override func deleteBackward() {

    if hasText {
      super.deleteBackward()
    } else {
      (delegate as? MnemonicCellDelegate)?.textFieldDeleteInEmptyStringDidTap(self)
    }

    print("deleteBackward")
  }
}
