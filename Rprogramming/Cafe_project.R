#Order our menus
number <- 1:5
products <- c("Chocolate donut 🍩","Strawberry cheesecake 🍰","Coconut cupcake 🧁","Pumpkins pie 🥧","Lemon ice cream 🍨")
price <- c("120","150","100","100","90")
our_menus <- data.frame(number,
                        products,
                        price)


#Function PAO-YING_CHOOB
game_discount <- function() {
    user_score <- 0
    user_score <- as.numeric(user_score)
    computer_score <- 0
    computer_score <- as.numeric(computer_score)
    digit <- seq(1:10000)
    computer_hand <- c(1:3)
    
    
    print("You have 3 chance for maximal 40% discount")
    game_options <- c("hammer: 🔨: 1", 
                      "scissor: ✂️: 2", 
                      "paper: 📄: 3")
    print("Press 1 for hammer 🔨 ")
    print("Press 2 for scissor ✂️ ")
    print("Press 3 for paper 📄 ")
    
    
    Round <- 1
    
    while (Round < 4 ) {
        
        print(paste("Round", Round,"🏁🏁🏁🏁🏁🏁🏁🏁"))
        print("choose one: ")
        user_game_select <- readLines("stdin",1)
        #user_game_select <- readline()
        computer_select <- sample(computer_hand, 1)
        print("🔸🔸🔶🔶🔶")
        
        
        if (user_game_select == "1") {
            if (computer_select == "1") {
                print(" 🔨 vs 🔨 ")
                print("It's draw")
            } else if (computer_select == "2") {
                print(" 🔨 vs ✂️ ")
                print("YOU WIN!!!🎉") 
                user_score <- user_score + 1
            } else {
                print(" 🔨 vs 📄 ")
                print("YOU LOSE")
            }
            Round <- Round + 1
        } 
        else if (user_game_select == "2") {
            if (computer_select == "1") {
                print(" ✂️ vs 🔨 ")
                print("YOU LOSE")
            }
            else if (computer_select == "2") {
                print(" ✂️ vs ✂️ ")
                print("It's draw")
            } else {
                print(" ✂️ vs 📄 ")
                print("YOU WIN!!!🎉")
                user_score <- user_score + 1
            }
            Round <- Round + 1
        } else if (user_game_select == "3") {
            if (computer_select == "1") {
                print(" 📄 vs 🔨 ")
                print("YOU WIN!!🎉")
                user_score <- user_score + 1
            }
            else if (computer_select == "2") {
                print(" 📄 vs ✂️ ")
                print("YOU LOSE") 
            } else {
                print(" 📄 vs 📄 ")
                print("It's draw") 
            }
            
            Round <- Round + 1
        } else {
            print("🔰🔰🔰Please choose 1 or 2 or 3 ‼️‼️‼️")
        }
    }

    print("----------------------------")
    print("----------------------------")
    print(paste("Hoorayyy.🏁 You got",user_score, "point"))
    if (user_score == 3) {
        print("Congratulations!🎁🎊🎉 You can get extra 40% off now")
        print(paste("Your discount code is: ", sample(LETTERS, 1),sample(digit, 1),"40"))
        print("Code will expire in 30 days")
    } else if (user_score == 2) {
        print("Congratulations!🎊🎉 You can get extra 30% off now!")
        print(paste("Your discount code is: ", sample(LETTERS, 1),sample(digit, 1),"30"))
        print("Code will expire in 30 days")
    } else if (user_score == 1) {
        print("Congratulations!🎊 You can get extra 20% off now!")
        print(paste("Your discount code is: ", sample(LETTERS, 1),sample(digit, 1),"20"))
        print("Code will expire in 30 days")
    } else if (user_score == 0) {
        print("Congratulations! You can get extra 10% off now!")
        print(paste("Your discount code is: ", sample(LETTERS, 1),sample(digit, 1),"10"))
        print("Code will expire in 30 days")
    } 
}

#Function greeting
greeting <- function () {
    selected_option <- 0
    user_discount_code <- ""
    options <- c("Press 1️: Order our menus",
                 "Press 2️: Discount code",
                 "Press 3️: Quit menu")
    
    print("What's your name?: ")
    username <- readLines("stdin",1)
    #username <- readline()
    print(paste("Hi!", username, ". I'm AILY 🤖 who is artificial intelligence here for assist Peppawi's company."))
    
    #while (selected_option < 3)
    while (selected_option != 3) {
        print("Press 1️: Order our menus")
        print("Press 2️: Discount code")
        print("Press 3️: Quit menu")
      
        print("So, what can I help you?: ")
        selected_option <- readLines("stdin",1)
        #selected_option <- readline()
      
        if (selected_option == 3) {
          break;
        } else if (selected_option == 2) {
          print("Do you have discount code (Y/N): ")
            user_confirm_code <- readLines("stdin",1)
            #user_confirm_code <- readline()
            
            if (user_confirm_code == "N" | user_confirm_code == "n") 
            {
                print("Back to main options")
            } 
            else 
            {
                print("Please fill your discount code: ")
                user_discount_code <- readLines("stdin",1)
                #user_discount_code <- readline()
                print("Sorry your discount code not valid.")
                break
            }
        } else if (selected_option == 1) {
          user_payment <- "n"
            
            while (user_payment == "N" | user_payment == "n") 
            {
                print("======================================")
                print(our_menus)    
                print("======================================")
                print("What would you like to order? (please fill number of product): ")
                user_select_products <- readLines("stdin",1)
                #user_select_products <- readline()
                
                if (user_select_products > 5) 
                {
                    print("⚠️⚠️⚠️ please fill number of product 1 to 5 ⚠️⚠️⚠️")
                } 
                else 
                { 
                    print("How many would you like to order?: ")
                    user_select_amout <- readLines("stdin",1) 
                    #user_select_amout <- readline()

                    if(grepl("[^[:digit:]\\.-]",user_select_amout)) {
                      print("❌❌❌ please fill only number ❌❌❌")
                    }
                    else {
                      user_select_amout = as.numeric(user_select_amout)
                      user_select_products = as.numeric(user_select_products)
                      
                    
                      user_select_price <- our_menus$price[[user_select_products]]
                      user_select_price = as.numeric(user_select_price)
                    
                      print("-----------------------------")
                      print("Your order:")
                      print(our_menus[user_select_products, ])
                    
                    
                      print(paste("amout",user_select_amout,"piece"))
                      print(paste("total",user_select_amout * user_select_price,"bath"))
                      print("-----------------------------")
                      print("confirm order? (Y/N): ")
                      print("=============================")
                      print("=============================")
                      user_confirm <- readLines("stdin",1)
                      #user_confirm <- readline()
                      if (user_confirm == "N" | user_confirm == "n") {
                        print("Back to menus")
                      }
                      else {
                        print("confirm payment by member credit? (Y/N): ")
                        user_payment <- readLines("stdin",1)
                        #user_payment <- readline()
                      }
                    }

                }
            }
            
            print("Thank you for your order.")
            print("❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️")
            print("Here's PAO-YING-CHOOB game for (at least 10%) discount of your next order")
            
            game_discount()
            break;
        } else {
          print("⚠️ please press 1 or 2 or 3 ⚠️")
        }
       
    }
    print("Thank you for using our chatbot ❤️ 🤖")
          print("+++++++++++++++++++++++++++++++++++")
  }

  
  
greeting()
