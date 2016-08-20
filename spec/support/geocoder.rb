Geocoder.configure(:lookup => :test)
Geocoder::Lookup::Test.add_stub(
  "West Ham, London", [
    {
      'latitude'     => 51.538265,
      'longitude'    => 0.014525,
      'address'      => 'West Ham, London E15, UK',
      'city'	    =>  'London',
      'state'        => 'England',
      'postal_code'   => 'E15',
      'country'      => 'United Kingdom',
      'country_code' => 'GB'
    }
  ]
)

Geocoder::Lookup::Test.add_stub(
  "58183 USA", [
    {
      'latitude'     => 45.7467062,
      'longitude'    => -123.2754162,
      'address'      => '58183 US-26, Timber, OR 97144, USA
',
      'city'	    =>  'Timber',
      'state'        => 'Oregon',
      'postal_code'   => '97144',
      'country'      => 'United States',
      'country_code' => 'USA'
    }
  ]
)

Geocoder::Lookup::Test.add_stub(
  "32950-7123", [
    {
      'latitude'     => 27.9873577,
      'longitude'    => -80.5771737,
      'address'      => 'Malabar, FL 32950, USA',
      'city'	    =>  'Malabar',
      'state'        => 'Florida',
      'postal_code'   => '32950',
      'country'      => 'United States',
      'country_code' => 'USA'
    }
  ]
)

Geocoder::Lookup::Test.add_stub(
  "63618-0398", [
    {
      'latitude'     => 18.5120907,
      'longitude'    => 41.4362457,
      'address'      => '63618, Saudi Arabia',
      'city'	    =>  'Malabar',
      'state'        => 'Makkah Province',
      'postal_code'   => '63618',
      'country'      => 'Saudi Arabia',
      'country_code' => 'SA'
    }
  ]
)

Geocoder::Lookup::Test.add_stub(
  "37431-2175", [
    {
      'latitude'     => 51.6102792,
      'longitude'    => 10.4355016,
      'address'      => '37431 Bad Lauterberg, Germany',
      'city'	    =>  'Bad Lauterberg',
      'state'        => 'Lower Saxony',
      'postal_code'   => '37431',
      'country'      => 'Germany',
      'country_code' => 'DE'
    }
  ]
)

Geocoder::Lookup::Test.add_stub(
  "77625-9206", [
    {
      'latitude'     => 30.4066596,
      'longitude'    => -94.43879,
      'address'      => 'Kountze, TX 77625, USA',
      'city'	    =>  'Kountze',
      'state'        => 'Texas',
      'postal_code'   => '77625',
      'country'      => 'United States',
      'country_code' => 'USA'
    }
  ]
)
