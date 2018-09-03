/*pig_donationsCanditade.pig
Show the amount of donations that a specified candidate recieved on the 2014
 brazillian elections
 For this example, it was used the name of the winning candidate Dilma Rouseff,
 but, the variable 'result2' has all the candidates that recieved donations in 2014*/


donations = LOAD 'doacao.csv' USING PigStorage(',') AS (num:int, id_election:int, cat_election_description:chararray, 
dat_donation_date_time:chararray, id_accountant_cnpj:int, id_candidate_seq:int, cat_election_state:chararray, 
cat_party:chararray, id_candidate_num:int, cat_political_office:chararray, cat_candidate_name:chararray, 
id_candidate_cpf:int, id_receipt_num:chararray, id_document_num:int, id_donator_cpf_cnpj:int, 
cat_donator_name:chararray, cat_donator_name2:chararray, cat_donator_state:chararray, id_donator_party:int ,
id_donator_number:int, id_donator_economic_sector:int, cat_donator_economic_sector:chararray, 
dat_donation_date:chararray, num_donation_ammount:int, cat_donation_type:chararray, cat_donation_source:chararray,
cat_donation_method:chararray, cat_donation_description:chararray, id_original_donator_cpf_cnpj:int,
cat_original_donator_name:chararray, cat_original_donator_type:chararray);


candidate = GROUP donations BY cat_candidate_name;
result2 = FOREACH candidate GENERATE group, COUNT(donations);
f = FILTER result2 BY (group matches '.*DILMA VANA ROUSSEFF.*');
dump f;

/*First we group the donations by the candidates names, then we count the number of
donations that each candidate recieved. Finally we use a filter to search the name 
DILMA VANA ROUSSEFF on the group and then we print the result in the screen using
'dump'*/