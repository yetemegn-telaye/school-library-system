#!/usr/bin/env ruby

require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'

class App
  attr_accessor :books, :people, :rentals, :classroom

  def initialize
    @books = []
    @people = []
    @rentals = []
    @classroom = ['Full-stack Development']
  end

  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "Name: \"#{person.name}\", Age: #{person.age}, ID: #{person.id}, Class: #{person.class}"
    end
  end

  def create_person
    puts 'What do you want to create, a Teacher (T) or a Student (S)? [Enter the Letter]:'
    input_type = gets.chomp.upcase
    case input_type
    when 'T'
      create_teacher
    when 'S'
      create_student
    else
      invalid_input
      create_person
    end
  end

  def create_teacher
    puts 'Name:'
    name = gets.chomp.to_s
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Specialization:'
    specialization = gets.chomp.to_s

    @people << Teacher.new(specialization, name, age)
    puts 'Teacher successfully created!'
  end

  def create_student
    puts 'Name: '
    name = gets.chomp.to_s
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Has parent permission? [Y/N]: '
    has_permission = gets.chomp.to_s.upcase
    case has_permission
    when 'Y'
      permission = true
    when 'N'
      permission = false
    else
      invalid_input
      create_student
    end

    @people << Student.new(classroom, age, name, parent_permission: permission)
    puts 'Student created successfully!'
  end

  def create_book
    puts 'Title: '
    title = gets.chomp.to_s
    puts 'Author: '
    author = gets.chomp.to_s
    @books << Book.new(title, author)
    puts 'Book successfully created'
  end

  def create_rental
    puts 'Choose a book from the following list using the numbers beside it'
    books.each_with_index do |book, index|
      puts "#{index} Title: #{book.title}, Author #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person that wants to rent a book (choose a number)'
    people.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
    person_index = gets.chomp.to_i
    puts 'Enter Date: '
    date = gets.chomp.to_s
    rentals << Rental.new(date, people[person_index], books[book_index])
    puts 'Book successfully rented'
  end

  def list_all_rentals_for_person
    puts 'Enter ID of a person: '
    person_id = gets.chomp.to_i
    puts 'All rentals: '
    rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book: #{rental.book.title} rented by #{rental.book.author}"
      else
        puts 'No rentals found by this person'
      end
    end
  end

  def invalid_input
    puts 'Invalid input, try again'
  end
end
