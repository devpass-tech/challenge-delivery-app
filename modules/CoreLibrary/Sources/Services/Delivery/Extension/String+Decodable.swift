import Foundation

extension String {
    func loadJsonArray<T: Decodable>() -> [T]? {
        guard let dataFromFile = getDataFromFilename(self) else { return nil }
        do {
            let decoder = JSONDecoder()
            let jsonDataArray = try decoder.decode([T].self, from: dataFromFile)
            return jsonDataArray
        } catch {
            return nil
        }
    }

    func loadJson<T: Decodable>() -> T? {
        guard let dataFromFile = getDataFromFilename(self) else { return nil }
        do {
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: dataFromFile)
            return jsonData
        } catch {
            return nil
        }
    }

    private func getDataFromFilename(_ fileName: String) -> Data? {
        if let url = Bundle.module.url(forResource: fileName, withExtension: "json") {
            do {
                return try Data(contentsOf: url)
            } catch {
                return nil
            }
        }
        return nil
    }
}
