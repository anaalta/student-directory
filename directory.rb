@students = []

def interactive_menu
  loop do
  #1.prints the options
  print_menu
  #2.does what user asks
  process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1.Input the students"
  puts "2.Show the students"
  puts "3. Save the list of students to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  #do what the user asked
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
  puts "Please enter the name of the student:"
  puts "To finish, hit return twice"
  @name = STDIN.gets.chomp.capitalize
  @cohort = 'default'
  while !@name.empty? do
      add_students
        puts "Now we have #{@students.count} students"
  #get another student
    puts "Add another student name or return to quit:"
    @name = STDIN.gets.chomp.capitalize
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[@name], student[@cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(',')
    add_students
  end
  file.close
end

def try_load_students
  filename =  ARGV.first #first arg from the command line
  if filename.nil?
    filename = "students.csv"
    puts "Loaded #{@students.count} from #{filename}, since that was the default file and you did not input another"
  else
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
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

try_load_students
interactive_menu
