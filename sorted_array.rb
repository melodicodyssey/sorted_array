class SortedArray

	attr_accessor :internal_arr

	def initialize(array=[])
		@internal_arr = []
		#sort the array
		array.each do |element|
			self.add(element)
		end
			

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


# source = [2,3,4,7,9]
# sorted_array = SortedArray.new
# sorted_array.internal_arr = @source

# sorted_array.first_larger_index(4)
# sorted_array.first_larger_index(6)
# sorted_array.first_larger_index(8)

=begin
	

def sort_method(array,start_ind=0,end_ind=array.length)
	
end

FIRST LARGER INDEX

def first_larger_index_method(arr,tar,start=0,end=array.length)

larger_index = ?
start_point = 0
end_point = array.length

1) find mid_point

	mid_point = (start_point + end_point) / 2

2) evaluate mid_point <=> target

 a) 	if mid_point == target
			larger_index = mid_point+1
			return larger_index

 b) 	elsif mid_point > target
			start_point = 0
			end_point = mid_point
			first_larger_index_method(arr,tar,start_point,end_point)

 c)		elsif mid_point < target
			start_point = mid_point
			end_point = array.length
			first_larger_index_method(arr,tar,start_point,end_point)
		end
				=> which calls first_larger_index_method recursively
				=> mid_point = (start_point + end_point) /2
				=> mid_point <=> target

	=> Keep recursively calling the method until mid_point == target
	=> and return larger_index at the end of the method
	


=end