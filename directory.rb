def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: :crafts, country_of_birth: :galaxy}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of input_students
  students
end
def print_header
  puts "The students of Villains Academy".center(90)
  puts "-------------".center(90)
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) is born in #{student[:country_of_birth]}, has a great passion for #{student[:hobbies]}."
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(92)
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
