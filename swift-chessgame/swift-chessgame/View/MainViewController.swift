//
//  ViewController.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import UIKit
import Combine

class MainViewController: UIViewController {

    typealias DataSource = UICollectionViewDiffableDataSource<SectionViewModel, ChessCellViewModel>
    
    @IBOutlet weak var collectionView: UICollectionView!

    private lazy var dataSource: DataSource = configureDataSouce()
    private var viewModel: MainViewModel!
    private var cancelBag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MainViewModel()
        initCombine()
        initCollectionView()
        applySnapshot()
    }

    //MARK: InitCollectionView
    
    private func initCollectionView() {
        collectionView.delegate = self
        collectionView.collectionViewLayout = configureLayout()
        
        collectionView.register(UINib(nibName: "ChessPieceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ChessPieceCollectionViewCell")
    }
    
    private func configureLayout() -> UICollectionViewLayout {
        let compositionalLayout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            let inset: CGFloat = 4
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalWidth(1/8))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitem: item,
                                                           count: 8)
            // Section
            let section = NSCollectionLayoutSection(group: group)
            let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: "background")
            section.decorationItems = [backgroundItem]
            return section
        })
        
        compositionalLayout.register(BackgroundSupplementaryView.self, forDecorationViewOfKind: "background")
        return compositionalLayout
    }
    
    private func configureDataSouce() -> DataSource {
        let dataSource = UICollectionViewDiffableDataSource<SectionViewModel, ChessCellViewModel>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, cellViewModel: ChessCellViewModel) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChessPieceCollectionViewCell", for: indexPath) as? ChessPieceCollectionViewCell
            else {
                return  collectionView.dequeueReusableCell(withReuseIdentifier: "ChessPieceCollectionViewCell", for: indexPath)
            }
            
            cell.configure(viewModel: cellViewModel)
            
            return cell
        }
        
        return dataSource
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionViewModel, ChessCellViewModel>()

        snapshot.appendSections(viewModel.sectionViewModels)
        
        viewModel.sectionViewModels.forEach({
            snapshot.appendItems($0.cellViewModels, toSection: $0)
        })
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func initCombine() {
        viewModel.$sectionViewModels.dropFirst().receive(on: DispatchQueue.main).sink{ [weak self] _ in
            guard let sself = self else { return }
            sself.applySnapshot()
        }.store(in: &cancelBag)
        
        viewModel.$error.dropFirst().receive(on: DispatchQueue.main).sink{ [weak self] error in
            print("Error")
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cellViewModel = dataSource.itemIdentifier(for: indexPath) else { return }
        viewModel.didSelectCell(cellViewModel: cellViewModel)
    }
}

