# frozen_string_literal: true

10.times do |i|
  material = Material.create!(
    name: "Aluminium door trim BF9#{i}",
    description: Faker::Lorem.unique.paragraphs(number: 30).join(' '),
    max_unit_length: 3,
    thickness: Faker::Number.decimal(l_digits: 2, r_digits: 1),
    width: Faker::Number.decimal(l_digits: 2, r_digits: 1),
    application: 'Residential projects, Commercial projects',
    water_tightness: "Class #{Faker::Number.number(digits: 1)}A",
    burglar_resistance: "Up to RC#{Faker::Number.number(digits: 1)}",
    price: Money.from_amount((10000..50000).to_a.sample)
  )

  material.image.attach(io: File.open(Rails.root.join('db', 'sample', 'images', "door_trim_#{i}.webp")), filename: material.name)
end
