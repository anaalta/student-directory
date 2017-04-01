@students = []
def interactive_menu
  loop do
  #1.prints the options
  print_menu
  #2.does what user asks
  process(gets.chomp)
  end
end

def print_menu
  puts "1.Input the students"
  puts "2.Show the students"
  puts "9. Exit"
end

def process(selection)
  #do what the user asked
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '9'
    exit
  else
    puts "I don't know what you mean. Try again"
  end
end

def show_students
  print_header
  print_students_by_cohort(@students)
  print_footer(@students)
end

def input_students
  puts "Please enter the name of the student:"
  puts "To finish, just skip entering the requested info"
#get the first name from user
  name = gets.chomp.capitalize.to_sym
#get the country
  puts "Country of origin:"
  country = gets.chomp.capitalize.to_sym
  puts "Introduce the cohort"
  cohort = gets.chomp.capitalize.to_sym
#while not empty, repeat
  while !name.empty? do
    if cohort.empty?
  #adds the student hash to the array
      @students << {name: name, cohort: :unknown , country: country, major: :ruby}
    else
      @students << {name: name, cohort: cohort , country: country, major: :ruby}
    end
    #puts "Are you sure these infos are correct? Check for typos in the name.Type 'n' if you want to modify"
    #typ = gets.chomp.to_s
    #  if typ.downcase == "n"
    #    puts "Introduce the correct name:"
    #    name = gets.chomp.capitalize.to_sym
      #else
      if @students.count == 1
        puts "Now we have #{@students.count} students".slice(0..-2)
      else
        puts "Now we have #{@students.count} students"
      end
  #get another student
    puts "Add another student name or return to quit:"
    name = gets.chomp.capitalize.to_sym
    if !name.empty?
      puts "Country:"
      country = gets.chomp.capitalize.to_sym
      puts "Cohort:"
      cohort = gets.chomp.capitalize.to_sym
  end
end
@students
end


def print_header
puts "The students of Villains Academy".center(60, '_')
end

def print_students_by_cohort(students)
  cohorts = @students.group_by {|x| x[:cohort]}
    cohorts.map do |key, value|
    puts "#{key} cohort".center(50)
      for i in 0..value.length-1
        puts "#{value[i][:name]} - #{value[i][:country]}, majoring in #{value[i][:major]}"
      end
    end
end

def print_footer(students)
puts "Overall, we have #{@students.count} great students".center(60, '_')
end

interactive_menu
