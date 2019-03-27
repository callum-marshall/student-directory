
def input_students
  puts "Please enter the names of the student and their height"
  puts "To finish enter 'stop'"
  # create an empty array
  students = []
  # get the first name
  input = gets.chomp
  # while the name is not empty repeat this code
  name = input.split[0]
  height = input.split[1]

  while name != "stop" do
    # add the student hash to the array
    students << {name: name, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    input = gets.chomp
    name = input.split[0]
    height = input.split[1]
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  students.each_with_index do |student, index|
    if student[:name].length < 12
      puts "#{student[:name]} #{student[:height]}cm (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#nothing happens until we call the methods

students = input_students
print_header
print(students)
print_footer(students)
