//
//  ProductDetailVC.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 26/04/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit
import Kingfisher
import ChameleonFramework
import RealmSwift

class ProductDetailVC: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var addToCart: UIButton!
    @IBOutlet weak var stepper: UIStepper!

    var product: Product?
    var cellIndex = -1
    var delegate: writeValueBackDelegate?
    private var realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        initProduct()
    }

    private func initProduct() {
        productName.text = product!.name
        productImage.kf.setImage(with: URL(string: product?.photoUrl ?? ""))
        updateAmountValues()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateAmountValues()
    }

    @IBAction func addToCartClick(_ sender: Any) {
        addProductToCart()

        delegate?.writeValueBack()
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

    private func updateAmountValues() {
        let amountInt = getStepperCount()
        product!.amount = amountInt
        addToCart.setTitle("Add \(amountInt) to cart \t \(product!.sumMoneyWithCentsString)", for: .normal)
        amount.text = String(amountInt)
    }

    private func addProductToCart() {
        try! realm.write {
            product?.amount = getStepperCount()
            realm.add(product!, update: true)
        }

        let allProducts = realm.objects(Product.self)
        print("Products in a cart \(allProducts)")
    }

    func getStepperCount() -> Int {
        return Int(stepper.value)
    }
}
