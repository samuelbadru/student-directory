# Array containing the names of the students
students = [
    ["Dr. Hannibal Lecter", :november],
    ["Darth Vader", :november],
    ["Nurse Vader", :november],
    ["Michael Corleone", :november],
    ["Alex DeLarge", :november],
    ["The Wicked Witch of the West", :november],
    ["Terminator", :november],
    ["Freddy Krueger", :november],
    ["The Joker", :november],
    ["Joffrey Baratheon", :november],
    ["Norman Bates", :november]
    ]

# Method to print header
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

# Method to print names and cohort month in a given nested array
def print(students)
    students.each do |student|
        puts "#{student[0]} (#{student[1]} cohort)"
    end
end

# Method to print the footer, which contains the count of the given array
def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

# Calling methods
print_header
print(students)
print_footer(students)