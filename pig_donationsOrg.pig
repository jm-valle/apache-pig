
/*pig_donationsOrg.pig
Show the number of donations that each organization made 
on the 2014 brazillian elections*/

donations = LOAD 'doacao.csv' USING PigStorage(',') AS (num:int, id_election:int, 
cat_election_description:chararray, dat_donation_date_time:chararray, id_accountant_cnpj:long, 
id_candidate_seq:long, cat_election_state:chararray, cat_party:chararray, id_candidate_num:int, 
cat_political_office:chararray, cat_candidate_name:chararray, id_candidate_cpf:long, 
id_receipt_num:chararray, id_document_num:long, id_donator_cpf_cnpj:long, cat_donator_name:chararray, 
cat_donator_name2:chararray, cat_donator_state:chararray, id_donator_party:int ,id_donator_number:int, 
id_donator_economic_sector:int, cat_donator_economic_sector:chararray, dat_donation_date:chararray, 
num_donation_ammount:int, cat_donation_type:chararray, cat_donation_source:chararray, 
cat_donation_method:chararray, cat_donation_description:chararray, id_original_donator_cpf_cnpj:long, 
cat_original_donator_name:chararray, cat_original_donator_type:chararray, cat_original_donator_economic_sector:chararray, 
cat_original_donator_name2:chararray);

/*
First of all, the data is loaded from the .csv file on the 'donations' variable
 */

companies = GROUP donations BY cat_donator_name2;
result2 = FOREACH companies GENERATE group, COUNT(donations) AS c;
result3 = ORDER result2 BY c;
dump result3;

/* Then, we group the donations by the donator, and after that
We group them by companies as C, that means that we'll have the
number of donations that each company has made.
Finally we order the result by number of donations, and then we print it using 
dump*/
