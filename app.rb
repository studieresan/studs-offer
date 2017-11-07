require 'sinatra'
require 'haml'

get '/' do
  haml :index
end

get '/style.css' do
 send_file 'style.css'
end

get '/offer.png' do
 send_file 'offer.png'
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

get '/generate' do
  haml :offer, locals: params.map {|k, v| v == '' ? [k.to_sym, nil] : [k.to_sym, v] }.to_h
end

__END__

@@ index
!!!
%html
  %head
    %link{rel: 'stylesheet', href: '/style.css'}
  %body
    #offert
      %img.offert{:src => "offer-2018.png"}/
      %form{ action: '/generate' }
        .content_numbers
          %p
            %input{placeholder: '0000000', name: 'offer_number' }
          %p
            %input{placeholder: '2017-01-01', name: 'offer_date' }
          %p
            %input{placeholder: '2017-02-01', name: 'offer_due_date' }
        .content_orderer
          %p.kerning BESTÄLLARE
          %p
            %input{placeholder: 'Företag AB', name: 'company_name' }
          %p
            %input{placeholder: 'Gata 1', name: 'company_adress' }
          %p
            %input{placeholder: '12525 Stockholm', name: 'company_postal' }
          %br/
          %br/
          %br/
          %p.kerning ER REFERENS
          %p
            %input{placeholder: 'Random Person', name: 'company_reference' }
          %p
            %input{placeholder: '+46 70719 56 51', name: 'company_reference_phone' }
          %p
            %input{placeholder: 'epost@foretag.se', name: 'company_reference_mail' }
        .content_supplier
          %p.kerning LEVERANTÖR
          %p Konglig Datasektionen
          %p Att: Studs 2017, Fack vid THS
          %p 100 44 Stockholm
          %p Org. nummer: 802412-7709
          %br/
          %p.kerning VÅR REFERENS
          %p
            %input{placeholder: 'Vem Då', name: 'our_reference' }
          %p
            %input{placeholder: '+46 70719 56 51', name: 'our_reference_phone' }
          %p
            %input{placeholder: 'epost@studieresan.se', name: 'our_reference_mail' }
        .content_articles
          %ul
            %textarea{name: 'articles'}
              %li Ett event med Studs-gruppen.
              %li Vi garanterar 32 deltagande datastudenter i slutet av sin utbildning.
              %li Vi tillhandahåller CV-databas med alla medlemmar i Studs.
              %li Ni tillhandahåller lokal, samt bjuder på mat och dryck.
              %li Eventet pågår ca 3 timmar.
              %li Eventet sker onsdagen den 18e januari 2017.
        .content_totalprice
          %input{placeholder: '120 SEK', name: 'price' }
        %input{type: 'submit'}
@@ offer
!!!
%html
  %head
    %link{rel: 'stylesheet', href: '/style.css'}
  %body
    #offert
      %img.offert{:src => "offer-2018.png"}/
      .content_numbers
        %p= locals[:offer_number] || '0000000'
        %p= locals[:offer_date] || '2017-01-01'
        %p= locals[:offer_due_date] || '2017-02-01'
      .content_orderer
        %p.kerning BESTÄLLARE
        %p= locals[:company_name] || 'Företag AB'
        %p= locals[:company_adress] || 'Gata 1'
        %p= locals[:company_postal] || '123 44 Stockholm'
        %br/
        %br/
        %br/
        %p.kerning ER REFERENS
        %p= locals[:company_reference] || 'Random Person'
        %p= locals[:company_reference_phone] || '+46 11111 22 33'
        %p= locals[:company_reference_mail] || 'person@foretag.se'
      .content_supplier
        %p.kerning LEVERANTÖR
        %p Konglig Datasektionen
        %p Att: Studs 2017, Fack vid THS
        %p 100 44 Stockholm
        %p Org. nummer: 802412-7709
        %br/
        %p.kerning VÅR REFERENS
        %p= locals[:our_reference] || 'Studsmedlem'
        %p= locals[:our_reference_phone] || '+46 12345 67 89'
        %p= locals[:our_reference_mail] || 'person@kth.se'
      .content_articles
        %ul
          = locals[:articles]
      .content_totalprice
        = locals[:price] || '120 SEK'
