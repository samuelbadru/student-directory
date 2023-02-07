# Array containing the names of the students
students = [
    {name: "Dr. Hannibal Lecter", cohort: :november},
    {name: "Darth Vader", cohort: :november},
    {name: "Nurse Vader", cohort: :november},
    {name: "Michael Corleone", cohort: :november},
    {name: "Alex DeLarge", cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november},
    {name: "Terminator", cohort: :november},
    {name: "Freddy Krueger", cohort: :november},
    {name: "The Joker", cohort: :november},
    {name: "Joffrey Baratheon", cohort: :november},
    {name: "Norman Bates", cohort: :november}
    ]

# Method to print header
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

# Method to print names and cohort month in a given nested array
def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
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