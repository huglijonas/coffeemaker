def drink(coffee):
    if coffee['amount'] > 0:
        coffee['amount'] -= 1
        print("You drank some coffee!")
    elif coffee['amount'] <= 0:
        print("Your coffee pot is empty! You must make coffee!")
    return coffee

def fill(coffee):
    if (coffee['water'] == 0) or (coffee['water'] == 10):
        coffee['water'] = 20
        print("You put some water in your coffee pot!")
    elif coffee['water'] == 20:
        print("You have enough water in your coffee pot!")
    return coffee

def make(coffee):
    if (coffee['amount'] <= 0) and (coffee['water'] > 0) and (coffee['beans'] > 0):
        coffee['amount'] += 5
        coffee['water'] -= 10
        coffee['beans'] -= 20
        print("You made some coffee!")
    elif (coffee['amount'] > 0):
        print("You already have coffee in your coffee pot!")
    elif (coffee['amount'] == 0) and (coffee['water'] == 0) and (coffee['beans'] == 0):
        print("You do not have enough water and coffee beans! You need to fill your coffee pot and to buy some coffee!")
    elif (coffee['amount'] == 0) and (coffee['water'] == 0) and (coffee['beans'] > 0):
        print("You do not have enough water! You need to fill your coffee pot!")
    elif (coffee['amount'] == 0) and (coffee['water'] > 0) and (coffee['beans'] == 0):
        print("You do not have enough coffee beans! You need to buy some coffee!")
    return coffee

def buy(coffee):
    if coffee['beans'] >= 500:
        print("Hey! You have not enough space to store those coffee beans!")
    else:
        coffee['beans'] += 100
        print("You bought some coffee!")
    return coffee

choices = ['drink', 'fill', 'buy', 'make', 'info']
coffee = {
    'amount': 5,
    'beans': 100,
    'water': 20
    }

while True:
    choice = input("Please enter an action (drink, fill, make, buy, info or exit): ")
    if choice in choices:
        if choice == 'drink':
            coffee = drink(coffee)
        elif choice == 'fill':
            coffee = fill(coffee)
        elif choice == 'buy':
            coffee = buy(coffee)
        elif choice == 'make':
            coffee = make(coffee)
        elif choice == 'info':
            print("Coffee cups left: "+str(coffee['amount']))
            print("Water left: "+str(coffee['water']))
            print("Coffee beans left: "+str(coffee['beans']))
    elif choice == 'exit':
        print("Goodbye!")
        exit(0)
    else: print("Please choose a correct choice!")
    print("\n")

