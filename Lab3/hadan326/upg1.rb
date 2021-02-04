# coding: utf-8
class Person
  attr_accessor :car_brand, :zip_code, :license, :gender, :age, :policies
  def initialize(car_brand, zip_code, license, gender, age)
    @brand, @zip_code, @license, @gender, @age = car_brand, zip_code, license, gender, age
    @policies = Policies.new
    @rules = [1, 1]
    @current = ""
  end

  def evaluate_policy(policy)
    instance_eval(File.read(policy))
   
    score = 0.0
    score += policies.brand[@brand]
    score += policies.gender[@gender]
    score += policies.zip_code[@zip_code]
    for item in policies.license
      if item[0].include?(@license)
        score += item[1]
        break
      end
    end
    for item in policies.age
      if item[0].include?(@age)
        score += item[1]
        break
      end
    end
 
    #rule1
    if @gender == "M" && @license < 3
      score *= @rules[0]
    end
    rule2
    if @brand == "Volvo" && (@zip_code =~ /58/) == 0
      score *= @rules[1]
    end
    return score
  end
  
  def method_missing(name, *args)
#    puts "Name is: #{name}\nArguments are: #{args}"
    if args.empty?
      @current = name.to_s
    elsif name.to_s == "rule1"
      @rules[0] = args[0].to_f
    elsif name.to_s == "rule2"
      @rules[1] = args[0].to_f    
    else
      case @current
      when "brand_policy" then @policies.brand[name.to_s] = args[0].to_f
      when "zip_policy" then @policies.zip_code[zip_convertor(name.to_s)] = args[0].to_f
      when "license_policy" then @policies.license[to_range(name.to_s)] = args[0].to_f 
      when "gender_policy" then @policies.gender[name.to_s] = args[0].to_f
      when "age_policy" then @policies.age[to_range(name.to_s)] = args[0].to_f
      end
    end

  end
end

class Policies
  attr_accessor :brand, :zip_code, :license, :gender, :age
  def initialize()
    @brand = {}
    @zip_code = {}
    @license = {}
    @gender = {}
    @age = {}
  end
end

def to_range(str)
  match = str.scan(/(\d+)\D+(\d+)/).flatten
  return (match[0].to_i..match[1].to_i)
end

def zip_convertor(str)
  match = str.scan(/(\d+)/).flatten
  return match[0].to_s
end

kalle = Person.new("Volvo", "58726", 2, "M", 32)
puts kalle.evaluate_policy("policy.rb")

# puts kalle.policies.brand
# puts kalle.policies.zip_code
# puts kalle.policies.license
# puts kalle.policies.gender
# puts kalle.policies.age

