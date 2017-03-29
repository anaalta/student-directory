
#put students in array
students = ["Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"]
#printing the list of students
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
#we print the total number of students with print - so we have it all in one line (puts always starts a new line)
puts "Overall, we have #{students.count} great students"
