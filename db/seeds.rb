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
	{name: 'Animalism', power_type_id: 1},
	{name: 'Auspex', power_type_id: 1},
	{name: 'Celerity', power_type_id: 1},
	{name: 'Dominate', power_type_id: 1},
	{name: 'Majesty', power_type_id: 1},
	{name: 'Nightmare', power_type_id: 1},
	{name: 'Obfuscate', power_type_id: 1},
	{name: 'Protean', power_type_id: 1},
	{name: 'Resilience', power_type_id: 1},
	{name: 'Vigor', power_type_id: 1},
	{name: 'Coil of the Ascendant', power_type_id: 1},
	{name: 'Coil of the Wyrm', power_type_id: 1},
	{name: 'Coil of the Voivode', power_type_id: 1},
	{name: 'Crúac', power_type_id: 1},
	{name: 'Theban Sorcery', power_type_id: 1},
	{name: 'The Boneyard', power_type_id: 5},
	{name: 'The Caul', power_type_id: 5},
	{name: 'The Pale', power_type_id: 5},
	{name: 'The Monument', power_type_id: 5}
	])

powers = Power.create([
	{name: 'Feral Whispers', rating: 1, power_group_id: 1},
	{name: 'Raise the Familiar', rating: 2, power_group_id: 1},
	{name: 'Summon the Hunt', rating: 3, power_group_id: 1},
	{name: 'Feral Infection', rating: 4, power_group_id: 1},
	{name: 'Lord of the Land', rating: 5, power_group_id: 1},
	{name: 'Beast\'s Hackles', rating: 1, power_group_id: 2},
	{name: 'Uncanny Perception', rating: 2, power_group_id: 2},
	{name: 'The Spirit\'s Touch', rating: 3, power_group_id: 2},
	{name: 'Lay Open the Mind', rating: 4, power_group_id: 2},
	{name: 'Twilight Projection', rating: 5, power_group_id: 2},
	])

character_type_has_power_type = CharacterTypeHasPowerType.create([
	{character_type_id: 1, power_type_id: 1},
	{character_type_id: 1, power_type_id: 2},
	{character_type_id: 1, power_type_id: 3},
	{character_type_id: 1, power_type_id: 4},
	{character_type_id: 2, power_type_id: 1},
	{character_type_id: 4, power_type_id: 5}
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
	{name: 'Lancea et Sanctum'},
	{name: 'Ordo Dracul'}
	])

character_type_has_lineages = CharacterTypeHasLineage.create([
	{character_type_id: 1, lineage_id: 1},
	{character_type_id: 1, lineage_id: 2},
	{character_type_id: 1, lineage_id: 3},
	{character_type_id: 1, lineage_id: 4},
	{character_type_id: 1, lineage_id: 5},
	{character_type_id: 2, lineage_id: 1},
	{character_type_id: 2, lineage_id: 2},
	{character_type_id: 2, lineage_id: 3},
	{character_type_id: 2, lineage_id: 4},
	{character_type_id: 2, lineage_id: 5}
	])

character_type_has_affiliations = CharacterTypeHasAffiliation.create([
	{character_type_id: 1, affiliation_id: 1},
	{character_type_id: 1, affiliation_id: 2},
	{character_type_id: 1, affiliation_id: 3},
	{character_type_id: 1, affiliation_id: 4},
	{character_type_id: 1, affiliation_id: 5},
	{character_type_id: 2, affiliation_id: 1},
	{character_type_id: 2, affiliation_id: 2},
	{character_type_id: 2, affiliation_id: 3},
	{character_type_id: 2, affiliation_id: 4},
	{character_type_id: 2, affiliation_id: 5}
	])

behavior_primaries = BehaviorPrimary.create([
	{name: 'Authoritarian'},
	{name: 'Child'},
	{name: 'Competitor'},
	{name: 'Conformist'},
	{name: 'Conspirator'},
	{name: 'Courtesan'},
	{name: 'Cult Leader'},
	{name: 'Deviant'},
	{name: 'Follower'},
	{name: 'Guru'},
	{name: 'Idealist'},
	{name: 'Jester'},
	{name: 'Junkie'},
	{name: 'Martyr'},
	{name: 'Masochist'},
	{name: 'Monster'},
	{name: 'Nomad'},
	{name: 'Nurturer'},
	{name: 'Perfectionist'},
	{name: 'Penitent'},
	{name: 'Questioner'},
	{name: 'Rebel'},
	{name: 'Scholar'},
	{name: 'Social Chameleon'},
	{name: 'Soldier'},
	{name: 'Spy'},
	{name: 'Survivor'},
	{name: 'Visionary'},
	{name: 'Hopeful'},
	{name: 'Loving'},
	{name: 'Honest'},
	{name: 'Humble'},
	{name: 'Ambitious'},
	{name: 'Trustworthy'},
	{name: 'Loyal'},
	{name: 'Just'},
	{name: 'Peaceful'},
	{name: 'Generous'},
	{name: 'Righteous'},
	{name: 'Courageous'},
	{name: 'Patient'},
	{name: 'Advocate'},
	{name: 'Celebrant'},
	{name: 'Gatekeeper'},
	{name: 'Mourner'},
	{name: 'Necromancer'},
	{name: 'Nostalgic'},
	{name: 'Pilgrim'},
	{name: 'Reaper'}
	])

behavior_secondaries = BehaviorSecondary.create([
	{name: 'Authoritarian'},
	{name: 'Child'},
	{name: 'Competitor'},
	{name: 'Conformist'},
	{name: 'Conspirator'},
	{name: 'Courtesan'},
	{name: 'Cult Leader'},
	{name: 'Deviant'},
	{name: 'Follower'},
	{name: 'Guru'},
	{name: 'Idealist'},
	{name: 'Jester'},
	{name: 'Junkie'},
	{name: 'Martyr'},
	{name: 'Masochist'},
	{name: 'Monster'},
	{name: 'Nomad'},
	{name: 'Nurturer'},
	{name: 'Perfectionist'},
	{name: 'Penitent'},
	{name: 'Questioner'},
	{name: 'Rebel'},
	{name: 'Scholar'},
	{name: 'Social Chameleon'},
	{name: 'Soldier'},
	{name: 'Spy'},
	{name: 'Survivor'},
	{name: 'Visionary'},
	{name: 'Pessimistic'},
	{name: 'Hateful'},
	{name: 'Deceitful'},
	{name: 'Arrogant'},
	{name: 'Ambitious'},
	{name: 'Treacherous'},
	{name: 'Untrustworthy'},
	{name: 'Cruel'},
	{name: 'Violent'},
	{name: 'Greedy'},
	{name: 'Corrupt'},
	{name: 'Cowardly'},
	{name: 'Hasty'},
	{name: 'Acedia'},
	{name: 'Attention'},
	{name: 'Appetite'},
	{name: 'Narcotics'},
	{name: 'Revenge'},
	{name: 'Objects'},
	{name: 'Secrets'},
	{name: 'Violence'}
	])

character_type_has_behavior_primaries = CharacterTypeHasBehaviorPrimary.create([
	{character_type_id: 1, behavior_primary_id: 1},
	{character_type_id: 1, behavior_primary_id: 2},
	{character_type_id: 1, behavior_primary_id: 3},
	{character_type_id: 1, behavior_primary_id: 4},
	{character_type_id: 1, behavior_primary_id: 5},
	{character_type_id: 1, behavior_primary_id: 6},
	{character_type_id: 1, behavior_primary_id: 7},
	{character_type_id: 1, behavior_primary_id: 8},
	{character_type_id: 1, behavior_primary_id: 9},
	{character_type_id: 1, behavior_primary_id: 10},
	{character_type_id: 1, behavior_primary_id: 11},
	{character_type_id: 1, behavior_primary_id: 12},
	{character_type_id: 1, behavior_primary_id: 13},
	{character_type_id: 1, behavior_primary_id: 14},
	{character_type_id: 1, behavior_primary_id: 15},
	{character_type_id: 1, behavior_primary_id: 16},
	{character_type_id: 1, behavior_primary_id: 17},
	{character_type_id: 1, behavior_primary_id: 18},
	{character_type_id: 1, behavior_primary_id: 19},
	{character_type_id: 1, behavior_primary_id: 20},
	{character_type_id: 1, behavior_primary_id: 21},
	{character_type_id: 1, behavior_primary_id: 22},
	{character_type_id: 1, behavior_primary_id: 23},
	{character_type_id: 1, behavior_primary_id: 24},
	{character_type_id: 1, behavior_primary_id: 25},
	{character_type_id: 1, behavior_primary_id: 26},
	{character_type_id: 1, behavior_primary_id: 27},
	{character_type_id: 1, behavior_primary_id: 28},
	{character_type_id: 2, behavior_primary_id: 29},
	{character_type_id: 2, behavior_primary_id: 30},
	{character_type_id: 2, behavior_primary_id: 31},
	{character_type_id: 2, behavior_primary_id: 32},
	{character_type_id: 2, behavior_primary_id: 33},
	{character_type_id: 2, behavior_primary_id: 34},
	{character_type_id: 2, behavior_primary_id: 35},
	{character_type_id: 2, behavior_primary_id: 36},
	{character_type_id: 2, behavior_primary_id: 37},
	{character_type_id: 2, behavior_primary_id: 38},
	{character_type_id: 2, behavior_primary_id: 39},
	{character_type_id: 2, behavior_primary_id: 40},
	{character_type_id: 2, behavior_primary_id: 41},
	{character_type_id: 3, behavior_primary_id: 29},
	{character_type_id: 3, behavior_primary_id: 30},
	{character_type_id: 3, behavior_primary_id: 31},
	{character_type_id: 3, behavior_primary_id: 32},
	{character_type_id: 3, behavior_primary_id: 33},
	{character_type_id: 3, behavior_primary_id: 34},
	{character_type_id: 3, behavior_primary_id: 35},
	{character_type_id: 3, behavior_primary_id: 36},
	{character_type_id: 3, behavior_primary_id: 37},
	{character_type_id: 3, behavior_primary_id: 38},
	{character_type_id: 3, behavior_primary_id: 39},
	{character_type_id: 3, behavior_primary_id: 40},
	{character_type_id: 3, behavior_primary_id: 41},
	{character_type_id: 4, behavior_primary_id: 42},
	{character_type_id: 4, behavior_primary_id: 43},
	{character_type_id: 4, behavior_primary_id: 44},
	{character_type_id: 4, behavior_primary_id: 45},
	{character_type_id: 4, behavior_primary_id: 46},
	{character_type_id: 4, behavior_primary_id: 47},
	{character_type_id: 4, behavior_primary_id: 48},
	{character_type_id: 4, behavior_primary_id: 49}
	])

character_type_has_behavior_secondaries = CharacterTypeHasBehaviorSecondary.create([
	{character_type_id: 1, behavior_secondary_id: 1},
	{character_type_id: 1, behavior_secondary_id: 2},
	{character_type_id: 1, behavior_secondary_id: 3},
	{character_type_id: 1, behavior_secondary_id: 4},
	{character_type_id: 1, behavior_secondary_id: 5},
	{character_type_id: 1, behavior_secondary_id: 6},
	{character_type_id: 1, behavior_secondary_id: 7},
	{character_type_id: 1, behavior_secondary_id: 8},
	{character_type_id: 1, behavior_secondary_id: 9},
	{character_type_id: 1, behavior_secondary_id: 10},
	{character_type_id: 1, behavior_secondary_id: 11},
	{character_type_id: 1, behavior_secondary_id: 12},
	{character_type_id: 1, behavior_secondary_id: 13},
	{character_type_id: 1, behavior_secondary_id: 14},
	{character_type_id: 1, behavior_secondary_id: 15},
	{character_type_id: 1, behavior_secondary_id: 16},
	{character_type_id: 1, behavior_secondary_id: 17},
	{character_type_id: 1, behavior_secondary_id: 18},
	{character_type_id: 1, behavior_secondary_id: 19},
	{character_type_id: 1, behavior_secondary_id: 20},
	{character_type_id: 1, behavior_secondary_id: 21},
	{character_type_id: 1, behavior_secondary_id: 22},
	{character_type_id: 1, behavior_secondary_id: 23},
	{character_type_id: 1, behavior_secondary_id: 24},
	{character_type_id: 1, behavior_secondary_id: 25},
	{character_type_id: 1, behavior_secondary_id: 26},
	{character_type_id: 1, behavior_secondary_id: 27},
	{character_type_id: 1, behavior_secondary_id: 28},
	{character_type_id: 2, behavior_secondary_id: 29},
	{character_type_id: 2, behavior_secondary_id: 30},
	{character_type_id: 2, behavior_secondary_id: 31},
	{character_type_id: 2, behavior_secondary_id: 32},
	{character_type_id: 2, behavior_secondary_id: 33},
	{character_type_id: 2, behavior_secondary_id: 34},
	{character_type_id: 2, behavior_secondary_id: 35},
	{character_type_id: 2, behavior_secondary_id: 36},
	{character_type_id: 2, behavior_secondary_id: 37},
	{character_type_id: 2, behavior_secondary_id: 38},
	{character_type_id: 2, behavior_secondary_id: 39},
	{character_type_id: 2, behavior_secondary_id: 40},
	{character_type_id: 2, behavior_secondary_id: 41},
	{character_type_id: 3, behavior_secondary_id: 29},
	{character_type_id: 3, behavior_secondary_id: 30},
	{character_type_id: 3, behavior_secondary_id: 31},
	{character_type_id: 3, behavior_secondary_id: 32},
	{character_type_id: 3, behavior_secondary_id: 33},
	{character_type_id: 3, behavior_secondary_id: 34},
	{character_type_id: 3, behavior_secondary_id: 35},
	{character_type_id: 3, behavior_secondary_id: 36},
	{character_type_id: 3, behavior_secondary_id: 37},
	{character_type_id: 3, behavior_secondary_id: 38},
	{character_type_id: 3, behavior_secondary_id: 39},
	{character_type_id: 3, behavior_secondary_id: 40},
	{character_type_id: 3, behavior_secondary_id: 41},
	{character_type_id: 4, behavior_secondary_id: 42},
	{character_type_id: 4, behavior_secondary_id: 43},
	{character_type_id: 4, behavior_secondary_id: 44},
	{character_type_id: 4, behavior_secondary_id: 45},
	{character_type_id: 4, behavior_secondary_id: 46},
	{character_type_id: 4, behavior_secondary_id: 47},
	{character_type_id: 4, behavior_secondary_id: 48},
	{character_type_id: 4, behavior_secondary_id: 49}
	])

attribute_categories = AttributeCategory.create([
	{name: 'Mental'},
	{name: 'Physical'},
	{name: 'Social'}
	])

skill_categories = SkillCategory.create([
	{name: 'Mental'},
	{name: 'Physical'},
	{name: 'Social'}
	])

attribs = Attrib.create([
	{name: 'Intelligence', attribute_category_id: 1},
	{name: 'Wits', attribute_category_id: 1},
	{name: 'Resolve', attribute_category_id: 1},
	{name: 'Strength', attribute_category_id: 2},
	{name: 'Dexterity', attribute_category_id: 2},
	{name: 'Stamina', attribute_category_id: 2},
	{name: 'Presence', attribute_category_id: 3},
	{name: 'Manipulation', attribute_category_id: 3},
	{name: 'Composure', attribute_category_id: 3}
	])

skills = Skill.create([
	{name: 'Academics', skill_category_id: 1},
	{name: 'Computer', skill_category_id: 1},
	{name: 'Crafts', skill_category_id: 1},
	{name: 'Investigation', skill_category_id: 1},
	{name: 'Medicine', skill_category_id: 1},
	{name: 'Occult', skill_category_id: 1},
	{name: 'Politics', skill_category_id: 1},
	{name: 'Science', skill_category_id: 1},
	{name: 'Athletics', skill_category_id: 2},
	{name: 'Brawl', skill_category_id: 2},
	{name: 'Drive', skill_category_id: 2},
	{name: 'Firearms', skill_category_id: 2},
	{name: 'Larceny', skill_category_id: 2},
	{name: 'Stealth', skill_category_id: 2},
	{name: 'Survival', skill_category_id: 2},
	{name: 'Weaponry', skill_category_id: 2},
	{name: 'Animal Ken', skill_category_id: 3},
	{name: 'Empathy', skill_category_id: 3},
	{name: 'Expression', skill_category_id: 3},
	{name: 'Intimidation', skill_category_id: 3},
	{name: 'Persuasion', skill_category_id: 3},
	{name: 'Socialize', skill_category_id: 3},
	{name: 'Streetwise', skill_category_id: 3},
	{name: 'Subterfuge', skill_category_id: 3},
	])

merits = Merit.create([
	{name: 'Acute Senses', allowed_ratings: '[1]', has_specification: false, has_description: false},
	{name: 'Allies', allowed_ratings: '[1,2,3,4,5]', has_specification: true, has_description: true},
	{name: 'Alternate Identity', allowed_ratings: '[1,2,3]', has_specification: true, has_description: true},
	{name: 'Altar', allowed_ratings: '[3]', has_specification: false, has_description: false},
	{name: 'Anointed', allowed_ratings: '[2]', has_specification: false, has_description: false},
	{name: 'Anonymity', allowed_ratings: '[1,2,3,4,5]', has_specification: false, has_description: false},
	{name: 'Area of Expertise', allowed_ratings: '[1]', has_specification: true, has_description: false},
	{name: 'Attaché', allowed_ratings: '[1,2,3,4,5]', has_specification: true, has_description: true},
	{name: 'Barfly', allowed_ratings: '[2]', has_specification: false, has_description: false},
	{name: 'Bloodhound', allowed_ratings: '[2]', has_specification: false, has_description: false},
	{name: 'Bloodline Membership', allowed_ratings: '[2]', has_specification: true, has_description: false},
	{name: 'Cacophony Savvy', allowed_ratings: '[1,2,3]', has_specification: false, has_description: false},
	{name: 'Carthian Pull', allowed_ratings: '[1]', has_specification: false, has_description: false},
	{name: 'Casino', allowed_ratings: '[1]', has_specification: false, has_description: false},
	{name: 'Claws of the Unholy', allowed_ratings: '[1]', has_specification: false, has_description: false},
	{name: 'Close Family', allowed_ratings: '[1]', has_specification: false, has_description: false},
	{name: 'Common Sense', allowed_ratings: '[3]', has_specification: false, has_description: false},
	{name: 'Contacts', allowed_ratings: '[1]', has_specification: true, has_description: false},
	{name: 'Crack Driver', allowed_ratings: '[2,3]', has_specification: false, has_description: false},
	{name: 'Devoted', allowed_ratings: '[3]', has_specification: true, has_description: false},
	{name: 'Distinguished Palate', allowed_ratings: '[1]', has_specification: false, has_description: false},
	{name: 'Double-Jointed', allowed_ratings: '[2]', has_specification: false, has_description: false},
	{name: 'Dynasty Membership', allowed_ratings: '[1,2,3]', has_specification: true, has_description: false},
	{name: 'Fame', allowed_ratings: '[1,2,3]', has_specification: true, has_description: false},
	{name: 'Feeding Grounds', allowed_ratings: '[1,2,3,4,5]', has_specification: true, has_description: true},
	{name: 'Fleet of Foot', allowed_ratings: '[1,2,3]', has_specification: false, has_description: false},
	{name: 'Herd', allowed_ratings: '[1,2,3,4,5]', has_specification: true, has_description: false}
	])