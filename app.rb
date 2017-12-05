require 'sinatra'
require 'haml'

get '/' do
  haml :offer_form
end

get '/invoice' do
  haml :invoice_form
end

get '/style.css' do
 send_file 'style.css'
end

get '/offer.png' do
 send_file 'offer.png'
end

get '/invoice.png' do
  send_file 'invoice.png'
end

get '/offer-2018.png' do
 send_file 'offer-2018.png'
end

get '/dincondensed.ttf' do
 send_file 'dincondensed.ttf'
end

get '/neuzeitslt.ttf' do
 send_file 'neuzeitslt.ttf'
end

get '/generate_offer' do
  haml :offer, locals: params.map {|k, v| v == '' ? [k.to_sym, nil] : [k.to_sym, v] }.to_h
end

get '/generate_invoice' do
  haml :invoice, locals: params.map {|k, v| v == '' ? [k.to_sym, nil] : [k.to_sym, v] }.to_h
end
