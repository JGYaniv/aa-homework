#rotates a matrix 90 degress clockwise
def matrix_rotate(matrix, number_of_rotations)
    rotations = number_of_rotations % 4
    case rotations
    when 0
        matrix
    when 1
        matrix.my_transpose.map(&:reverse)
    when 2
        matrix.map(&:reverse).reverse
    when 3
        matrix.my_transpose.reverse
        # matrix.map(&:reverse).transpose
    end
end

class Array
    def my_transpose
        transposed = Array.new(self.first.length){Array.new(self.length)}
        self.each_with_index do |row, row_idx|
            row.each_with_index do |el, el_idx|
                transposed[el_idx][row_idx] = el
            end
        end
        transposed
    end
end

matrix1 = [
    [:a, :b, :c],
    [:d, :e, :f],
    [:g, :h, :i]
]

rotatedMatrix1 = [
    [:g, :d, :a],
    [:h, :e, :b],
    [:i, :f, :c]
]

doubleRotatedMatrix1 = [
    [:i, :h, :g],
    [:f, :e, :d],
    [:c, :b, :a]
]

tripleRotatedMatrix1 = [
    [:c, :f, :i],
    [:b, :e, :h],
    [:a, :d, :g]
]

p matrix_rotate(matrix1, 1) == rotatedMatrix1
p matrix_rotate(matrix1, 2) == doubleRotatedMatrix1
p matrix_rotate(matrix1, 3) == tripleRotatedMatrix1

matrix2 = [
    [:a, :b, :c],
    [:d, :e, :f]
]

rotatedMatrix2 = [
    [:d, :a],
    [:e, :b],
    [:f, :c]
]

doubleRotatedMatrix2 = [
    [:f, :e, :d],
    [:c, :b, :a]
]

tripleRotatedMatrix2 = [
    [:c, :f],
    [:b, :e],
    [:a, :d]
]

p matrix_rotate(matrix2, 1) == rotatedMatrix2
p matrix_rotate(matrix2, 2) == doubleRotatedMatrix2
p matrix_rotate(matrix2, 3) == tripleRotatedMatrix2