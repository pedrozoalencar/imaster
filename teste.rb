print "Enter your name:"
name = gets
puts "Hello #{name}"
name = name.chomp

if name == "Eu"
	puts "#{name}, este nao e seu nome verdadeiro." 
end