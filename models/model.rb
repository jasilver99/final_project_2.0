require 'twilio-ruby'
class Message
  
  attr_reader :choice
  
  def initialize(choice)
    @choice = choice
    @outfit = ["You killed the outfit game today. Chic, trendy, and shoes were on point.", "You just put fashion police out of business because your outfits have been so on point."]
    @hair = ["Wow, love the new haircut! Jennifer Lawrence will definitely be sporting it soon.", "You are going to be a liscensed trendsetter after showing up with that hairdo"]
    @shoes = ["You’re shoes made me look like a peasant today! You have amazing taste!", "I would give up comfort for style any day if my shoes looked as good as yours did today." ]
    @smile = ["Those pearly whites almost blinded me today! Nice smile!", "Hit me up with your dentist’s number because your smile just lit up the room"]
    @sports = ["You’ve got mad skills! I wish I could be as athletic as you!", "You made Michael Jordan look uncoordidnated today with your skills at the sports field today."]
    @musical = ["You’re voice puts Beyonce to shame! Keep up the amazing vocals and any recording studio would want you!", "Your musical talent is unparralleled! You should give YoYo Ma a lesson!"]
    @intellectual = ["You are indubitably cerebral, phrenic, and erudite. You have the brains to make anything happen.", "Einstein would benefit from a class with you. Your intellect is unparalleled!"]
    @charisma = ["Be more amicable, I dare you! People want to be around you because you are such a fun and charismatic person!", "Your charisma is out of control! Everyone feels imporant and valued around you!"]
    @optimism = ["The glass is overflowing near you! Your positive energy and optimism is infectious!", "You should start filling up other people’s glasses because you are full of optimism!"]
    @enthusiasm = ["You love everything you do and it makes other people happier around you! Keep up the energy and enthusiasm!", "Your passion and enthusiasm for everything you do is infectious!"]
    @humor = ["I cannot stop laughing when I am with you! You are so funny that you always put people in a better mood!", "You should be a comedian because you crack me up like an egg!"]
    @trustworthiness = ["I value that I can tell you anything and know my secret is safe. Few people are as trustworthy as you are.", "I have never felt more comfortable sharing secrets with somebody. You are one of the most trustworthy friends I have."]
  end
  
  def pick_comp
    if @choice == "Outfit"
      rand_selection(@outfit)
    elsif @choice == "Hair"
      rand_selection(@hair)
    elsif @choice == "Shoes"
      rand_selection(@shoes)
    elsif @choice == "Smile"
      rand_selection(@smile)
    elsif @choice == "Sports"
      rand_selection(@sports)
    elsif @choice == "Musical"
      rand_selection(@musical)
    elsif @choice == "Intellectual"
      rand_selection(@intellectual)
    elsif @choice == "Charisma"
     rand_selection(@charisma)
    elsif @choice == "Optimism"
     rand_selection(@optimism)
    elsif @choice == "Enthusiasm"
      rand_selection(@enthusiasm)
    elsif @choice == "Humor"
     rand_selection(@humor)
    elsif @choice == "Trustworthiness"
      rand_selection(@trustworthiness)
    else
    
    end

  end
   def rand_selection(choices)
      array_length = (choices.length - 1)
      random = rand(0..choices.length)
      return choices[random]
  end
  
  

  
  
  def send_message(message, name, num, name2, callback_number, include_link)
    if callback_number == ""
      body = "Hey #{name},\n#{message}\nFrom,\n#{name2}"
    else
       body = "Hey #{name},\n#{message}\nFrom,\n#{name2} (#{callback_number})"
    end

    if include_link == "include_link"
      link = "\nSent with FMS https://goo.gl/ML7AzI"
    else
      link = ""
    end

     account_sid = "ACed3ed813257f8acedfce46a695216257"
     auth_token = "cb1dd832eda91ea39319fe6827f1650b"

      @client = Twilio::REST::Client.new(account_sid, auth_token)
      @client.account.messages.create(
        from: '+14342605034', # this is the Flatiron School's Twilio number
        to: num,
        body: "#{body}#{link}"
      )
  end

end

