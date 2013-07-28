# encoding: utf-8

require "pry"

require "sinatra"

get "/" do
  pseudo = request.cookies["pseudo"]
  if pseudo
    "Bienvenue sur Twitter #{pseudo}"
  else
    redirect '/formulaire_de_connexion'
  end
end

get "/formulaire_de_connexion" do
  "Qui êtes-vous ?

  <form action='/connexion'>
    <input type='text' name='pseudo'>
  </form>"
end

get "/connexion" do
  pseudo = params["pseudo"]
  response.set_cookie('pseudo', pseudo)
  redirect '/'
end
