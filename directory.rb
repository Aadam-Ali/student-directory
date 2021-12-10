def input_students()
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"

  students = []
  
  print "Enter name: "
  name = gets.chomp

  while !name.empty? do

    students << {name: name, cohort: :november}
    puts "We now have #{students.count} students"

    print "Enter name: "
    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students)
  students.each_with_index do |student, index|
    puts (index + 1).to_s.ljust(5) + (student[:name]).ljust(20) + (student[:cohort].to_s + " cohort")
  end 
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_with_first_letter(students, letter)
  names = students.select { |student| student[:name][0] == letter }

  names.each_with_index do |name, index|
    puts (index + 1).to_s.ljust(5) + (name[:name]).ljust(20) + (name[:cohort].to_s + " cohort")
  end
end

students = input_students
print_header
print(students)
print_footer(students)
print_with_first_letter(students, "A")