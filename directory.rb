def input_students()
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do

    students << {name: name, cohort: :november}
    puts "We now have #{students.count} students"

    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end 
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_with_first_letter(students, letter)
  names = students.select { |student| student[:name][0] == letter }

  names.each_with_index do |name, index|
    puts "#{index + 1}. #{name[:name]} (#{name[:cohort]} cohort)"
  end
end

students = input_students
print_header
print(students)
print_footer(students)
print_with_first_letter(students, "A")