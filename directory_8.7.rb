def input_students
  puts "Please enter the name of the student:"
  puts "To finish, just hit return twice"
#an empty array
  students = []
#get the first name from user
  name = gets.chomp.capitalize.to_sym
#get the country
  puts "Country of origin:"
  country = gets.chomp.capitalize.to_sym
  puts "Now get the cohort"
  cohort = gets.chomp.capitalize.to_sym
#while not empty, repeat
  while !name.empty? do
    if cohort.empty?
  #adds the student hash to the array
      students << {name: name, cohort: :november , country: country, major: :ruby}
    else
      students << {name: name, cohort: cohort , country: country, major: :ruby}
    end
    puts "Are you sure these infos are true? Check for typos in the name.Type 'y' for ok and 'n' if you want to modify"
    typ = gets.chomp.to_s
      if typ.downcase == "n"
        puts "Introduce the correct name:"
        name = gets.chomp.capitalize.to_sym
      else
        puts "Now we have #{students.count} students!"
      end
  #get another student
    puts "Add another student name or return to quit:"
    name = gets.chomp
    if !name.empty?
      puts "Country:"
      country = gets.chomp.capitalize.to_sym
      puts "Cohort:"
      cohort = gets.chomp.capitalize.to_sym
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
