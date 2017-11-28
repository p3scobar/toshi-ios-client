// Copyright (c) 2017 Token Browser, Inc
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

import Foundation

public struct TableSectionData {

    var headerTitle = ""
    var footerTitle = ""

    var cellsData: [TableCellData]
}

public struct TableCellDataComponents: OptionSet {

    public let rawValue: Int

    public init(rawValue: Int) { self.rawValue = rawValue }

    static let title = TableCellDataComponents(rawValue: 1 << 0)
    static let subtitle = TableCellDataComponents(rawValue: 1 << 1)
    static let details = TableCellDataComponents(rawValue: 1 << 2)
    static let leftImage = TableCellDataComponents(rawValue: 1 << 3)
    static let switchControl = TableCellDataComponents(rawValue: 1 << 4)

    static let titleSubtitle: TableCellDataComponents = [.title, .subtitle]
    static let titleLeftImage: TableCellDataComponents = [.title, .leftImage]
    static let titleSubtitleLeftImage: TableCellDataComponents = [.titleSubtitle, .leftImage]
    static let titleSubtitleDetailsLeftImage: TableCellDataComponents = [.titleSubtitle, .details, .leftImage]
    static let titleSwitchControl: TableCellDataComponents = [.title, .switchControl]
    static let titleSubtitleSwitchControl: TableCellDataComponents = [.titleSwitchControl, .subtitle]
    static let titleSubtitleSwitchControlLeftImage: TableCellDataComponents = [.titleLeftImage, .subtitle, .switchControl]
}

public struct TableCellData {
    var title: String?
    var subtitle: String?
    var leftImage: UIImage?
    var details: String?
    var switchState: Bool?

    private(set) var components: TableCellDataComponents = []

    init(title: String? = nil, subtitle: String? = nil, leftImage: UIImage? = nil, details: String? = nil, switchState: Bool? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.leftImage = leftImage
        self.details = details
        self.switchState = switchState

        setupComponents()
    }

    private mutating func setupComponents() {
        if title != nil {
            components.insert(.title)
        }

        if subtitle != nil {
            components.insert(.subtitle)
        }

        if leftImage != nil {
            components.insert(.leftImage)
        }

        if details != nil {
            components.insert(.details)
        }

        if switchState != nil {
            components.insert(.switchControl)
        }
    }
}