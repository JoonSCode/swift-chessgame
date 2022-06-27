//
//  ChessPieceCollectionViewCell.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/27.
//

import UIKit

class ChessPieceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var pieceLabel: UILabel!
    
    private var viewModel: ChessCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.cornerRadius = 5
        backgroundColor = .white
    }
    
    func configure(viewModel: ChessCellViewModel) {
        self.viewModel = viewModel
        pieceLabel.text = viewModel.piece.value
        layer.borderColor = viewModel.isMovableLocation ? UIColor.black.cgColor : UIColor.clear.cgColor
    }
}
