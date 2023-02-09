# Method to ask and execute what the user wants to do
def interactive_menu
    students = []
    loop do
    puts "1. Input student information"
    puts "2. Display all students' information"
    puts "3. Search for a student's information using their initals"
    puts "4. Search for student information based on name length"
    puts "5. Fix a typo"
    puts "9. Exit"
    
    selection = gets.chomp
    
    case selection
        when "1" then students = input_students
        when "2" then print_header ; print(students) ; print_footer(students)
        when "3" then search_initials(students)
        when "4" then search_length(students)
        when "5" then fix_typo(students)
        when "9" then puts "Goodbye" ; return
        else puts "I don't know what you meant, try again" 
    end
    end
end


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
            return students
        end
        
        puts "Enter the age of #{name}"
        age = gets.chomp
        if age.empty?
            age = "N/A"
        end
        
        puts "Enter the cohort of #{name}"
        cohort = gets.chomp
        if cohort.empty?
            cohort = "N/A"
        end
        
        puts "Enter the country of birth of #{name}"
        birth = gets.chomp
        if birth.empty?
            birth = "N/A"
        end
        
        puts "Enter the height of #{name} in cm"
        height = gets.chomp
        if height.empty?
            height = "N/A"
        end
        
        puts "Enter the hobbies of #{name}"
        hobbies = gets.chomp
        if hobbies.empty?
            hobbies = "N/A"
        end
        
        # add student hash to the students array
        students << {name: name, age: age, cohort: cohort, birth: birth, 
        height: height, hobbies: hobbies}
        puts "Now we have #{students.count} students"
        
        i += 1
    end
    # implicitly returns the students array
    
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
        puts "Enter the initials for the student you are looking for or hit return to exit"
        results = []
        initials = gets.chomp.upcase
        
        students.each_with_index do |student, i|
            names = student[:name].upcase.split()
            if initials == "#{names[0][0]}#{names[1][0]}"
                results << "#{i + 1}. #{student[:name]} (Age: #{student[:age]}, Cohort: #{student[:cohort]}, Birth Country: #{student[:birth]}, Height: #{student[:height]}, Hobbies: #{student[:hobbies]})"
            end
        end
        
        # If user hits return when prompted, then method concludes
        if initials.empty?
            return
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
        puts "Enter the max character length of the name or hit return to exit"
        results = []
        length = gets.chomp
        
        students.each_with_index do |student, i|
            if student[:name].length <= length.to_i
                results << "#{i + 1}. #{student[:name]} (Age: #{student[:age]}, Cohort: #{student[:cohort]}, Birth Country: #{student[:birth]}, Height: #{student[:height]}, Hobbies: #{student[:hobbies]})"
            end
        end
        
        if length.empty?
            return
        elsif results.empty?
            puts "No match found!"
        else
            results.each do |result|
                puts result
            end
        end    
    end
end

def fix_typo(students)
    while true
        puts "Enter the name of the student you wish to edit or hit return to exit"
        name = gets.chomp
        x = 0
        
        if name.empty?
            return
        end
        
        students.each do |student|
            if student[:name].downcase == name.downcase
                x += 1
            end
        end
        
        if x != 1
            puts "Student does not exist in directory"
            next
        end
            
        
        puts "Enter the category you wish to edit"
        cat = gets.chomp.downcase.to_sym
        
        if !students[0].key?(cat)
            puts "Incorrect category"
            next
        end
        
        puts "Enter your correction"
        fix = gets.chomp
        
        # Not recognising category, even when correct
        students.each_with_index do |student, i|
            if student[:name] == name
                student[cat] = fix
                puts "#{i + 1}. #{student[:name]} (Age: #{student[:age]}, Cohort: #{student[:cohort]}, Birth Country: #{student[:birth]}, Height: #{student[:height]}, Hobbies: #{student[:hobbies]})"
            end
        end
        
    end
end

interactive_menu
