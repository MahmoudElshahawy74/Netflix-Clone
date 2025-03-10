//
//  SearchResultsViewController.swift
//  Netflix Clone
//
//  Created by Mahmoud Elshahawy on 30/07/2024.
//

import UIKit

protocol SearchResultsViewControllerDelegate: AnyObject {
    
    func SearchResultsViewControllerDidTapItem(_ viewModel: TitlePreviewViewModel)
}

class SearchResultsViewController: UIViewController {

    
    public var titles: [Title] = [Title]()
    
    public weak var delegate: SearchResultsViewControllerDelegate?
    
    public let SearchResultsCollectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        
        return collectionView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(SearchResultsCollectionView)
        
        SearchResultsCollectionView.delegate = self
        SearchResultsCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        SearchResultsCollectionView.frame = view.bounds
    }
    
}


extension SearchResultsViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        //cell.backgroundColor = .blue
        
        let title = titles[indexPath.row]
        cell.configure(with: title.posterPath ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let title = titles[indexPath.row]
        let titleName = title.originalTitle ?? ""
        APICaller.shared.getMovie(with: titleName) { [ weak self ] result in
            switch result {
            case .success(let videoElement):
                self?.delegate?.SearchResultsViewControllerDidTapItem(TitlePreviewViewModel(title: title.originalTitle ?? "", youtubeView: videoElement, titleOverview: title.overview ?? ""))
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
}
