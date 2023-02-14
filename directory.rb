@students = []

def print_menu
    puts "1. Input student information"
    puts "2. Display all students' information"
    puts "3. Search for a student's information using their initals"
    puts "4. Search for student information based on name length"
    puts "5. Fix a typo"
    puts "7. Load the list from students.csv"
    puts "8. Save the list to students.csv"
    puts "9. Exit"
end


def interactive_menu
    loop do
    print_menu
    process(STDIN.gets.chomp)
    end
end

def process(selection)
    case selection
        when "1" then input_students
        when "2" then show_students
        when "3" then search_initials
        when "4" then search_length
        when "5" then fix_typo
        when "7" then load_students
        when "8" then save_students
        when "9" then puts "Goodbye" ; exit
        else puts "I don't know what you meant, try again" 
    end
end


def show_students
    if @students.empty?
        puts "No students to display!"
    else
        print_header ; print_students ; print_footer
    end
end

# Method to create the students array
def input_students
    
    puts "Please enter the students' information"
    i = 1
    
    while true
        puts "Enter the first and last names of student #{i} or hit return to exit"
        name = STDIN.gets.chomp
        if name.empty?
            return
        end
        
        puts "Enter the age of #{name}"
        age = STDIN.gets.chomp
        if age.empty?
            age = "N/A"
        end
        
        puts "Enter the cohort of #{name}"
        cohort = STDIN.gets.chomp
        if cohort.empty?
            cohort = "N/A"
        end
        
        puts "Enter the country of birth of #{name}"
        birth = STDIN.gets.chomp
        if birth.empty?
            birth = "N/A"
        end
        
        puts "Enter the height of #{name} in cm"
        height = STDIN.gets.chomp
        if height.empty?
            height = "N/A"
        end
        
        puts "Enter the hobbies of #{name}"
        hobbies = STDIN.gets.chomp
        if hobbies.empty?
            hobbies = "N/A"
        end
        
        # add student hash to the students array
        @students << {name: name, age: age, cohort: cohort, birth: birth, 
        height: height, hobbies: hobbies}
        
        if i == 1
            puts "Now we have 1 student"
        else
            puts "Now we have #{@students.count} students"
        end
        
        i += 1
    end
end

def save_students
    file = File.open("students.csv", "w")
    
    @students.each do |student|
        student_data = [student[:name], student[:age], student[:cohort], student[:birth], student[:height], student[:hobbies]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
    puts "Saved!"
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, age, cohort, birth, height, hobbies = line.chomp.split(",")
        @students << {name: name, age: age, cohort: cohort, birth: birth, height: height, hobbies: hobbies}
    end
    file.close
    puts "Loaded #{@students.count} from #{filename}"
end


def try_load_students
    filename = ARGV.first
    return if filename.nil?
    if File.exist?(filename)
        load_students(filename)
    else
        puts "Sorry, #{filename} doesn't exist."
        exit
    end
end


# Method to print header
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

# Method to print names and cohort month in a given nested array
def print_students
    i = 0
    while i < @students.length
        puts "#{i + 1}. #{@students[i][:name]} (Age: #{@students[i][:age]}, Cohort: #{@students[i][:cohort]}, Birth Country: #{@students[i][:birth]}, Height: #{@students[i][:height]}, Hobbies: #{@students[i][:hobbies]})"
        i += 1
    end
end

# Method to print the footer, which contains the count of the given array
def print_footer
    if @students.count == 1
        puts "Overall, we have 1 great student"
    else
        puts "Overall, we have #{@students.count} great students"
    end
end

# Method to search for a user given their initials
def search_initials
    
    while true
        puts "Enter the initials for the student you are looking for or hit return to exit"
        results = []
        initials = STDIN.gets.chomp.upcase
        
        @students.each_with_index do |student, i|
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

def search_length
    while true
        puts "Enter the max character length of the name or hit return to exit"
        results = []
        length = STDIN.gets.chomp
        
        @students.each_with_index do |student, i|
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

def fix_typo
    while true
        puts "Enter the name of the student you wish to edit or hit return to exit"
        name = STDIN.gets.chomp
        x = 0
        
        if name.empty?
            return
        end
        
        @students.each do |student|
            if student[:name].downcase == name.downcase
                x += 1
            end
        end
        
        if x != 1
            puts "Student does not exist in directory"
            next
        end
            
        
        puts "Enter the category you wish to edit"
        cat = STDIN.gets.chomp.downcase.to_sym
        
        if !@students[0].key?(cat)
            puts "Incorrect category"
            next
        end
        
        puts "Enter your correction"
        fix = STDIN.gets.chomp
        
        @students.each_with_index do |student, i|
            if student[:name] == name
                student[cat] = fix
                puts "#{i + 1}. #{student[:name]} (Age: #{student[:age]}, Cohort: #{student[:cohort]}, Birth Country: #{student[:birth]}, Height: #{student[:height]}, Hobbies: #{student[:hobbies]})"
            end
        end
        
    end
end

try_load_students
interactive_menu
