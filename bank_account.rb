require 'colorize'

#Bank Account
#User Name
#Be able to deposit money and withdraw funds
#@user_name will be the name that the app uses for the remainer
@user_name
@account_balance = rand(100...1000).to_f
@cchoice
@deposit
@withdraw

def start
  puts "Welcome to Cuartas Bank".colorize(:green)
  separator
  puts "Please enter your name"
  @user_name = gets.strip
  separator
  puts "Hello #{(@user_name).capitalize}, thank you for choosing Cuartas Bank!"
  menu
end

def menu
  puts "What would you like to do today?"
    puts "1) Check account balance"
    puts "2) Deposit funds"
    puts "3) Withdraw funds"
    puts "4) Exit"

    @cchoice = gets.to_i
    
    case @cchoice
    when 1
      separator
      puts "#{(@user_name).capitalize}, your balance is $#{@account_balance}"
      separator
      menu
    when 2
      separator
      deposit
    when 3
      separator
      withdraw
    when 4
      Exit
    else
      separator
      puts "Please enter a valid choice"
      separator
      menu
    end
  end

  def deposit
    puts "Deposit Center"
    separator
    puts "How much would you like to deposit?"
    @deposit = gets.to_f
    @account_balance += @deposit
    separator
    puts "Your new balance is $#{@account_balance}"
    menu
  end

  def withdraw
    puts "Withdrawal Center"
    separator
    puts "#{(@user_name).capitalize}, your balance is $#{@account_balance}"
    puts "How much would you like to withdraw?"
    @withdraw = gets.chomp.to_f
    if @withdraw > @account_balance
      puts "Sorry, not enough funds".colorize(:red)
      separator
      withdraw
    elsif @withdraw <= @account_balance
      @account_balance -= @withdraw
      separator
      puts "Your remaining balance is $#{@account_balance}"
      separator
      menu
    else
      puts "Please enter a valid amount"
    end
  end

  def separator
    puts " "
  end
  start