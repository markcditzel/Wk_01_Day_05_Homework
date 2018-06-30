require 'minitest/autorun'
require_relative '../pet_shop'

class TestPetShop < Minitest::Test

  def setup

    @customers = [ # this is an array that contains hashes of people
      {
        name: "Alice",
        pets: [],
        cash: 1000
      },
      {
        name: "Bob",
        pets: [],
        cash: 50
      }
    ]

    @new_pet = { # this is a hash for entering new pets int something
      name: "Bors the Younger",
      pet_type: :cat,
      breed: "Cornish Rex",
      price: 100
    }

    @pet_shop = { # this is a hash of pets in the pet shop, containing an array of pets and admin hash and a single name symbol
      pets: [
        {
          name: "Sir Percy",
          pet_type: :cat,
          breed: "British Shorthair",
          price: 500
        },
        {
          name: "King Bagdemagus",
          pet_type: :cat,
          breed: "British Shorthair",
          price: 500
        },
        {
          name: "Sir Lancelot",
          pet_type: :dog,
          breed: "Pomsky",
          price: 1000,
        },
        {
          name: "Arthur",
          pet_type: :dog,
          breed: "Husky",
          price: 900,
        },
        {
          name: "Tristan",
          pet_type: :dog,
          breed: "Basset Hound",
          price: 800,
        },
        {
          name: "Merlin",
          pet_type: :cat,
          breed: "Egyptian Mau",
          price: 1500,
        }
      ],
      admin: {# hash within it @pet_shop, top level
        total_cash: 1000,
        pets_sold: 0,
      },
      name: "Camelot of Pets"
    }
  end
# -------- these are the tests --------------------

#1
  def test_pet_shop_name # this uses a function calles pet_shop_name ans passes in the argument @petshop (which contains the list of pets and admin info)
    name = pet_shop_name(@pet_shop) # the function should pull out the the name:
    assert_equal("Camelot of Pets", name) # should return Camelot of pets
  end

#2
  def test_total_cash # need to return total cash
    sum = total_cash(@pet_shop)
    assert_equal(1000, sum)
  end

#3.1
  def test_add_or_remove_cash__add # retrieve initial cash and modify by sum
    add_or_remove_cash(@pet_shop,10)
    cash = total_cash(@pet_shop)
    assert_equal(1010, cash)
  end

#3.2
  def test_add_or_remove_cash__remove # same function as for above
    add_or_remove_cash(@pet_shop,-10)
    cash = total_cash(@pet_shop)
    assert_equal(990, cash)
  end

#4
  def test_pets_sold # none have been sold. @pet_shop[:admin][:pets_sold]
    sold = pets_sold(@pet_shop)
    assert_equal(0, sold)
  end

#5 /

  def test_increase_pets_sold # increase the number of pets sold by a value
    increase_pets_sold(@pet_shop,2)
    sold = pets_sold(@pet_shop)
    assert_equal(2, sold)
  end

#6
  def test_stock_count # this coumts the items in an array
    count = stock_count(@pet_shop)
    assert_equal(6, count)
  end

# 7
  def test_all_pets_by_breed__found
    pets = pets_by_breed(@pet_shop, "British Shorthair")
    assert_equal(2, pets.count)
  end

#8 # This need #7 pets_by_breed sorted first
  def test_all_pets_by_breed__not_found
    pets = pets_by_breed(@pet_shop, "Dalmation")
    assert_equal(0, pets.count)
  end

#9
  def test_find_pet_by_name__returns_pet
    pet = find_pet_by_name(@pet_shop, "Arthur")
    assert_equal("Arthur", pet[:name])
  end

#9
  def test_find_pet_by_name__returns_nil # cant seem to get fn to return nil!?
    pet = find_pet_by_name(@pet_shop, "Fred")
    assert_nil(pet)
  end

#10
  # def test_remove_pet_by_name
  #   remove_pet_by_name(@pet_shop, "Arthur")
  #   pet = find_pet_by_name(@pet_shop,"Arthur")
  #   assert_nil(pet)
  # end

#11
  # def test_add_pet_to_stock
  #   add_pet_to_stock(@pet_shop, @new_pet)
  #   count = stock_count(@pet_shop)
  #   assert_equal(7, count)
  # end

#12
  # def test_customer_cash
  #   cash = customer_cash(@customers[0])
  #   assert_equal(1000, cash)
  # end

#13
  # def test_remove_customer_cash
  #   customer = @customers[0]
  #   remove_customer_cash(customer, 100)
  #   assert_equal(900, customer[:cash])
  # end

#14
  # def test_customer_pet_count
  #   count = customer_pet_count(@customers[0])
  #   assert_equal(0, count)
  # end

#15
  # def test_add_pet_to_customer
  #   customer = @customers[0]
  #   add_pet_to_customer(customer, @new_pet)
  #   assert_equal(1, customer_pet_count(customer))
  # end

  #------------------# # OPTIONAL

#16
  # def test_customer_can_afford_pet__insufficient_funds
  #   customer = @customers[1]
  #   can_buy_pet = customer_can_afford_pet(customer, @new_pet)
  #   assert_equal(false, can_buy_pet)
  # end

#17
  # def test_customer_can_afford_pet__sufficient_funds
  #   customer = @customers[0]
  #   can_buy_pet = customer_can_afford_pet(customer, @new_pet)
  #   assert_equal(true, can_buy_pet)
  # end

#18
  # #These are 'integration' tests so we want multiple asserts.
  # #If one fails the entire test should fail
  # def test_sell_pet_to_customer__pet_found
  #   customer = @customers[0]
  #   pet = find_pet_by_name(@pet_shop,"Arthur")

  #   sell_pet_to_customer(@pet_shop, pet, customer)

  #   assert_equal(1, customer_pet_count(customer))
  #   assert_equal(1, pets_sold(@pet_shop))
  #   assert_equal(100, customer_cash(customer))
  #   assert_equal(1900, total_cash(@pet_shop))
  # end

#19
  # def test_sell_pet_to_customer__pet_not_found
  #   customer = @customers[0]
  #   pet = find_pet_by_name(@pet_shop,"Dave")

  #   sell_pet_to_customer(@pet_shop, pet, customer)

  #   assert_equal(0, customer_pet_count(customer))
  #   assert_equal(0, pets_sold(@pet_shop))
  #   assert_equal(1000, customer_cash(customer))
  #   assert_equal(1000, total_cash(@pet_shop))
  # end

#20
  # def test_sell_pet_to_customer__insufficient_funds
  #   customer = @customers[1]
  #   pet = find_pet_by_name(@pet_shop,"Arthur")

  #   sell_pet_to_customer(@pet_shop, pet, customer)

  #   assert_equal(0, customer_pet_count(customer))
  #   assert_equal(0, pets_sold(@pet_shop))
  #   assert_equal(50, customer_cash(customer))
  #   assert_equal(1000, total_cash(@pet_shop))
  # end

end
