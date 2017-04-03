@students = []

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '3'
    save_students
  when '4'
    load_students
  when '9'
    exit
  else
    puts "I don't know what you mean. Try again"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def add_students
@students << {name: @name, cohort: @cohort}
end

def input_students
  puts "Please enter the name of the student. \n To finish, hit return twice"
  @name = STDIN.gets.chomp.capitalize
  @cohort = 'november'
  while !@name.empty? do
      add_students
      count_students
    puts "Add another student name or return to quit:"
    @name = STDIN.gets.chomp.capitalize
  end
  if @name.empty?
    puts "The students are now added to the database"
  end
end

def count_students
  if @students.count == 1
  puts "Now we have #{@students.count} student"
else
  puts "Now we have #{@students.count} students"
end
end

def save_students
  puts "Where should I save the students? Give me an existing filename:"
  file = File.open(STDIN.gets.chomp, "w") do |file|
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    file.puts student_data.join(",")
  end
end
  puts "The students list is saved"
end

def load_students
  puts "From where should I load the student database?"
  file = File.open(STDIN.gets.chomp, "r") do |file|
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(',')
    add_students
  end
end
  puts "We loaded the students now"
end

def try_load_students
  filename =  ARGV.first #first arg from the command line
  if filename.nil?
    filename = 'students.csv'
    puts "Loaded #{@students.count} students from #{filename}, since that was the default file and you did not input another"
  else
    load_students(filename)
  end
end

def print_header
puts "The students of Villains Academy".center(60, '_')
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
puts "Overall, we have #{@students.count} great students".center(60, '_')
end

#try_load_students
interactive_menu
