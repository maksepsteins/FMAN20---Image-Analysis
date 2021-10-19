matrix = [x*(1-y) for x = 0:0.25:1, y = 1:-0.25:0]
gray_level = 32

quantization(matrix, gray_level) = map(e -> round((gray_level - 1)*e), matrix)

println(quantization(matrix, gray_level))