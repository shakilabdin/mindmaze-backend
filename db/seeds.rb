# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'
require 'byebug'


# FIRST API CALL WITH GENERAL CATEGORY
c1 = Category.create(name: 'Vehicles')
# c1 = Category.find_by(name: 'Vehicles')
# maximum of 50 questions per call
amount = 50
topic = 28 
token = "5ed27ef58c0cc5d8d99774fa56044361d7db047c4e2613a1e2bef161bbff5026"

API = "https://opentdb.com/api.php?amount=#{amount}&category=#{topic}&type=multiple&token=#{token}"

response = RestClient.get(API)

questions = JSON.parse(response)["results"]


questions.each do |q|
    Question.create(
        category_id: c1.id,
        difficulty: q["difficulty"],
        question: q["question"].gsub(/&quot\;/, "'").gsub(/&#039\;/, "'"),
        first_incorrect: q["incorrect_answers"][0].gsub(/&quot\;/, "'").gsub(/&#039\;/, "'"),
        second_incorrect: q["incorrect_answers"][1].gsub(/&quot\;/, "'").gsub(/&#039\;/, "'"),
        third_incorrect: q["incorrect_answers"][2].gsub(/&quot\;/, "'").gsub(/&#039\;/, "'"),
        correct_choice: q["correct_answer"].gsub(/&quot\;/, "'").gsub(/&#039\;/, "'")
    )
end











# byebug

# 0