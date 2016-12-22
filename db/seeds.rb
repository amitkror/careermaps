# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)



j = FactoryGirl.create(:job,
  name: 'Medical Assistant',
  slug: 'medical-assistant',
  copy: 'Something to consider... The baby boom generation is aging with the ﬁrst wave of boomers retiring in 2007. Older Americans tend to need access to medical   services, which means that jobs in the health care industry will only continue to expand.',
  duties: 'Work under the supervision of a physician or nurse. Clinical duties may include taking vital signs, drawing blood, and preparing patients for examinations. Clerical duties may include scheduling, maintaining records, and billing and cotding.',
  pay: '$26,000 to $39,000 per year or $12 to $19 per hour',
  hot_industry: 'true',
  needs_certification: 'true',
  answer_1_id: '1',
  answer_2_id: '3',
  answer_3_id: '5',
  answer_4_id: '7',
)

j = FactoryGirl.create(:job,
  name: 'Dental Hygienist',
  slug: 'dental-hygienist',
  duties: 'Work under the supervision of a physician or nurse. Clinical duties may include taking vital signs, drawing blood, and preparing patients for examinations. Clerical duties may include scheduling, maintaining records, and billing and cotding.',
  pay: '$26,000 to $39,000 per year or $12 to $19 per hour',
  hot_industry: 'true',
  needs_certification: 'true',
  answer_1_id: '1',
  answer_2_id: '4',
  answer_3_id: '6',
  answer_4_id: '7',
)


j = FactoryGirl.create(:job,
  name: 'Web Developer',
  slug: 'web-developer',
  duties: 'Work under the supervision of a project managers and dragons. Fight the power with cron jobs that play silly noises. Run the world with your keyboard. Report to Caleb.',
  pay: '$26,000 to $39,000 per year or $12 to $19 per hour',
  hot_industry: 'true',
  needs_certification: 'false',
  answer_1_id: '1',
  answer_2_id: '3',
  answer_3_id: '5',
  answer_4_id: '7',
)

c = FactoryGirl.create(:career,
  name: 'Media & Advertising',
  short_description: 'This is a short description of what careers in this field entail. Lorem ipsum dolor sit amet.',
  about_the_field: 'Health care delivery is changing. More and more services are being provided outside hospitals, emergency rooms and nursing homes. This ﬁeld is called outpatient health care. In New York City, about 200,000 people work in outpatient health care and earn $47,000 per year on average. It is the fastest growing part of the health care industry.
More and more services are being provided outside hospitals, emergency rooms and nursing homes. This ﬁeld is called outpatient health care. In New York City, about 200,000 people work in outpatient health care and earn $47,000 per year on average. It is the fastest growing part of the health care industry.
This ﬁeld is called outpatient health care. In New York City, about 200,000 people work in outpatient health care and earn $47,000 per year on average. It is the fastest growing part of the health care industry. Health care delivery is changing. More and more services are being provided outside hospitals, emergency rooms and nursing homes. This ﬁeld is called outpatient health care. In New York City, about 200,000 people work in outpatient health care and earn $47,000 per year on average. It is the fastest growing part of the health care industry.',
  a_good_fit:'advisors free on NYC College Line. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui ofﬁcia deserunt mollit anim ',
  slug:'media-and-advertising'
)

c = FactoryGirl.create(:career,
  name: 'Culinary',
  short_description: 'This is a short description of what careers in this field entail. Lorem ipsum dolor sit amet.',
  about_the_field: 'About the field copy',
  a_good_fit:'A good fit',
  slug:'culinary'
)

c = FactoryGirl.create(:career,
  name: 'Information Technology (IT)',
  short_description: 'Caleb Brown plays on computers all day long.',
  about_the_field: 'About the field copy',
  a_good_fit:'A good fit',
  slug:'information-technology'
)

c = FactoryGirl.create(:career,
  name: 'Social Services',
  short_description: 'This is a short description of what careers in this field entail. Lorem ipsum dolor sit amet.',
  about_the_field: 'About the field copy',
  a_good_fit:'A good fit',
  slug:'social-services'
)
c = FactoryGirl.create(:career,
  name: 'Finance',
  short_description: 'This is a short description of what careers in this field entail. Lorem ipsum dolor sit amet.',
  about_the_field: 'About the field copy',
  a_good_fit:'A good fit',
  slug:'finance'
)

c = FactoryGirl.create(:career,
  name: 'Building & Maintaining Green Buildings',
  short_description: 'This is a short description of what careers in this field entail. Lorem ipsum dolor sit amet.',
  about_the_field: 'About the field copy',
  a_good_fit:'A good fit',
  slug:'building-maintaining-green'
)
c = FactoryGirl.create(:career,
  name: 'Civil Service',
  short_description: 'This is a short description of what careers in this field entail. Lorem ipsum dolor sit amet.',
  about_the_field: 'About the field copy',
  a_good_fit:'A good fit',
  slug:'civil-service'
)
c = FactoryGirl.create(:career,
  name: 'Fashion',
  short_description: 'This is a short description of what careers in this field entail. Lorem ipsum dolor sit amet.',
  about_the_field: 'About the field copy',
  a_good_fit:'A good fit',
  slug:'fashion'
)
c = FactoryGirl.create(:career,
  name: 'Health',
  short_description: 'This is a short description of what careers in this field entail. Lorem ipsum dolor sit amet.',
  about_the_field: 'About the field copy',
  a_good_fit:'A good fit',
  slug:'health'
)
c = FactoryGirl.create(:career,
  name: 'Transportation',
  short_description: 'This is a short description of what careers in this field entail. Lorem ipsum dolor sit amet.',
  about_the_field: 'About the field copy',
  a_good_fit:'A good fit',
  slug:'transportation'
)
c = FactoryGirl.create(:career,
  name: 'Logistics',
  short_description: 'This is a short description of what careers in this field entail. Lorem ipsum dolor sit amet.',
  about_the_field: 'About the field copy',
  a_good_fit:'A good fit',
  slug:'logistics'
)
c = FactoryGirl.create(:career,
  name: 'Engineering',
  short_description: 'This is a short description of what careers in this field entail. Lorem ipsum dolor sit amet.',
  about_the_field: 'About the field copy',
  a_good_fit:'A good fit',
  slug:'engineering'
)

b = FactoryGirl.create(:career_job,
  career_id: '1',
  job_id: '1'
)
b = FactoryGirl.create(:career_job,
  career_id: '1',
  job_id: '2'
)
b = FactoryGirl.create(:career_job,
  career_id: '3',
  job_id: '3'
)

b = FactoryGirl.create(:career_job,
  career_id: '2',
  job_id: '3'
)