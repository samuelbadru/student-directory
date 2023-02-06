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

# Method to print header
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

# Method to print names in a given array
def print(names)
    names.each do |name|
        puts name
    end
end

# Method to print the footer, which contains the count of the given array
def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods
print_header
print(students)
print_footer(students)