class SortedArray

	attr_accessor :internal_arr

	def initialize(array=[])
		@internal_arr = []
		#sort the array
		array.each do |element|
			self.add(element)
		end
			
		array1 = SortedArray.new([4,5,2,2,])
		array1.add(element)
	end

	def size
		@internal_arr.length
	end

	def [](num)
		return @internal_arr[num]
	end

	def first_larger_index(target,start_index=0,end_index=@internal_arr.length-1)
		
		# find mid point
		mid_index = (start_index + end_index) / 2
		mid_element = @internal_arr[mid_index]

		# if the mid point == our target, return it as first_larger
		if @internal_arr.length < 1
			return 0
		elsif target < @internal_arr[0]
			return 0
		elsif target > @internal_arr[-1]
			return @internal_arr.length
		elsif mid_element == target
			return mid_index+1
		# if we are down to 1 or 2 elements, process accordingly:
		elsif start_index >= end_index || start_index == mid_index
			if @internal_arr[start_index] > target
				return start_index
			else
				return start_index + 1
			end
		# narrow it down to left or right half of array
		elsif mid_element > target
			first_larger_index(target,start_index,mid_index)
		elsif mid_element < target
			first_larger_index(target,mid_index,end_index)
		end
	end

	def add(element)
		@internal_arr.insert(first_larger_index(element),element)
	end

	def index(element)
		return @internal_arr.index(element)
	end


end