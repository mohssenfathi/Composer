//
//  PagingView.swift
//  BabyPlayHacks
//
//  Created by Mohssen Fathi on 8/15/19.
//

import UIKit

class HorizontalScrollingView: BaseView, ItemConfigurableView {
    typealias Item = HorizontalScrollingItem
    
    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()
    private let stackView = UIStackView()
    private let leftArrowButton = UIButton(type: .system)
    private let rightArrowButton = UIButton(type: .system)
    private var pageSize: CGSize?
    private let seeAllButton = UIButton(type: .system)
    private let seeAllStack = UIStackView()
    private var seeAllHandler: (() -> ())?
    
    deinit {
        seeAllHandler = nil
    }
    
    override func setup() {
        super.setup()

        layer.masksToBounds = false
        clipsToBounds = false
        backgroundColor = .clear
        
        stackView.axis = .vertical
        
        scrollView.layer.masksToBounds = false
        scrollView.clipsToBounds = false
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
        
        leftArrowButton.isHidden = true
        leftArrowButton.tintColor = .white
        leftArrowButton.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        leftArrowButton.addTarget(self, action: #selector(pageLeft(_:)), for: .touchUpInside)
        
        rightArrowButton.tintColor = .white
        rightArrowButton.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        rightArrowButton.addTarget(self, action: #selector(pageRight(_:)), for: .touchUpInside)
        
        seeAllButton.setTitle("See All ›", for: .normal)
        seeAllButton.contentHorizontalAlignment = .right
        seeAllButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        seeAllButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        seeAllButton.addTarget(self, action: #selector(seeAll(_:)), for: .touchUpInside)
        if #available(iOS 13.0, *) {
            seeAllButton.tintColor = .label
        } else {
            seeAllButton.tintColor = .black
        }
        
        let spacer = UIView()
        spacer.backgroundColor = .clear
        
        seeAllStack.isHidden = true
        seeAllStack.addArrangedSubview(seeAllButton)
        seeAllStack.addArrangedSubview(spacer)
        seeAllStack.axis = .horizontal
        
        stackView.embed(in: self)
        stackView.addArrangedSubview(seeAllStack)
        stackView.addArrangedSubview(scrollView)
        
        addSubview(leftArrowButton)
        addSubview(rightArrowButton)
    }
    
    override func layoutConstraints() {
        super.layoutConstraints()
        
        var constraints: [NSLayoutConstraint] = []
        
        leftArrowButton.translatesAutoresizingMaskIntoConstraints = false
        constraints += leftArrowButton.leftAnchor.constraint(equalTo: leftAnchor)
        constraints += leftArrowButton.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        
        rightArrowButton.translatesAutoresizingMaskIntoConstraints = false
        constraints += rightArrowButton.rightAnchor.constraint(equalTo: rightAnchor)
        constraints += rightArrowButton.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Configuration
    @discardableResult
    func configure(with item: HorizontalScrollingItem) -> Self {
        return configure(with: item, pages: [])
    }
    
    @discardableResult
    func configure(with item: HorizontalScrollingItem, pages: [UIView]) -> Self {
        self.pages = pages
        self.isArrowNavigationEnabled = item.isArrowNavigationEnabled
        self.pageSize = item.pageSize
        self.seeAllHandler = item.seeAllHandler
        
        if let pageLimit = item.pageLimit, pageLimit < pages.count {
            seeAllStack.isHidden = false
            self.pages = Array(pages[0 ..< pageLimit])
        }
        
        if item.isArrowNavigationEnabled {
            leftArrowButton.isEnabled = true
            rightArrowButton.isEnabled = true
//            leftArrowButton.setImage(XFDesign.global.icons.imageOfIconstrokechevronleft().withRenderingMode(.alwaysTemplate), for: .normal)
//            rightArrowButton.setImage(XFDesign.global.icons.imageOfIconstrokechevronright().withRenderingMode(.alwaysTemplate), for: .normal)
        } else {
            leftArrowButton.isEnabled = false
            rightArrowButton.isEnabled = false
            leftArrowButton.setImage(nil, for: .normal)
            rightArrowButton.setImage(nil, for: .normal)
        }
        
        if pages.count < 2 || item.isPageControlHidden {
            stackView.removeArrangedSubview(pageControl)
            pageControl.removeFromSuperview()
        } else {
            pageControl.numberOfPages = item.items.count
            stackView.addArrangedSubview(pageControl)
        }
        
        scrollView.isPagingEnabled = item.isPagingEnabled
        scrollView.bounces = item.isBounceEnabled
        
        layoutPages()
        updateScrollView()
        
        return self
    }
    
    // MARK: - Paging
    @objc func pageLeft(_ sender: UIButton) {
        
        // Already on first page
        guard !isAnimatingScroll, scrollView.contentOffset.x > 0 else {
            return
        }
        
        isAnimatingScroll = true
        
        var offset = scrollView.contentOffset
        offset.x -= scrollView.bounds.width
        scrollView.setContentOffset(offset, animated: true)
    }
    
    @objc func pageRight(_ sender: UIButton) {

        // Already on last page
        let maxOffset = scrollView.contentSize.width - scrollView.bounds.width
        guard !isAnimatingScroll, scrollView.contentOffset.x < maxOffset else {
            return
        }
        
        isAnimatingScroll = true
        
        var offset = scrollView.contentOffset
        offset.x += scrollView.bounds.width
        scrollView.setContentOffset(offset, animated: true)
    }
    
    @objc func pageControlValueChanged(_ sender: UIPageControl) {
        let x = CGFloat(sender.currentPage) * scrollView.bounds.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
    @objc func seeAll(_ sender: UIButton) {
        seeAllHandler?()
    }
    
    // MARK: - Layout
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        scrollView.contentSize = CGSize(
            width: CGFloat(pages.count) * (pageSize?.width ?? scrollView.bounds.width),
            height: (pageSize?.height ?? scrollView.bounds.height)
        )
    }
    
    private func layoutPages() {
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        
        // Add pages to scrollView, add constraints
        var previousAnchor: NSLayoutAnchor = scrollView.leftAnchor
        pages.forEach { page in
            scrollView.addSubview(page)
            
            page.clipsToBounds = true
            page.translatesAutoresizingMaskIntoConstraints = false
            
            let widthConstraint: NSLayoutConstraint
            let heightConstraint: NSLayoutConstraint
            if let pageSize = pageSize {
                widthConstraint = page.widthAnchor.constraint(equalToConstant: pageSize.width)
                heightConstraint = page.heightAnchor.constraint(equalToConstant: pageSize.height)
            } else {
                widthConstraint = page.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
                heightConstraint = page.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            }
            let centerConstraint = page.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
            let leftConstraint = page.leftAnchor.constraint(equalTo: previousAnchor, constant: 0)
            
            NSLayoutConstraint.activate([centerConstraint, widthConstraint, heightConstraint, leftConstraint])
            
            previousAnchor = page.rightAnchor
        }
        
        if let pageSize = pageSize {
            scrollView.heightAnchor.constraint(equalToConstant: pageSize.height).isActive = true
        }
    }
    
    /// Calculates the current page of the scrollView and updates the page control
    /// Shows/hides the left/right arrows if necessary
    private func updateScrollView() {
        guard scrollView.bounds.width > 0 else { return }
        
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        pageControl.currentPage = page
        
        leftArrowButton.isHidden = !isArrowNavigationEnabled || page == 0
        rightArrowButton.isHidden = !isArrowNavigationEnabled || page == pages.count - 1
    }
    
    private var isArrowNavigationEnabled: Bool = false
    private var isAnimatingScroll: Bool = false // A flag to prevent the user from spamming the arrow buttons
    private var pages: [UIView] = []
}

extension HorizontalScrollingView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updateScrollView()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        isAnimatingScroll = false
        updateScrollView()
    }
}
