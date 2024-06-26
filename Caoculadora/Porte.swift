//
//  Porte.swift
//  Caoculadora
//
//  Created by Ana Elizabeth Bastos de Mendonça on 13/05/24.
//

import Foundation

enum Porte: String, CaseIterable {
    case pequeno = "Pequeno", médio = "Médio", grande = "Grande"
    
    func calcularIdade(deAnos anosCaninos: Int, eMeses mesesCaninos: Int) -> Int {
        
        let multiplicador: Int
        switch self {
        case .pequeno:
            multiplicador = 6
        case .médio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
        return anosCaninos * multiplicador + mesesCaninos * multiplicador/12
    }
}
