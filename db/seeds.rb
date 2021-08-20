# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
user = User.create!(username: 'admin', email: 'admin@galisoft.com', password: 'P@ssW0rd2021', password_confirmation: 'P@ssW0rd2021')
puts "Created Admin user: #{user.email}"
Activity.delete_all
NP = 'National Park'
activity_one = Activity.create!(
  title: 'Gorilla Trekking',
  park: "Bwindi Impenetrable #{NP}",
  user_id: user.id,
  image_url: 'https://source.unsplash.com/800x600/?gorilla',
  details: "
    There are 4 locations for tracking gorillas in BINP these are Buhoma, Ruhija, Rushaga, and Nkuringo. The 4 locations have a total of about 18 families as of December 2018. Tracking permits must be bought before tracking by booking directly with the reservations office at the Uganda Wildlife Authority (UWA) Headquarters or through a reputable tour agent. Permits can be paid for up to two years in advance. 
    Only 8 visitors are allowed to view the gorillas for one hour per day, participants must be aged 15 or over. and they will be accompanied by UWA guides while with the Gorillas.
    Tracking the gorillas can last from a few hours to a whole day, depending on how far the group has moved since it was observed nesting up the previous evening.
  "
)
activity_two = Activity.create!(
  title: 'Game Drive',
  park: "Queen Elizabeth #{NP}",
  user_id: user.id,
  image_url: 'https://source.unsplash.com/800x600/?gamedrives',
  details: "
    For a classic African safari experience, the tracks through Kasenyi, the North Kazinga Plains and the Ishasha Sector offer virtually guaranteed buffalo, antelope and elephant sightings, along with warthogs and baboons. Taking an experienced guide in the early morning or at dusk is the most successful way to track down a pride of lions, and maybe even the odd leopard
  "
)
activity_three = Activity.create!(
  title: 'Birding',
  park: "Queen Elizabeth #{NP}",
  user_id: user.id,
  image_url: 'https://source.unsplash.com/800x600/?birding',
  details: "
    Classified as an Important Birding Area (IBA) by Birding International, Queen’s great variety of habitats mean it is home to over 600 species. This is the greatest of any East African national park and a phenomenal number for such a small area. The park’s confluence of savanna and forest, linking to the expansive forests of the DR Congo allow visitors to spot East as well as Central African species.
  "
)
activity_four = Activity.create!(
  title: 'Forest Walking',
  park: "Bwindi Impenetrable #{NP}",
  user_id: user.id,
  image_url: 'https://source.unsplash.com/800x600/?forest',
  details: "
    There are six main nature trails in Buhoma for those who wish to explore the “impenetrable forest”, including waterfall walks, forest walks, primate encounters, mountain views and impressive birdlife.
  "
)
activity_five = Activity.create!(
  title: 'Mountain Hiking',
  park: "Mount Rwenzori #{NP}",
  user_id: user.id,
  image_url: 'https://source.unsplash.com/800x600/?hiking',
  details: "
    Follow the trails up to Lake Mahooma and Buraro chimp forest;  through the communities of Kichamba to the Karangura ridge; and to Bundibugo area through Bwamba pass. The communities of Ruboni and Turaco View also offer guided forest walks of various lengths just outside the park.
    The communities of Ruboni and Turaco View also offer guided forest walks of various lengths just outside the park. Visitors can follow the River Mubuku, and glimpse views of Baker and Portal Peaks as they hike up to 2,300m above sea level. On a clear day it is even possible to view the snow capped Margherita Peak - a truly spectacular sight. Along the way, keep an eye out for chameleons, squirrels, vervet monkeys and many birds.
  "
)
activity_six = Activity.create!(
  title: 'Sport Hunting',
  park: "Kidepo #{NP}",
  user_id: user.id,
  image_url: 'https://source.unsplash.com/800x600/?hunting',
  details: "
    Hunting trips to Uganda are among the least expensive in Africa. For every safari you need to consider spending on meals, accommodation, trackers and Guides. In Uganda, hunting impalas, elands and impala would each cost about $800. Zebras cost $600. Most of the other antelopes fall below $500.
  "
)
activity_seven = Activity.create!(
  title: 'Sport Fishing',
  park: "Lake Mburo #{NP}",
  user_id: user.id,
  image_url: 'https://source.unsplash.com/800x600/?fishing',
  details: "
    Lake Mburo contains around six species of fish, with tilapia being the most common. The designated fishing spot is at Mazinga; visitors planning to fish here should carry their own equipment and obtain a permit from Uganda Wildlife Authority.
  "
)
activity_eight = Activity.create!(
  title: 'Chimpanzee Tracking',
  park: "Kibale #{NP}",
  user_id: user.id,
  image_url: 'https://source.unsplash.com/800x600/?chimpanzee',
  details: "
    Kibale’s most popular activity is the Kanyanchu Primate Walk. Thirteen species can be sought, and a good variety of diurnal monkeys invariably encountered, but the stars of this trail are the chimpanzees. Kanyanchu’s chimps have been tracked since 1993 and the chances of locating them are excellent. Guided walks start at 8am and 2pm and last an average of three hours, depending on various factors.
  "
)
activity_nine = Activity.create!(
  title: 'Mountain Biking',
  park: "Mount Elgon #{NP}",
  user_id: user.id,
  image_url: 'https://source.unsplash.com/800x600/?mountainbiking',
  details: "
    A mountain biking trail runs from Sipi trading centre to Chema Hill in Kapchorwa town. It should take 1.5 hours and provides views of various waterfalls and the Karamoja plains.  Bikes can be hired from Sipi River Lodge. 
  "
)
puts "Created #{Activity.count} activities"
