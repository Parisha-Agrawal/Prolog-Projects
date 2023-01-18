recommend_individual(A,I):- A<18 , I='beaches, adventure'.
recommend_individual(A,I):- A>=18 , A<30 , I='beaches, wildlife ,adventure'.
recommend_individual(A,I):- A>=30 , A<60 , I='beaches ,wildlife'.
recommend_individual(A,I):- A>=60 , I='culture, religious, nature'.

recommend_family(E,C,I):- E=='yes' , C=='yes' , I='beaches, culture, nature'.
recommend_family(E,C,I):- E=='no' , C=='yes' , I='beaches, culture, wildlife'.
recommend_family(E,C,I):- E=='yes' , C=='no' , I='culture, nature'.
recommend_family(E,C,I):- E=='no' , C=='no' , I='beaches, wildlife, adventure'.


recommend_friends(A,I):- A<18 , I='beaches, adventure'.
recommend_friends(A,I):- A>=18 , A<30 , I='beaches, wildlife, adventure'.
recommend_friends(A,I):- A>=30 , A<60 , I='beaches, wildlife'.
recommend_friends(A,I):- A>=60 , I='culture, religious, nature'.


show(P,I,R):- P=='local' , I=='beaches', R='Goa, Andaman, Lakshadweep'.
show(P,I,R):- P=='local' , I=='culture', R='Gujrat, Rajasthan'.
show(P,I,R):- P=='local' , I=='nature', R='Shimla, Mussoorie'.
show(P,I,R):- P=='local' , I=='wildlife', R='Corbett, Kaziranga, Ranthambore'.
show(P,I,R):- P=='local' , I=='adventure', R='Goa, Andaman, Manali, Rishikesh'.
show(P,I,R):- P=='local' , I=='religious', R='Kashi, Varanasi, Haridwar, Kedarnath'.

show(P,I,R):- P=='foreign' , I=='beaches', R='Phuket, Maldives, Bali'.
show(P,I,R):- P=='foreign' , I=='culture', R='Kenya, Poland, Greece'.
show(P,I,R):- P=='foreign' , I=='nature', R='Nepal, Norway, Iceland'.
show(P,I,R):- P=='foreign' , I=='wildlife', R='Thailand, Africa, Botswana'.
show(P,I,R):- P=='foreign' , I=='adventure', R='Australia, Argentina, New Zealand'.
show(P,I,R):- P=='foreign' , I=='religious', R='Nepal, Tibet, Thailand, Bali'.



start:-
write('Enter your name : '),
read(Name),nl,
write('Hello '),
write(Name),nl,

write('What is the type of trip you are planning to go?'),nl,
write('1.individual'),nl,
write('2.family'),nl,
write('3.friends'),nl,
read(TripType),nl,

write('Which type of trip do you prefer?'),nl,
write('1.local'),nl,
write('2.foreign'),nl,
read(PlaceLF),nl,



write('Let us start this recommendation system!!'),nl,
(
	TripType=='individual'->
	write('What is your age?'),nl,
	read(Age),
        recommend_individual(Age,Interest),
        write('The interests of people can be : beaches, culture, nature, wildlife ,adventure and religious'),nl,
        write('The most popular interests of people of your are : '),
	write(Interest),nl,

        write('What is your interest?'),nl,
	read(Interest_of_Person),
	show(PlaceLF,Interest_of_Person,RecommendedPlaces),
	write('You can go to places like : '),
	write(RecommendedPlaces)
	;
	(
		TripType=='family'->
                write('Are there elderly people in your group(yes or no)?'),nl,
                read(Elderly),nl,
                write('Are there children in your group(yes or no)?'),nl,
                read(Children),nl,

                recommend_family(Elderly,Children,Interest),
                write('The interests of people can be : beaches, culture, nature, wildlife ,adventure and religious'),nl,
                write('The most popular interests for this type of family trips are : '),
		write(Interest),nl,
                write('Which of these are you interested in?'),nl,
		read(Interest_of_family),
		show(PlaceLF,Interest_of_family,RecommendedPlaces),

	        write('You can go to places like : '),
	        write(RecommendedPlaces)
	    ;
		write('What is your age?'),nl,
                read(Age),
                recommend_friends(Age,Interest),
                write('The interests of people can be : beaches, culture, nature, wildlife ,adventure and religious'),nl,
                write('The most popular interests of people of your age for a trip of friends are : '),
		write(Interest),nl,
                write('What is your interest?'),nl,
	        read(Interest_of_Friends),

		show(PlaceLF,Interest_of_Friends,RecommendedPlaces),
                write('You can go to places like : '),
                write(RecommendedPlaces)
	)

).
