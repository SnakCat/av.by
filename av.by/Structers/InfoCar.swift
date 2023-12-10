import Foundation
import UIKit.UIImage

    // MARK: - struct for car info
struct InfoCar {
    let name: String
    var price: Int
    var dollar: Int {
        return Int(price / 3)
    }
    let photos: [UIImage]
    let yaer: Int
    let transmission: TransmissionCar
    let sizeEngine: Double
    let typeEngine: TypeEngine
    let carBody: CarBody
    let odometer: Double
    let powerReserve: Double
    let wheelDrive: WheelDrive
    let color: String
    let registration: Regisrtation
    let power: Double
    let fuelFlow: Double
    
    var vin: Bool
    var top: Bool
    
    let city: String
    let date: String
    let vinNumber: Int
    let description: String
    let complectation: String
    let change: Change
    var lizing: Int {
        return Int(price / 3 / 48)
    }
    let seller: String
}
