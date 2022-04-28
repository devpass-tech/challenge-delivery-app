//
//  MenuItemCell.swift
//  DeliveryApp
//
//  Created by Cora on 28/04/22.
//

import UIKit

class MenuItemCell: UITableViewCell {
    
    // celula tem titulo regular (nome da comida) alinhado na esquerda, subtitulo cinza claro (valor da comida) e a imaginem da comida na direita, e retornam da api. criar stack view para os titulos, e outra para os titulos e imagem.
    
    private lazy var itemName: UILabel = {
        var name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var itemValue: UILabel = {
        var value = UILabel()
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    private lazy var itemImage: UIImageView = {
        var image = UIImageView()
        //contentMode
        //image.clipsToBounds = true
        //image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    func setupCell(image: String) {
        itemImage.image = UIImage(named: image)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
