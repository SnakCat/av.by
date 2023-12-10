import UIKit

final class SearchViewController: UIViewController {
    // MARK: - private propertis
    private let tableView = UITableView()
    private let buttonView = UIView()
    private let scanButton = UIButton()
    private let parametrsButton = UIButton()
    
    
    private let cars: [InfoCar] = [
        InfoCar(name: "Audi RS3", price: 2678, photos: [(UIImage(imageLiteralResourceName: "Audi")), (UIImage(imageLiteralResourceName: "Audi1")), (UIImage(imageLiteralResourceName: "Audi2"))], yaer: 2019, transmission: .automatic, sizeEngine: 3.2, typeEngine: .gasoline, carBody: .hatchback, odometer: 23.345, powerReserve: 23456, wheelDrive: .fullWheelDrive, color: "Серый", registration: .isRegistered, power: 1300, fuelFlow: 18, vin: false, top: false, city: "Минстк", date: "14 ноября", vinNumber: 2454679807, description: "", complectation: "", change: .no, seller: "Собственник"),
        
        InfoCar(name: "Volkswagen Golf MK 4", price: 1235, photos: [(UIImage(imageLiteralResourceName: "Golf")), (UIImage(imageLiteralResourceName: "Golf1")), (UIImage(imageLiteralResourceName: "Golf2"))], yaer: 2000, transmission: .mechanical, sizeEngine: 1.4, typeEngine: .gasoline, carBody: .hatchback, odometer: 300000, powerReserve: 3131, wheelDrive: .frontWheelDrive, color: "Красный", registration: .isRegistered, power: 75, fuelFlow: 7.5, vin: false, top: false, city: "Вологда", date: "13 января", vinNumber: 3456789075, description: "", complectation: "", change: .no, seller: "Собственник"),
        
        InfoCar(name: "Lada 2114", price: 1234, photos: [(UIImage(imageLiteralResourceName: "Lada")), (UIImage(imageLiteralResourceName: "Lada1"))], yaer: 2012, transmission: .mechanical, sizeEngine: 1.6, typeEngine: .gasoline, carBody: .hatchback, odometer: 12000, powerReserve: 1233, wheelDrive: .frontWheelDrive, color: "Жимолось", registration: .removedRegistr, power: 100, fuelFlow: 10, vin: false, top: false, city: "Вологда", date: "1 января", vinNumber: 43564345342, description: "", complectation: "", change: .no, seller: "Собственник"),
        
        InfoCar(name: "Lambagruni", price: 223, photos: [(UIImage(imageLiteralResourceName: "Lamba")), (UIImage(imageLiteralResourceName: "Lamba2")), (UIImage(imageLiteralResourceName: "Lamba3"))], yaer: 2023, transmission: .automatic, sizeEngine: 5.0, typeEngine: .gasoline, carBody: .coupe, odometer: 1000, powerReserve: 1334, wheelDrive: .fullWheelDrive, color: "Белый", registration: .removedRegistr, power: 1000, fuelFlow: 20, vin: false, top: false, city: "Минск", date: "9 декабря", vinNumber: 123554673, description: "", complectation: "", change: .no, seller: "Собственник"),
        
        InfoCar(name: "Porshe 911", price: 1233, photos: [(UIImage(imageLiteralResourceName: "Porshe")), (UIImage(imageLiteralResourceName: "Porshe2"))], yaer: 1990, transmission: .mechanical, sizeEngine: 3.0, typeEngine: .gasoline, carBody: .hatchback, odometer: 1233, powerReserve: 2344, wheelDrive: .rearWheelDrive, color: "Серый Кролик", registration: .isRegistered, power: 12344, fuelFlow: 20, vin: false, top: false, city: "Москва", date: "3 июня", vinNumber: 124533533353, description: "", complectation: "", change: .no, seller: "Собственник"),
        
        InfoCar(name: "Nissan Silvia", price: 1200, photos: [(UIImage(imageLiteralResourceName: "Silvia")), (UIImage(imageLiteralResourceName: "Silvia2"))], yaer: 1991, transmission: .mechanical, sizeEngine: 2.4, typeEngine: .gasoline, carBody: .sedan, odometer: 345000, powerReserve: 12344, wheelDrive: .rearWheelDrive, color: "Белый Снег", registration: .isRegistered, power: 300, fuelFlow: 15, vin: false, top: false, city: "СПБ", date: "14 янаваря", vinNumber: 12453473, description: "", complectation: "", change: .no, seller: "Собственник"),
        
        InfoCar(name: "Nissan Skayline", price: 1000, photos: [(UIImage(imageLiteralResourceName: "Skayline")), (UIImage(imageLiteralResourceName: "Skayline2")), (UIImage(imageLiteralResourceName: "Skayline3"))], yaer: 1990, transmission: .mechanical, sizeEngine: 2.3, typeEngine: .gasoline, carBody: .coupe, odometer: 23000, powerReserve: 123443, wheelDrive: .rearWheelDrive, color: "Супер цвет", registration: .isRegistered, power: 800, fuelFlow: 1442, vin: false, top: false, city: "СПБ", date: "12 февраля", vinNumber: 13253522, description: "", complectation: "", change: .no, seller: "Собственник"),
        
        InfoCar(name: "Lada 2108", price: 133, photos: [(UIImage(imageLiteralResourceName: "Taz")), (UIImage(imageLiteralResourceName: "Taz1")), (UIImage(imageLiteralResourceName: "Taz2"))], yaer: 1989, transmission: .mechanical, sizeEngine: 1.1, typeEngine: .gasoline, carBody: .hatchback, odometer: 12355555, powerReserve: 1344, wheelDrive: .frontWheelDrive, color: "Белый", registration: .isRegistered, power: 45, fuelFlow: 12342, vin: false, top: false, city: "Вологда", date: "4 октября", vinNumber: 1234532, description: "", complectation: "", change: .no, seller: "Собственник"),
        
        InfoCar(name: "Toyota GT 86", price: 1234, photos: [(UIImage(imageLiteralResourceName: "Toyota")), (UIImage(imageLiteralResourceName: "Toyota2")), (UIImage(imageLiteralResourceName: "Toyota3"))], yaer: 2012, transmission: .automatic, sizeEngine: 2.0, typeEngine: .gasoline, carBody: .sedan, odometer: 123333, powerReserve: 12333, wheelDrive: .rearWheelDrive, color: "Хамелион", registration: .isRegistered, power: 200, fuelFlow: 14, vin: false, top: false, city: "Ченья-Ворыг", date: "1 июля", vinNumber: 12345353535, description: "", complectation: "", change: .no, seller: "Собственник"),
        
        InfoCar(name: "Ford Focus 2", price: 123, photos: [(UIImage(imageLiteralResourceName: "image1")), (UIImage(imageLiteralResourceName: "image2")), (UIImage(imageLiteralResourceName: "image3"))], yaer: 2007, transmission: .mechanical, sizeEngine: 1.8, typeEngine: .gasoline, carBody: .hatchback, odometer: 343543, powerReserve: 1432, wheelDrive: .frontWheelDrive, color: "Черный", registration: .isRegistered, power: 125, fuelFlow: 12455, vin: false, top: false, city: "Вологда", date: "7 августа", vinNumber: 2145353, description: "", complectation: "", change: .no, seller: "Собственник")
    ]
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(buttonView)
        buttonView.addSubview(scanButton)
        buttonView.addSubview(parametrsButton)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchVCTableViewCell.self, forCellReuseIdentifier: "SearchVCTableViewCell")
        setupConstraints()
        setupUI()
        
    }
    // MARK: - helpers methods
    // constraints
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 40),
            buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95),
            buttonView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.55)
        ])
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scanButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor),
            scanButton.topAnchor.constraint(equalTo: buttonView.topAnchor),
            scanButton.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor),
            scanButton.widthAnchor.constraint(equalTo: buttonView.widthAnchor, multiplier: 0.27)
        ])
        parametrsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parametrsButton.topAnchor.constraint(equalTo: buttonView.topAnchor),
            parametrsButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor),
            parametrsButton.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor),
            parametrsButton.leadingAnchor.constraint(equalTo: scanButton.trailingAnchor, constant: 5)
        ])
    }
    // UI
    private func setupUI() {
        tableView.backgroundColor = .background
        
        title = "\(cars.count) объявлений"
        let arrowsButton = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: #selector(tapOnArrowsButton))
        navigationItem.rightBarButtonItem = arrowsButton
        
        scanButton.backgroundColor = .button
        scanButton.layer.cornerRadius = 10
        scanButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        scanButton.tintColor = .white
        
        parametrsButton.backgroundColor = .button
        parametrsButton.layer.cornerRadius = 10
        parametrsButton.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        parametrsButton.setTitle("Параметры", for: .normal)
        parametrsButton.tintColor = .white
        
    }
    @objc func tapOnArrowsButton() {
        print("parametrs")
    }
    
}
    // MARK: - extension
    // table view cell
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchVCTableViewCell", for: indexPath) as? SearchVCTableViewCell {
            let car = cars[indexPath.row]
            cell.configure(wiht: car)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        480
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
   
}
  

    

