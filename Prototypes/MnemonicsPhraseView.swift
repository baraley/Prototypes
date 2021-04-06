//
//  MnemonicsPhraseView.swift
//  kuailian_wallet_ios
//
//  Created by OLEKSANDR SEMENIUK on 04.01.2021.
//

import UIKit

class MnemonicsPhraseView: UIView {
  var cvMnemonics: UICollectionView = UICollectionView(
    frame: .zero, collectionViewLayout: LeftAlignedFlowLayout()
  )

  private let maxPhrasesNumber: Int = 20

  var mnemonicsPhrase: [String] =  [
    "mass", "mixture", "h", "what", "cute", "enable", "require", "economy", "behind", "welcome", "december", "argue"
  ]

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupUI()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)

    setupUI()
  }

  func setupUI() {
    self.layer.borderColor = UIColor.blue.cgColor
    self.layer.borderWidth = 1
    self.layer.cornerRadius = 4

    setupCollectionViewUI()
  }

  private var editingCellIndexPath: IndexPath? {
    didSet {
      print(editingCellIndexPath)
    }
  }
  private var editingCell: MnemonicCell? {
    if let indexPath = editingCellIndexPath {
      return cvMnemonics.cellForItem(at: indexPath) as? MnemonicCell
    } else {
      return nil
    }
  }
  private var measureCell: MnemonicCell = MnemonicCell.init(frame: .zero)

  private func setupCollectionViewUI() {
    cvMnemonics.register(MnemonicCell.self, forCellWithReuseIdentifier: MnemonicCell.identifier)
    cvMnemonics.dataSource = self
    cvMnemonics.delegate = self
    cvMnemonics.isScrollEnabled = false
    cvMnemonics.backgroundColor = UIColor.white
    cvMnemonics.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    cvMnemonics.frame = bounds

    if let layout = cvMnemonics.collectionViewLayout as? UICollectionViewFlowLayout {
      layout.sectionInset = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 20)
    }

    cvMnemonics.addGestureRecognizer(
      UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture(gesture:)))
    )
    cvMnemonics.addGestureRecognizer(
      UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
    )

    addSubview(cvMnemonics)
    cvMnemonics.reloadData()
  }

  override var intrinsicContentSize: CGSize {

    let minHeight: CGFloat = 150
    var size = cvMnemonics.contentSize
    size.height = size.height < minHeight ? minHeight : size.height
    return size
  }

  // MARK: Action
  @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
    guard let gestureView = gesture.view else { return }
    switch gesture.state {
    case .began:
      guard let selectedIndexPath = cvMnemonics.indexPathForItem(at: gesture.location(in: cvMnemonics)) else {
        break
      }
      editingCell?.isEditing = false
      cvMnemonics.beginInteractiveMovementForItem(at: selectedIndexPath)
    case .changed:
      cvMnemonics.updateInteractiveMovementTargetPosition(gesture.location(in: gestureView))
    case .ended:
      cvMnemonics.endInteractiveMovement()
    default:
      cvMnemonics.cancelInteractiveMovement()
    }
    cvMnemonics.collectionViewLayout.invalidateLayout()
    cvMnemonics.layoutIfNeeded()
  }

  @objc func handleTapGesture(gesture: UITapGestureRecognizer) {
    print("handleTapGesture")

    if mnemonicsPhrase.isEmpty {

      addNewCell()

    } else if var selectedIndexPath = cvMnemonics.indexPathForItem(at: gesture.location(in: cvMnemonics)) {

      if let editingIndexPath = editingCellIndexPath, editingIndexPath < selectedIndexPath, editingCell?.text.isEmpty == true {
        selectedIndexPath.item = selectedIndexPath.item - 1
      }
      editingCell?.isEditing = false
      editingCellIndexPath = selectedIndexPath
      editingCell?.isEditing = true

    } else if let cell = editingCell, cell.text.isEmpty {

      editingCell?.isEditing = false

    } else if editingCellIndexPath == nil {

      addNewCell()

    } else {

      editingCell?.isEditing = false
    }
  }
}

fileprivate extension MnemonicsPhraseView {

  func updateLayout() {

    cvMnemonics.collectionViewLayout.invalidateLayout()
    invalidateIntrinsicContentSize()
  }

  func indexPathOfCellWith(_ textField: UITextField) -> IndexPath? {
    let point = cvMnemonics.convert(textField.center, from: textField)

    return cvMnemonics.indexPathForItem(at: point)
  }

  func addNewCell(with text: String = "", at indexPath: IndexPath? = nil) {
    print("addNewCell")
    guard mnemonicsPhrase.count < maxPhrasesNumber else { return }

    editingCell?.isEditing = false

    let newCellIndexPath = indexPath ?? IndexPath(item: mnemonicsPhrase.count, section: 0)
    editingCellIndexPath = newCellIndexPath
    mnemonicsPhrase.insert(text, at: newCellIndexPath.item)
    cvMnemonics.insertItems(at: [newCellIndexPath])

    updateLayout()
    cvMnemonics.layoutIfNeeded()
  }

  func deleteEditingCell() {
    print("deleteEditingCell")
    guard let indexPath = editingCellIndexPath else { return }

    editingCellIndexPath = nil
    mnemonicsPhrase.remove(at: indexPath.item)
    cvMnemonics.deleteItems(at: [indexPath])
  }
}

// MARK: UICollectionViewDataSource
extension MnemonicsPhraseView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return mnemonicsPhrase.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MnemonicCell.identifier, for: indexPath)

    if let cell = cell as? MnemonicCell {
      cell.text = mnemonicsPhrase[indexPath.row]
      cell.delegate = self
    }
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
    return true
  }

  func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let temp = mnemonicsPhrase.remove(at: sourceIndexPath.item)
    mnemonicsPhrase.insert(temp, at: destinationIndexPath.item)

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {

      self.cvMnemonics.collectionViewLayout.invalidateLayout()

      UIView.animate(withDuration: 0.2) {
        self.layoutIfNeeded()
      }
    }
  }
}

// MARK: UICollectionViewDelegateFlowLayout

extension MnemonicsPhraseView: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    measureCell.text = mnemonicsPhrase[indexPath.row]

    var size = measureCell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    let sectionInset = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
    size.width = min(max(size.width, 20), collectionView.frame.inset(by: sectionInset).width)
    size.height = max(size.height, 23)
    return size
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    if let cell = cell as? MnemonicCell, indexPath == editingCellIndexPath {
      cell.isEditing = true
    }
    updateLayout()
  }

  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    updateLayout()
  }
}

extension MnemonicsPhraseView: MnemonicCellDelegate {

  func textField(_ textField: UITextField, textDidChange text: String) {
    print("textDidChange")

    guard let indexPath = indexPathOfCellWith(textField) else { return }

    mnemonicsPhrase[indexPath.item] = text

    updateLayout()
    cvMnemonics.layoutIfNeeded()
  }

  func textFieldDeleteInEmptyStringDidTap(_ textField: UITextField) {
    guard let indexPath = indexPathOfCellWith(textField) else { return }

    let previousIndexPath = IndexPath(item: indexPath.item - 1, section: 0)

    if let previousCell = cvMnemonics.cellForItem(at: previousIndexPath) as? MnemonicCell {
      editingCell?.isEditing = false

      editingCellIndexPath = previousIndexPath
      previousCell.isEditing = true
    }
  }

  func textFieldDidEndEditing(_ textField: UITextField) {
    print("textFieldDidEndEditing")

    guard let indexPath = indexPathOfCellWith(textField),
          let cell = cvMnemonics.cellForItem(at: indexPath) as? MnemonicCell else { return }

    if cell.text.isEmpty {
      deleteEditingCell()
    }
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    print("textFieldShouldReturn")

    guard let indexPath = indexPathOfCellWith(textField), textField.hasText else { return false }

    let nextItem = indexPath.item + 1

    guard nextItem < maxPhrasesNumber else { return false }

    addNewCell(at: IndexPath(item: nextItem, section: 0))

    return true
  }

  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    print("shouldChangeCharactersIn")

    guard let text = textField.text,
          let indexPath = indexPathOfCellWith(textField),
          let cell = cvMnemonics.cellForItem(at: indexPath) as? MnemonicCell else { return false }

    if string == " ", range.location == textField.text?.count {

      if textField.hasText, mnemonicsPhrase.count < maxPhrasesNumber {

        let nextIndexPath = IndexPath(item: indexPath.item + 1, section: 0)
        addNewCell(at: nextIndexPath)
      }

      return false

    } else if string == " " {

      let firstPartEndIndex = text.index(text.startIndex, offsetBy: range.location)
      let firstPart = String(text[..<firstPartEndIndex])

      let secondPart = String(text[firstPartEndIndex...])
      mnemonicsPhrase[indexPath.item] = firstPart
      cell.text = firstPart
      cell.isEditing = false

      let nextIndexPath = IndexPath(item: indexPath.item + 1, section: indexPath.section)
      addNewCell(with: secondPart, at: nextIndexPath)

      return false
    }

    return true
  }
}
