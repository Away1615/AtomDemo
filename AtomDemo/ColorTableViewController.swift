//
//  ColorTableViewController.swift
//  AtomDemo
//
//  Created by 白镜吾 on 2024/9/20.
//

import Foundation
import AtomKit
import UIKit

class ColorTableViewController: UITableViewController {

    // 存储颜色的数组
    let colors: [[UIColor]] = [
        [.cyan1, .cyan2, .cyan3, .cyan4, .cyan5, .cyan6, .cyan7, .cyan8, .cyan9, .cyan10],
        [.gray1, .gray2, .gray3, .gray4, .gray5, .gray6, .gray7, .gray8, .gray9, .gray10],
        [.pinkpurple1, .pinkpurple2, .pinkpurple3, .pinkpurple4, .pinkpurple5, .pinkpurple6, .pinkpurple7, .pinkpurple8, .pinkpurple9, .pinkpurple10],
        [.yellow1, .yellow2, .yellow3, .yellow4, .yellow5, .yellow6, .yellow7, .yellow8, .yellow9, .yellow10],
        [.purple1, .purple2, .purple3, .purple4, .purple5, .purple6, .purple7, .purple8, .purple9, .purple10],
        [.gold1, .gold2, .gold3, .gold4, .gold5, .gold6, .gold7, .gold8, .gold9, .gold10],
        [.lime1, .lime2, .lime3, .lime4, .lime5, .lime6, .lime7, .lime8, .lime9, .lime10],
        [.green1, .green2, .green3, .green4, .green5, .green6, .green7, .green8, .green9, .green10],
        [.blue1, .blue2, .blue3, .blue4, .blue5, .blue6, .blue7, .blue8, .blue9, .blue10],
        [.magenta1, .magenta2, .magenta3, .magenta4, .magenta5, .magenta6, .magenta7, .magenta8, .magenta9, .magenta10],
        [.orange1, .orange2, .orange3, .orange4, .orange5, .orange6, .orange7, .orange8, .orange9, .orange10],
        [.red1, .red2, .red3, .red4, .red5, .red6, .red7, .red8, .red9, .red10]
    ]

    let colorNames: [String] = [
        "Cyan", "Gray", "Pink/Purple", "Yellow",
        "Purple", "Gold", "Lime", "Green", "Blue",
        "Magenta", "Orange", "Red"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Color Palette"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ColorCell")
        tableView.allowsSelection = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return colors.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        let color = colors[indexPath.section][indexPath.row]
        cell.backgroundColor = color
        return cell
    }

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return colorNames[section]
    }

    // 计算对比色以确保文本可读
    func contrastColor(for color: UIColor) -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        // 计算亮度
        let brightness = (0.299 * red + 0.587 * green + 0.114 * blue)

        return brightness > 0.5 ? .black : .white
    }
}
