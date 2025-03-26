//
//  SecondVCInteractor.swift
//  RIBS
//
//  Created by ADMIN on 3/25/25.
//

import RIBs
import Combine

protocol SecondVCRouting: ViewableRouting {
}

protocol SecondVCPresentable: Presentable {
    var listener: SecondVCPresentableListener? { get set }
    func updateDataFaq(_ faqCategories: [FAQCategory])
}

protocol SecondVCListener: AnyObject {
}

final class SecondVCInteractor: PresentableInteractor<SecondVCPresentable>, SecondVCInteractable, SecondVCPresentableListener {
    func toggleDescription(at indexpath: IndexPath) {
        self.faqCategories[indexpath.section].contents?[indexpath.row].isShowDescription.toggle()
        self.presenter.updateDataFaq(faqCategories)
    }
    
    weak var router: SecondVCRouting?
    weak var listener: SecondVCListener?
    
    private var faqCategories: [FAQCategory] = []
    private var cancellables = Set<AnyCancellable>()

    override init(presenter: SecondVCPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        loadFAQData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error loading FAQ data: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { categories in
                self.faqCategories = categories
                self.presenter.updateDataFaq(categories)
            })
            .store(in: &cancellables)

    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    private func loadFAQData() -> AnyPublisher<[FAQCategory], Error> {
        Future<[FAQCategory], Error> { promise in
            DispatchQueue.global(qos: .background).async {
                if let url = Bundle.main.url(forResource: "faq_data", withExtension: "json") {
                    do {
                        let data = try Data(contentsOf: url)
                        let decoder = JSONDecoder()
                        let faqData = try decoder.decode([FAQCategory].self, from: data)
                        promise(.success(faqData))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
