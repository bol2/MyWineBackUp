# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Wine.delete_all

Wine.create(
	shortDescription:%{
		This is a test short description
	},
	bottleSize: '250 cl',
	price: 19.99,
	company: 'company1',
	longDescription:%{
		This is a long description
	},
	county: 'This is a county',
	grape: 'This is the type of grape',
	vegetarians: 'This is not suitable for vegetarians',
	image_url: 'ruby.jpg'
)

Wine.create(
        shortDescription:%{
                This is a test short description
        },
        bottleSize: '250 cl',
        price: 19.99,
        company: 'company1',
        longDescription:%{
                This is a long description
        },
        county: 'This is a county',
        grape: 'This is the type of grape',
        vegetarians: 'This is not suitable for vegetarians',
        image_url: 'ruby.jpg'
)	 

Wine.create(
        shortDescription:%{
                This is a short description
        },
        bottleSize: '350 cl',
        price: 9.99,
        company: 'company2',
        longDescription:%{
                This is a longer description
        },
        county: 'This is a county',
        grape: 'This is the type of grape',
        vegetarians: 'This is suitable for vegetarians',
        image_url: 'ruby.jpg'
)
