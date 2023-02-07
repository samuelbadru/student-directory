# Method to create the students array
def input_students
    
    puts "Please enter the students' information"
    
    # Empty array
    students = []
    i = 1
    
    while true
        puts "Enter the first and last names of student #{i} or hit return to exit"
        name = gets.chomp
        if name.empty?
            break
        end
        puts "Enter the age of #{name}"
        age = gets.chomp
        puts "Enter the cohort of #{name}"
        cohort = gets.chomp
        puts "Enter the country of birth of #{name}"
        birth = gets.chomp
        puts "Enter the height of #{name} in cm"
        height = gets.chomp
        puts "Enter the hobbies of #{name}"
        hobbies = gets.chomp
        
        # add student hash to the students array
        students << {name: name, age: age, cohort: cohort, birth: birth, 
        height: height, hobbies: hobbies}
        puts "Now we have #{students.count} students"
        
        i += 1
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
    i = 0
    while i < students.length
        puts "#{i + 1}. #{students[i][:name]} (Age: #{students[i][:age]}, Cohort: #{students[i][:cohort]}, Birth Country: #{students[i][:birth]}, Height: #{students[i][:height]}, Hobbies: #{students[i][:hobbies]})"
        i += 1
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
                results << "#{i + 1}. #{students[i][:name]} (Age: #{students[i][:age]}, Cohort: #{students[i][:cohort]}, Birth Country: #{students[i][:birth]}, Height: #{students[i][:height]}, Hobbies: #{students[i][:hobbies]})"
            end
        end
        
        # If user hits return when prompted, then method concludes
        if initials.empty?
            break
        elsif results.empty?
            puts "No match found!"
        else
            results.each do |result|
                puts result
            end
        end

    end
end

def search_length(students)
    while true
        puts "Enter the max character length of the name"
        puts "To finish, hit return twice"
        results = []
        length = gets.chomp
        
        students.each_with_index do |student, i|
            if student[:name].length <= length.to_i
                results << "#{i + 1}. #{students[i][:name]} (Age: #{students[i][:age]}, Cohort: #{students[i][:cohort]}, Birth Country: #{students[i][:birth]}, Height: #{students[i][:height]}, Hobbies: #{students[i][:hobbies]})"
            end
        end
        
        if length.empty?
            break
        elsif results.empty?
            puts "No match found!"
        else
            results.each do |result|
                puts result
            end
        end    
    end
end

# Calling methods

students = input_students
print_header
print(students)
print_footer(students)
#search_initials(students)
#search_length(students)