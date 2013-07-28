# encoding: utf-8

require "pry"

require "sinatra"

get "/" do
  pseudo = request.cookies["pseudo"]
  if pseudo
    salutation = "Bienvenue sur Twitter #{pseudo}"
  else
    salutation= "Qui êtes-vous ?"
  end
  "#{salutation}

   <form action='/connexion'>
     <input type='text' name='pseudo'>
   </form>"
end

get "/connexion" do
  pseudo = params["pseudo"]
  response.set_cookie('pseudo', pseudo)
  redirect '/'
end
