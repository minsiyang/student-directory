@students = [] # an instance variable, accessible to all methods
@name = nil
@cohort = :november

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
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
    puts "Input students"
    input_students
  when "2"
    puts "Display students"
    show_students
  when "3"
    puts "Create a file name to save student names"
    save_students
  when "4"
    puts "Enter a file name to download student names"
    load_students
  when "9"
    puts "Bye"
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

def load_students
  load_file = gets.chomp
  File.open("#{load_file}.csv", "r") do |file|
    file.readlines.each do |line|
      @name, @cohort = line.chomp.split(",")
      add_students
    end
  end
  puts "Loaded #{@students.count} from #{load_file}"
end

def add_students # add the hash to @students array
  @students << {name: @name, cohort: @cohort.to_sym}
end

def save_students
  save_file = gets.chomp
  # open the file for writing
  File.open("#{save_file}.csv", "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
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
