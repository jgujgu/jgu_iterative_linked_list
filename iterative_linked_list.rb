class IterativeLinkedList
	attr_reader :count,:head_node

	def initialize
		@count = 0
		@head_node = nil
	end

	def push(data)
		if @head_node == nil
			@head_node = Node.new(data)
		else
			current = @head_node
			while current.next_node != nil
				current = current.next_node
			end
			current.next_node = Node.new(data)
		end
		@count += 1
	end

	def pop
		if @count == 1
			@count = 0
			before_pop = @head_node.data
			@head_node = nil
			before_pop
		elsif @count > 1
			current = @head_node
			for i in (0...@count-1)
				last_node = current
				current = current.next_node
			end
			last_node.next_node = nil
			@count -= 1
			current.data
		else
			nil
		end
	end

	def delete(parameter)
		current = @head_node
		if @head_node.data == parameter
			@head_node.data = nil
			@head_node = @head_node.next_node
			@count -=1
		else 
			for i in (1...@count)
				last_node = current
				current = current.next_node
				if current.data == parameter
					last_node.next_node = current.next_node
					@count -= 1
				else
					nil
				end
			end
		end
	end

	def to_a
		current = @head_node
		a = []
		if @head_node == nil
			a
		else
			a << @head_node.data
			for i in (0...@count-1)
				current = current.next_node
				a << current.data
			end
			a
		end
	end

	def last_node
		current = @head_node
		if @head_node.next_node == nil
			@head_node
		else
			for i in (1...@count)
				current = current.next_node
				if current.next_node == nil
					current
				end
			end
		end
		current
	end

	def include?(parameter)
		current = @head_node
		true_or_false = false
		if @head_node.data == parameter
			true_or_false = true
		else
			for i in (1...@count)
				current = current.next_node
				if current.data == parameter
					true_or_false = true
				end
			end
		end
		true_or_false
	end

	def find(parameter)
		current = @head_node
		if @head_node.data == parameter
			@head_node
		else
			for i in (1...@count)
				current = current.next_node
				if current.data == parameter
					current
					break
				end
			end
		end
		current
	end

	def insert(position, data)
		current = @head_node
		for i in (1..position)
			last_node = current
			current = current.next_node
		end
		new_node = Node.new(data)
		new_node.next_node = current
		last_node.next_node = new_node
		@count += 1
	end
	
	def insert_after(target,data)
		the_index = self.index(target)
		self.insert(the_index + 1, data)
	end

	def index(parameter)
		current = @head_node
		index = 0
		if @head_node.data == parameter
			index
		else
			for i in (1...@count)
				current = current.next_node
				index += 1
				if current.data == parameter
					current
					break
				end
			end
		end
		index
	end


	class Node
		attr_accessor :data, :next_node
		def initialize(data)
			@data = data
		end
	end


end
