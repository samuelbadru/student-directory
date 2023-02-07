# Method to create the students array
def input_students
    
    puts "Please enter the name of the students"
    puts "To finish, hit return twice"
    # Empty array
    students = []
    # Gets first name
    name = gets.chomp
    
    while !name.empty? do
        # add student hash to the students array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    # implicitly returns the students array
    students
end

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
students = input_students
print_header
print(students)
print_footer(students)