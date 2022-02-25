import Foundation

protocol DataResponseSerializerProtocol {
    associatedtype SerializedObject
    func serializeResponse(from data: Data) throws -> SerializedObject
}

struct DecodableDataResponseSerializer<T: Decodable>: DataResponseSerializerProtocol {
    func serializeResponse(from data: Data) throws -> T {
        let decoder = JSONDecoder()
        let decodedObject = try decoder.decode(T.self, from: data)
        return decodedObject
    }
}

final class AnyDataResponseSerializer: DataResponseSerializerProtocol {
    private let wrapped: (Data) throws -> Any

    init<T: DataResponseSerializerProtocol>(_ serializer: T) {
        wrapped = serializer.serializeResponse(from:)
    }

    func serializeResponse(from data: Data) throws -> Any {
        return try wrapped(data)
    }
}
