def input_students
  puts "Please enter the names of the students."
  puts "Please enter the name of cohort."
  puts "To finish, just hit return three times"
  # create an empty array
  students = []

  name = gets.chomp
  cohort = gets.chomp

  while !name.empty? || !cohort.empty? do
    month = ["january", "february", "march", "april", "may", "june", "july",
      "august", "september", "october", "november", "december"]

    name = "TBC" if name.empty?
    cohort = "november" if cohort.empty? || !month.include?(cohort)
#    add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobbies: :crafts, country_of_birth: :galaxy}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    cohort = gets.chomp
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
