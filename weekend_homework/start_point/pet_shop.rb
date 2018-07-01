#Function 1 - returns the name of the pet shop from the @pet_shop
def pet_shop_name(arg_pet_shop)
  return arg_pet_shop[:name]
end

# Function 2 - return the total amount from @pet-shop

def total_cash(arg_pet_shop)
  return arg_pet_shop[:admin][:total_cash]
end

# Function 3A - later the total cash by the amount (sum)

def add_or_remove_cash(arg_person, sum)
  arg_person[:admin][:total_cash] += sum
end

# Function 3B - return the modified total_cash

def total_cash(arg_person)
  return arg_person[:admin][:total_cash]
end

# Function 4 - retrieves the No of perts sold must equate to 0

def pets_sold(arg_pet_shop)
  #if arg_pet_shop[:admin][:pets_sold] == 0
    return arg_pet_shop[:admin][:pets_sold]
end

#//TODO #Function 5 - alters the numvber of pets sold - COME BACK TO THIS!!!

def increase_pets_sold(arg_pet_shop, number_of_new_sales) #add sum to initial sold count and update it; also call previous function pet_sold to return the updated value
  arg_pet_shop[:admin][:pets_sold] += (number_of_new_sales)
#Q????? It works, but why do I not need to invoke the pets_sold?
end

# Function 6 - counts the number of pet items in the hash @pet_shop[:pets] array
def stock_count(arg_pet_shop)
  return arg_pet_shop[:pets].count
end

# Function 7 - inerrogate pets array and search for breed hash that matches Brit Shorthair. The test calls pets.count so must return an var or array

def pets_by_breed (arg_pet_shop, selected_breed) # this is failing as returning 1 an not 2!!!!!!
  select_array = []
  for pet in arg_pet_shop[:pets]
    if pet[:breed] == selected_breed
      select_array << pet
    end
  end
  return select_array
end

# Function 8
#utilises pets_by_breed above! so no additional function needed


# Function 9
def find_pet_by_name(arg_pet_shop, pet_name)
  for pet in arg_pet_shop[:pets]
    if pet[:name] == pet_name
        return pet
    end
  end
return nil
end

# def find_pet_by_name(arg_pet_shop, pet_name)
#   for pet in arg_pet_shop[:pets]
#     if pet[:name] == pet_name
#         return arg_pet_shop[:pet]
#     else #### ???????WHY does else not work in this loop????
#       return nil
#     end
#   end
# end

# Function 10
#Remove a pet by name, #need a nil return, #need to delete a hash from the pets array
# Maybe first see if pet is not in hash, then if not procees with delete
# Or when there is no match return nil; otherwise proceed with delete function?

def remove_pet_by_name(arg_pet_shop, arg_pet_name)
  for pet in arg_pet_shop[:pets]
    if pet[:name] == arg_pet_name
      arg_pet_shop[:pets].delete pet
    end
  end
end

# #FAILED did not return nil
# def remove_pet_by_name(arg_pet_shop, arg_pet_name)
#   for pet in arg_pet_shop[:pets]
#     if pet[:name] == arg_pet_name
#       arg_pet_shop[:pets].delete (arg_pet_name)
#     end
#   end
# end

#Did not work
# def remove_pet_by_name(arg_pet_shop, arg_pet_name)
#   for pet in arg_pet_shop[:pets]
#     if pet[:name] == arg_pet_name
#       arg_pet_shop[:pets][:name].delete (arg_pet_name)
#     end
#   end
# end

#DID NOT WORK
# def remove_pet_by_name(arg_pet_shop, pet_name)
#   for pet in arg_pet_shop[:pets]
#     if pet[:name] != pet_name
#       #arg_pet_shop[:pet] = arg_pet_shop[:pet].delete(pet_name)
#       arg_pet_shop[:pets][:name].delete([:pets][:name][pet_name]
#     end
#   end
#
# return nil
# end

#Function 11 add a pet to stock list; input pet shop, insert new put pre-defined @new pet, creat array and then count it, return the number

def add_pet_to_stock(arg_pet_shop, arg_new_pet)
  arg_pet_shop[:pets]<< arg_new_pet
end

#Function 12

def customer_cash(arg_customer_id)
  return arg_customer_id[:cash]
end

# Function 13 # access Alice. removes 100, return use customer cash function

def remove_customer_cash(arg_customer_id, sum_to_remove)
  arg_customer_id[:cash] -= (sum_to_remove)
end

#Function 14 # count the number of pets owned by a certain customer
def customer_pet_count(arg_customer_id)
  arg_customer_id[:pets].count
end

#Function 15
def add_pet_to_customer(arg_customer_id, arg_add_pet)
  arg_customer_id[:pets]<<(arg_add_pet)
end
