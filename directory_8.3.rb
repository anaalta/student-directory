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

def print_short_names(students)
  puts "We will print only students who's names are shorter than 12 characters now"
students.each_with_index do |student, index|
  if student[:name].length <12
  puts "#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)"
 end
end
end

def print_footer(students)
puts "Overall, we have #{students.count} great students - but you only wanted to know the names shorter than 12 chars"
end

students = input_students
print_header
print_short_names(students)
print_footer(students)
