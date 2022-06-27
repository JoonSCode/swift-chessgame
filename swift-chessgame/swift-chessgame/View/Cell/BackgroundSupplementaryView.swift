//
//  BackgroundSupplementaryView.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/27.
//

import UIKit

final class BackgroundSupplementaryView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
