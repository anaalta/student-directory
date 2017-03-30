def input_students
  puts "Please enter the name of the student:"
  puts "To finish, just hit return twice"
#an empty array
  students = []
#get the first name from user
name = gets.chomp
#get the country
puts "Country of origin:"
country = gets.chomp
#while not empty, repeat
while !name.empty? do
  #adds the student hash to the array
  students << {name: name, cohort: :november, country: country, major: :ruby}
  puts "Now we have #{students.count} students!"
  #get another student
 puts "Add another student name or return to quit:"
  name = gets.chomp
  if !name.empty?
  puts "Country:"
  country = gets.chomp
else
  puts "So I guess we are done"
end
end
students
end


def print_header
puts "The students of Villains Academy".center(60, '_')
end

def print_all(students)
  i=0
until i == students.length
  puts "#{students[i][:name]} (#{students[i][:cohort]} cohort) - from #{students[i][:country]}, majoring in #{students[i][:major]}".center(80)
  i += 1
 end
end

def print_footer(students)
puts "Overall, we have #{students.count} great students".center(60, '_')
end

students = input_students
print_header
print_all(students)
print_footer(students)
