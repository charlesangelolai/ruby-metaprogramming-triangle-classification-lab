require 'pry'

class Triangle
  # write code here
  attr_accessor :sides

  def initialize(side1, side2, side3)
    @sides = []
    @sides << side1 << side2 << side3
  end

  def kind
    binding.pry
    raise TriangleError if sides.any? {|num| num <= 0} || triangle_inequality?
    #triangle_inequality?

    if sides.uniq.count == 1
      return :equilateral
    elsif sides.uniq.count == 2
      return :isosceles
    elsif sides.uniq.count == 3
      return :scalene
    end

  end

  def triangle_inequality?
    a = sides[0]
    b = sides[1]
    c = sides[2]
    a + b > c || b + c > a || c + a > b ? true : false
    #triangles = [a + b > c, b + c > a, c + a > b]
    #triangles << sides.any? {|num| num <= 0}
    #raise TriangleError if triangles.include?(false)
  end

  class TriangleError < StandardError
  end
end
