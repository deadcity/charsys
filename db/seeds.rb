# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

character_types = CharacterType.create([
	{name: 'Vampire', power_stat: 'Blood Potency', resource: 'Vitae', morality: 'Humanity', behavior_primary: 'Mask', behavior_secondary: 'Dirge', affiliation: 'Covenant', lineage: 'Clan', sublineage: 'Bloodline', question1: 'AGE: How old are you? How old do you look? How long have you been a vampire? Other than the obvious, how has your life changed since the Embrace?', question2: 'HUMAN LIFE: Where is your character from originally? What was their human life like?', question3: 'SIRE: What was your sire like? Describe your embrace or an early moment in your vampiric existence if you wish.', question4: 'CURRENT LIFE: How do you live your undead life? Where do you live? How do you obtain money? What’s your mode of transportation? Do you have a hobby or goal? Describe an average evening if you wish.', question5: 'CONNECTIONS: Are there are any people that you have strong connections to? A Ghoul? Mortal Family? Enemies? (Other PCs?)', question6: 'LAS VEGAS: How do you feel about King Cole and Las Vegas? The Psu’ho-wurv? The mortal government and crime families?', question7: 'CRYPTIDS: How do you feel about Cryptids? Are there any in particular you have met or been exposed to? Do you prefer to avoid them or have you just not had the chance?', question8: 'SPECIAL ATTENTION: What, if anything, is strange or unique about your character? Does he or she have any specific quirks or flaws? Is anything about your character (capabilities, background, or plans) unusual enough that the Storytellers need to pay special attention to it?'},
	{name: 'Ghoul', power_stat: nil, resource: 'Vitae', morality: 'Integrity', behavior_primary: 'Virtue', behavior_secondary: 'Vice', affiliation: 'Covenant', lineage: 'Clan', sublineage: nil, question1: 'AGE: How old are you? How old do you look? How long have you been a Ghoul? Other than the obvious, how has your life changed since you became a Ghoul?', question2: 'HUMAN LIFE: Where is your character from originally? What was their normal human life like?', question3: 'REGNANT: What is your Regnant like? Describe your relationship or an early moment in your undead existence if you wish.', question4: 'CURRENT LIFE: How do you live your new life? Where do you live? How do you obtain money? What’s your method of transportation? Do you have a hobby or goal? Describe an average evening if you wish.', question5: 'CONNECTIONS: Are there are any people that you have strong connections to? Another Ghoul? Mortal Family? Enemies? (Other PCs?)', question6: 'LAS VEGAS: How do you feel about King Cole and Las Vegas? The Psu’ho-wurv? The mortal government and crime families?', question7: 'CRYPTIDS: How do you feel about Cryptids? Are there any in particular you have met or been exposed to? Do you prefer to avoid them or have you just not had the chance?', question8: 'SPECIAL ATTENTION: What, if anything, is strange or unique about your character? Does he or she have any specific quirks or flaws? Is anything about your character (capabilities, background, or plans) unusual enough that the Storytellers need to pay special attention to it?'},
	{name: 'Mortal', power_stat: nil, resource: nil, morality: 'Integrity', behavior_primary: 'Virtue', behavior_secondary: 'Vice', affiliation: nil, lineage: nil, sublineage: nil, question1: 'NORMAL LIFE: How old are you? How do you live your life? Where do you live? How do you obtain money? What’s your method of transportation? Do you have a hobby or goal? Where is your character from originally? Describe an average evening if you wish.', question2: 'SUPERNATURAL: How did you find out about the supernatural? How long have you known about it? Is there anything you do not believe in? Describe an early interaction if you wish.', question3: 'SUPERNATURAL LIFE: What is your opinion of the supernatural? How do you feel it fits in with the world around you? Other than the obvious, how has your life changed since you found out how the world really works?', question4: 'VAMPIRES: Why do you choose to associate with Kindred Society? What do you gain from being around Vampires? What do you lose? What do they gain or lose?', question5: 'CONNECTIONS: Are there are any people that you have strong connections to? A Vampire or Ghoul? Family? Friends? Enemies? (Other PCs?)', question6: 'LAS VEGAS: How do you feel about Kindred society in Las Vegas? The mortal government and crime families?', question7: 'CRYPTIDS: How do you feel about Cryptids? Are there any in particular you have met or been exposed to? Do you prefer to avoid them or have you just not had the chance?', question8: 'SPECIAL ATTENTION: What, if anything, is strange or unique about your character? Does he or she have any specific quirks or flaws? Is anything about your character (capabilities, background, or plans) unusual enough that the Storytellers need to pay special attention to it?'},
	{name: 'Sin-Eater', power_stat: 'Psyche', resource: 'Plasm', morality: 'Synergy', behavior_primary: 'Calling', behavior_secondary: 'Craving', affiliation: nil, lineage: nil, sublineage: nil, question1: 'NORMAL LIFE: How old are you? How do you live your life? Where do you live? How do you obtain money? What’s your method of transportation? Do you have a hobby or goal? Where is your character from originally? Describe an average evening if you wish.', question2: 'THE BARGAIN: How did you die? What was meeting your Geist like? Why did you say yes to coming back? Other than the obvious, how has your life changed since you became Bound?', question3: 'YOUR GEIST: Describe your Geist. What is your opinion of it? How do you feel it fits in with the world around you? What does the Keystone look like?', question4: 'THE DEAD: What is your opinion on Ghosts and other Ephemeral entities? The Underworld? Describe an early experience with a shade or specter.', question5: 'VAMPIRES: Why do you choose to associate with Kindred Society? What do you gain from being around Vampires? What do you lose? What do they gain or lose? How do you feel about being a “Cryptid”?', question6: 'CONNECTIONS: Are there are any people that you have strong connections to? A Vampire or Ghoul? Family? Friends? Enemies? (Other PCs?)', question7: 'LAS VEGAS: How do you feel about Kindred society in Las Vegas? The mortal government and crime families?', question8: 'SPECIAL ATTENTION: What, if anything, is strange or unique about your character? Does he or she have any specific quirks or flaws? Is anything about your character (capabilities, background, or plans) unusual enough that the Storytellers need to pay special attention to it?'}
	])

power_types = PowerType.create([
	{name: 'Discipline'},
	{name: 'Crúac Ritual'},
	{name: 'Scales of the Dragon'},
	{name: 'Theban Sorcery Ritual'},
	{name: 'Manifestation'}
	])

power_groups = PowerGroup.create([
	{name: 'Animalism', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Auspex', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Celerity', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Dominate', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Majesty', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Nightmare', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Obfuscate', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Protean', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Resilience', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Vigor', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Coil of the Ascendant', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Coil of the Wyrm', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Coil of the Voivode', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Crúac', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'Theban Sorcery', power_type_id: PowerType.find_by_name('Discipline')},
	{name: 'The Boneyard', power_type_id: PowerType.find_by_name('Manifestation')},
	{name: 'The Caul', power_type_id: PowerType.find_by_name('Manifestation')},
	{name: 'The Pale', power_type_id: PowerType.find_by_name('Manifestation')},
	{name: 'The Monument', power_type_id: PowerType.find_by_name('Manifestation')}
	])

lineages = Lineage.create([
	{name: 'Daeva'},
	{name: 'Gangrel'},
	{name: 'Mekhet'},
	{name: 'Nosferatu'},
	{name: 'Ventrue'}
	])

affiliations = Affiliation.create([
	{name: 'Carthian Movement'},
	{name: 'Circle of the Crone'},
	{name: 'Invictus'},
	{name: 'Lancea Sanctum'},
	{name: 'Ordo Dracul'}
	])
