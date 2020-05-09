@students = [] # an instance variable, accessible to all methods
@name = nil
@cohort = :november

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  choose_file
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !@name.empty? do
    add_students
    puts "Now we have #{@students.count} students"
    # get another name from the user
    @name = STDIN.gets.chomp
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  @name, @cohort = line.chomp.split(",")
    add_students
  end
  file.close
  puts "Loaded #{@students.count} from #{filename}"
end

def add_students # add the hash to @students array
  @students << {name: @name, cohort: @cohort.to_sym}
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")

  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def choose_file
  filename = ARGV.first.nil? ? "students.csv" : ARGV.first
  if File.exist?(filename) # if filename is given
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

interactive_menu
