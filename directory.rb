def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
#an empty array
  students = []
#get the first name from user
name = gets.chomp
#while not empty, repeat
while !name.empty? do
  #adds the student hash to the array
  students << {name: name, cohort: :november}
  puts "Now we have #{students.count} students"
  #get another student
  name = gets.chomp
end
students
end


def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print(students)
students.each_with_index do |student, index|
  puts "#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)"
end
end

def print_footer(students)
puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
