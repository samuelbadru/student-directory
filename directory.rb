# Array containing the names of the students
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Vader",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
    ]

# Student names are printed, each on a new line
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
    puts student
end

# The sum total of students is then printed
puts "Overall, we have #{students.count} great students"
