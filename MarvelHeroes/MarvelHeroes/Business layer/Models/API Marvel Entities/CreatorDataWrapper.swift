//
//  CreatorDataWrapper.swift
//  MarvelHeroes
//
//  Created by Arkadiy Grigoryanc on 04.12.2019.
//

import Foundation

// MARK: - CreatorDataWrapper
struct CreatorDataWrapper: IItemDataWrapper
{
	let code: Int
	let status, copyright, attributionText, attributionHTML: String
	let etag: String
	let data: CreatorDataContainer
}

// MARK: - DataClass
struct CreatorDataContainer: Codable
{
	let offset, limit, total, count: Int
	let results: [Creator]
}

// MARK: - Result
struct Creator: Codable, IItemViewModel
{
	let id: Int
	let firstName, middleName, lastName, suffix: String
	let fullName: String
	let modified: Date
	let thumbnail: Thumbnail

	// MARK: Calculated properties
	var itemType: ItemType { .creator }
	var title: String { fullName }
	var description: String? { nil }
}

extension Creator
{
	subscript<U>(dynamicMember keyPath: KeyPath<Thumbnail, U>) -> U {
		thumbnail[keyPath: keyPath]
	}
}
