Geocoder.configure(:lookup => :test)
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

## Squatter
Geocoder::Lookup::Test.add_stub(
  "London, E6 6ER", [
    {
      'latitude'     => 51.53187880000001,
      'longitude'    => 0.05422730000000001,
      'address'      => 'London E6 6ER, UK',
      'city'	    =>  'London',
      'state'        => 'England',
      'postal_code'   => 'E6 6ER',
      'country'      => 'United Kingdom',
      'country_code' => 'GB'
    }
  ]
)

## <5km
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

## <10km
Geocoder::Lookup::Test.add_stub(
  "Liverpool Street, London", [
    {
      'latitude'     => 51.5175794,
      'longitude'    => -0.0830363,
      'address'      => 'Liverpool St, London EC2M, UK',
      'city'	    =>  'London',
      'state'        => 'England',
      'postal_code'   => 'EC2M',
      'country'      => 'United Kingdom',
      'country_code' => 'GB'
    }
  ]
)

## <25km
Geocoder::Lookup::Test.add_stub(
  "Acton Town, London", [
    {
      'latitude'     => 51.5084214,
      'longitude'    => -0.2745505,
      'address'      => 'Acton, London W3, UK',
      'city'	    =>  'London',
      'state'        => 'England',
      'postal_code'   => 'W3',
      'country'      => 'United Kingdom',
      'country_code' => 'GB'
    }
  ]
)
