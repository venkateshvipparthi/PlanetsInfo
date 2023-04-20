//
//  PlanetsViewModel.swift
//  PlanetsInfo
//
//  Created by Venkatesh Vipparthi on 19/04/2023.
//

import Foundation
@MainActor
class PlanetsViewModel:ObservableObject {
    
    
    @Published var planets:[Planet] = []
    @Published var error: NetworkAPIError?
    private let planetsRepository:PlanetsRepository
    
    init(planetsRepository: PlanetsRepository) {
        self.planetsRepository = planetsRepository
    }
}

extension PlanetsViewModel:PlanetsDataUseCase{
    func getDataForPlanetsList(for urlString: String) async {
        guard let url = URL(string: urlString) else{
            self.error = NetworkAPIError.invalidURL
            return
        }
        do{
            self.planets = try await planetsRepository.getPlanetsList(for: url)
        }catch{
            self.error = NetworkAPIError.dataNotFound
        }
    }
    
    
}
