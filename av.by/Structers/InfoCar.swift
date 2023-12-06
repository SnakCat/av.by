import Foundation

struct InfoCar {
    let name: String
    var price: Double
    let images: [String]
    var dollar: Double {
        return Double(price / 3)
    }
    let yaer: Int
    let transmission: TransmissionCar
    let engineСapacity: Double
    let typeEngine: TypeEngine
    let carBody: CarBody
    let driveUnit: DriveUnit
    var vin: Bool
    var top: Bool
    let city: String
    var lizing: Double {
        return Double(Double(price / 3) * 13)
    }
    
}
