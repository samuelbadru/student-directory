# Method to create the students array
def input_students
    
    puts "Please enter the first and last names of the students"
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
    students.each_with_index do |student, i|
        puts "#{i + 1} #{student[:name]} (#{student[:cohort]} cohort)"
    end
end

# Method to print the footer, which contains the count of the given array
def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

# Method to search for a user given their initials
def search_initials(students)
    
    while true
        puts "Enter the initials for the student you are looking for"
        puts "To finish, hit return twice"
        results = []
        initials = gets.chomp.upcase
        students.each_with_index do |student, i|
            names = student[:name].upcase.split()
            if initials == "#{names[0][0]}#{names[1][0]}"
                results << "#{i + 1} #{student[:name]} (#{student[:cohort]} cohort)"
            end
        end
        if results.empty?
            puts "No match found!"
        else
            results.each do |result|
                puts result
            end
            break
        end
    end
end

# Calling methods
students = input_students
print_header
print(students)
print_footer(students)
search_initials(students)