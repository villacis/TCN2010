/*Stata code for estimating the Prospect Theory Risk Preference Parameters of: 
Tanaka, T., Camerer, C. F., & Nguyen, Q. (2010). 
Risk and time preferences: Linking experimental and household survey data from Vietnam. 
American economic review, 100(1), 557-571.*/

**Code Created by Alexis Villacis

** program setup
**Code Created by Alexis Villacis
cd "XXXX"																		// Change your working directory
capture log close				    											// Avoids error message if no log is open
log using XXXX, replace text													// Creates a new log file
clear all 

** Read in data and prepare data for estimation

/*Note 1:

You must code the answers from the participants of your experiments in such a way
that your original data file must contain 3 variables, named S1, S2, and S3:

- S1: This variable is the switching point in Lottery 1 of Tanaka et al. 2010. 
			Lottery 1 has 15 switching points, thus it must contain only values [1-15]. 
			The switching point 15 represents "never switching". 
- S2: This variable is the switching point in Lottery 2 of Tanaka et al. 2010.
			Lottery 2 has 15 switching points, thus it must contain only values [1-15]. 
			The switching point 15 represents "never switching". 
- S3: This variable is the switching point in Lottery 3 of Tanaka et al. 2010. 
			Lottery 3 has 8 switching points, thus it must contain only values [1-8]. 
			The switching point 8 represents "never switching". 

You should associate these variables with and id variable representing the participants of your experiments.
*/

/*Note 2:

If you benefit from this code, make sure to cite these papers that motivated me to write and share this code:

- Villacis, A. H., Alwang, J. R., & Barrera, V. (2021). Linking risk preferences and risk perceptions of climate change: A prospect theory approach. Agricultural Economics, 52(5), 863-877. DOI: 10.1111/agec.12659

- Villacis, A. H. (2023). Inconsistent Choices Over Prospect Theory Lottery Games: Evidence from Field Experiments. Journal of Behavioral and Experimental Economics. DOI: 10.1016/j.socec.2023.101989

Thank you!!!

*/

/*Note 3:

Feel free to reach out to me at: alexis.villacis@asu.edu if you have any questions or find any bugs.

Thank you!!!

*/


use /*THENAMEOFYOURORIGINALDATAFILE*/											//change this with the name of your original file

label var S1 "tanaka switching point series 1"
label var S2 "tanaka switching point series 2"
label var S3 "tanaka switching point series 3"

*******************************************************************************
*Estimate Sigma Parameter - Risk Aversion

generate long sigma =.
label var sigma "sigma parameter - risk aversion"

replace sigma =	1.50	if S1 == 1	& S2 ==	1
replace sigma =	1.40	if S1 == 1	& S2 ==	2
replace sigma =	1.30	if S1 == 1	& S2 ==	3
replace sigma =	1.20	if S1 == 1	& S2 ==	4
replace sigma =	1.15	if S1 == 1	& S2 ==	5
replace sigma =	1.05	if S1 == 1	& S2 ==	6
replace sigma =	1.00	if S1 == 1	& S2 ==	7
replace sigma =	0.95	if S1 == 1	& S2 ==	8
replace sigma =	0.90	if S1 == 1	& S2 ==	9
replace sigma =	0.85	if S1 == 1	& S2 ==	10
replace sigma =	0.80	if S1 == 1	& S2 ==	11
replace sigma =	0.75	if S1 == 1	& S2 ==	12
replace sigma =	0.65	if S1 == 1	& S2 ==	13
replace sigma =	0.60	if S1 == 1	& S2 ==	14
replace sigma =	0.50	if S1 == 1	& S2 ==	15
				
replace sigma =	1.40	if S1 == 2	& S2 ==	1
replace sigma =	1.30	if S1 == 2	& S2 ==	2
replace sigma =	1.20	if S1 == 2	& S2 ==	3
replace sigma =	1.15	if S1 == 2	& S2 ==	4
replace sigma =	1.05	if S1 == 2	& S2 ==	5
replace sigma =	1.00	if S1 == 2	& S2 ==	6
replace sigma =	0.95	if S1 == 2	& S2 ==	7
replace sigma =	0.90	if S1 == 2	& S2 ==	8
replace sigma =	0.85	if S1 == 2	& S2 ==	9
replace sigma =	0.80	if S1 == 2	& S2 ==	10
replace sigma =	0.70	if S1 == 2	& S2 ==	11
replace sigma =	0.65	if S1 == 2	& S2 ==	12
replace sigma =	0.60	if S1 == 2	& S2 ==	13
replace sigma =	0.55	if S1 == 2	& S2 ==	14
replace sigma =	0.45	if S1 == 2	& S2 ==	15
				
replace sigma =	1.35	if S1 == 3	& S2 ==	1
replace sigma =	1.25	if S1 == 3	& S2 ==	2
replace sigma =	1.15	if S1 == 3	& S2 ==	3
replace sigma =	1.05	if S1 == 3	& S2 ==	4
replace sigma =	1.00	if S1 == 3	& S2 ==	5
replace sigma =	0.95	if S1 == 3	& S2 ==	6
replace sigma =	0.90	if S1 == 3	& S2 ==	7
replace sigma =	0.85	if S1 == 3	& S2 ==	8
replace sigma =	0.80	if S1 == 3	& S2 ==	9
replace sigma =	0.75	if S1 == 3	& S2 ==	10
replace sigma =	0.65	if S1 == 3	& S2 ==	11
replace sigma =	0.60	if S1 == 3	& S2 ==	12
replace sigma =	0.55	if S1 == 3	& S2 ==	13
replace sigma =	0.50	if S1 == 3	& S2 ==	14
replace sigma =	0.40	if S1 == 3	& S2 ==	15
				
replace sigma =	1.25	if S1 == 4	& S2 ==	1
replace sigma =	1.15	if S1 == 4	& S2 ==	2
replace sigma =	1.10	if S1 == 4	& S2 ==	3
replace sigma =	1.00	if S1 == 4	& S2 ==	4
replace sigma =	0.95	if S1 == 4	& S2 ==	5
replace sigma =	0.90	if S1 == 4	& S2 ==	6
replace sigma =	0.85	if S1 == 4	& S2 ==	7
replace sigma =	0.80	if S1 == 4	& S2 ==	8
replace sigma =	0.75	if S1 == 4	& S2 ==	9
replace sigma =	0.70	if S1 == 4	& S2 ==	10
replace sigma =	0.65	if S1 == 4	& S2 ==	11
replace sigma =	0.55	if S1 == 4	& S2 ==	12
replace sigma =	0.50	if S1 == 4	& S2 ==	13
replace sigma =	0.45	if S1 == 4	& S2 ==	14
replace sigma =	0.40	if S1 == 4	& S2 ==	15
				
replace sigma =	1.15	if S1 == 5	& S2 ==	1
replace sigma =	1.10	if S1 == 5	& S2 ==	2
replace sigma =	1.00	if S1 == 5	& S2 ==	3
replace sigma =	0.95	if S1 == 5	& S2 ==	4
replace sigma =	0.90	if S1 == 5	& S2 ==	5
replace sigma =	0.85	if S1 == 5	& S2 ==	6
replace sigma =	0.80	if S1 == 5	& S2 ==	7
replace sigma =	0.75	if S1 == 5	& S2 ==	8
replace sigma =	0.70	if S1 == 5	& S2 ==	9
replace sigma =	0.65	if S1 == 5	& S2 ==	10
replace sigma =	0.60	if S1 == 5	& S2 ==	11
replace sigma =	0.50	if S1 == 5	& S2 ==	12
replace sigma =	0.45	if S1 == 5	& S2 ==	13
replace sigma =	0.40	if S1 == 5	& S2 ==	14
replace sigma =	0.35	if S1 == 5	& S2 ==	15
				
replace sigma =	1.10	if S1 == 6	& S2 ==	1
replace sigma =	1.00	if S1 == 6	& S2 ==	2
replace sigma =	0.95	if S1 == 6	& S2 ==	3
replace sigma =	0.90	if S1 == 6	& S2 ==	4
replace sigma =	0.85	if S1 == 6	& S2 ==	5
replace sigma =	0.80	if S1 == 6	& S2 ==	6
replace sigma =	0.75	if S1 == 6	& S2 ==	7
replace sigma =	0.70	if S1 == 6	& S2 ==	8
replace sigma =	0.65	if S1 == 6	& S2 ==	9
replace sigma =	0.60	if S1 == 6	& S2 ==	10
replace sigma =	0.55	if S1 == 6	& S2 ==	11
replace sigma =	0.50	if S1 == 6	& S2 ==	12
replace sigma =	0.45	if S1 == 6	& S2 ==	13
replace sigma =	0.35	if S1 == 6	& S2 ==	14
replace sigma =	0.30	if S1 == 6	& S2 ==	15
				
replace sigma =	1.00	if S1 == 7	& S2 ==	1
replace sigma =	0.95	if S1 == 7	& S2 ==	2
replace sigma =	0.90	if S1 == 7	& S2 ==	3
replace sigma =	0.85	if S1 == 7	& S2 ==	4
replace sigma =	0.80	if S1 == 7	& S2 ==	5
replace sigma =	0.75	if S1 == 7	& S2 ==	6
replace sigma =	0.70	if S1 == 7	& S2 ==	7
replace sigma =	0.65	if S1 == 7	& S2 ==	8
replace sigma =	0.60	if S1 == 7	& S2 ==	9
replace sigma =	0.55	if S1 == 7	& S2 ==	10
replace sigma =	0.50	if S1 == 7	& S2 ==	11
replace sigma =	0.45	if S1 == 7	& S2 ==	12
replace sigma =	0.40	if S1 == 7	& S2 ==	13
replace sigma =	0.35	if S1 == 7	& S2 ==	14
replace sigma =	0.30	if S1 == 7	& S2 ==	15
				
replace sigma =	0.95	if S1 == 8	& S2 ==	1
replace sigma =	0.90	if S1 == 8	& S2 ==	2
replace sigma =	0.85	if S1 == 8	& S2 ==	3
replace sigma =	0.80	if S1 == 8	& S2 ==	4
replace sigma =	0.75	if S1 == 8	& S2 ==	5
replace sigma =	0.70	if S1 == 8	& S2 ==	6
replace sigma =	0.65	if S1 == 8	& S2 ==	7
replace sigma =	0.60	if S1 == 8	& S2 ==	8
replace sigma =	0.55	if S1 == 8	& S2 ==	9
replace sigma =	0.50	if S1 == 8	& S2 ==	10
replace sigma =	0.45	if S1 == 8	& S2 ==	11
replace sigma =	0.40	if S1 == 8	& S2 ==	12
replace sigma =	0.35	if S1 == 8	& S2 ==	13
replace sigma =	0.30	if S1 == 8	& S2 ==	14
replace sigma =	0.25	if S1 == 8	& S2 ==	15
				
replace sigma =	0.90	if S1 == 9	& S2 ==	1
replace sigma =	0.85	if S1 == 9	& S2 ==	2
replace sigma =	0.80	if S1 == 9	& S2 ==	3
replace sigma =	0.75	if S1 == 9	& S2 ==	4
replace sigma =	0.70	if S1 == 9	& S2 ==	5
replace sigma =	0.65	if S1 == 9	& S2 ==	6
replace sigma =	0.60	if S1 == 9	& S2 ==	7
replace sigma =	0.55	if S1 == 9	& S2 ==	8
replace sigma =	0.50	if S1 == 9	& S2 ==	9
replace sigma =	0.45	if S1 == 9	& S2 ==	10
replace sigma =	0.40	if S1 == 9	& S2 ==	11
replace sigma =	0.35	if S1 == 9	& S2 ==	12
replace sigma =	0.30	if S1 == 9	& S2 ==	13
replace sigma =	0.25	if S1 == 9	& S2 ==	14
replace sigma =	0.20	if S1 == 9	& S2 ==	15
				
replace sigma =	0.85	if S1 == 10	& S2 ==	1
replace sigma =	0.80	if S1 == 10	& S2 ==	2
replace sigma =	0.75	if S1 == 10	& S2 ==	3
replace sigma =	0.70	if S1 == 10	& S2 ==	4
replace sigma =	0.65	if S1 == 10	& S2 ==	5
replace sigma =	0.60	if S1 == 10	& S2 ==	6
replace sigma =	0.55	if S1 == 10	& S2 ==	7
replace sigma =	0.50	if S1 == 10	& S2 ==	8
replace sigma =	0.45	if S1 == 10	& S2 ==	9
replace sigma =	0.40	if S1 == 10	& S2 ==	10
replace sigma =	0.35	if S1 == 10	& S2 ==	11
replace sigma =	0.30	if S1 == 10	& S2 ==	12
replace sigma =	0.25	if S1 == 10	& S2 ==	13
replace sigma =	0.20	if S1 == 10	& S2 ==	14
replace sigma =	0.15	if S1 == 10	& S2 ==	15
				
replace sigma =	0.80	if S1 == 11	& S2 ==	1
replace sigma =	0.75	if S1 == 11	& S2 ==	2
replace sigma =	0.70	if S1 == 11	& S2 ==	3
replace sigma =	0.65	if S1 == 11	& S2 ==	4
replace sigma =	0.60	if S1 == 11	& S2 ==	5
replace sigma =	0.55	if S1 == 11	& S2 ==	6
replace sigma =	0.50	if S1 == 11	& S2 ==	7
replace sigma =	0.45	if S1 == 11	& S2 ==	8
replace sigma =	0.40	if S1 == 11	& S2 ==	9
replace sigma =	0.35	if S1 == 11	& S2 ==	10
replace sigma =	0.30	if S1 == 11	& S2 ==	11
replace sigma =	0.25	if S1 == 11	& S2 ==	12
replace sigma =	0.20	if S1 == 11	& S2 ==	13
replace sigma =	0.15	if S1 == 11	& S2 ==	14
replace sigma =	0.10	if S1 == 11	& S2 ==	15
				
replace sigma =	0.75	if S1 == 12	& S2 ==	1
replace sigma =	0.70	if S1 == 12	& S2 ==	2
replace sigma =	0.65	if S1 == 12	& S2 ==	3
replace sigma =	0.60	if S1 == 12	& S2 ==	4
replace sigma =	0.55	if S1 == 12	& S2 ==	5
replace sigma =	0.50	if S1 == 12	& S2 ==	6
replace sigma =	0.45	if S1 == 12	& S2 ==	7
replace sigma =	0.40	if S1 == 12	& S2 ==	8
replace sigma =	0.35	if S1 == 12	& S2 ==	9
replace sigma =	0.30	if S1 == 12	& S2 ==	10
replace sigma =	0.25	if S1 == 12	& S2 ==	11
replace sigma =	0.20	if S1 == 12	& S2 ==	12
replace sigma =	0.15	if S1 == 12	& S2 ==	13
replace sigma =	0.10	if S1 == 12	& S2 ==	14
replace sigma =	0.10	if S1 == 12	& S2 ==	15
				
replace sigma =	0.65	if S1 == 13	& S2 ==	1
replace sigma =	0.60	if S1 == 13	& S2 ==	2
replace sigma =	0.55	if S1 == 13	& S2 ==	3
replace sigma =	0.50	if S1 == 13	& S2 ==	4
replace sigma =	0.50	if S1 == 13	& S2 ==	5
replace sigma =	0.45	if S1 == 13	& S2 ==	6
replace sigma =	0.40	if S1 == 13	& S2 ==	7
replace sigma =	0.35	if S1 == 13	& S2 ==	8
replace sigma =	0.30	if S1 == 13	& S2 ==	9
replace sigma =	0.25	if S1 == 13	& S2 ==	10
replace sigma =	0.20	if S1 == 13	& S2 ==	11
replace sigma =	0.20	if S1 == 13	& S2 ==	12
replace sigma =	0.15	if S1 == 13	& S2 ==	13
replace sigma =	0.10	if S1 == 13	& S2 ==	14
replace sigma =	0.05	if S1 == 13	& S2 ==	15
				
replace sigma =	0.55	if S1 == 14	& S2 ==	1
replace sigma =	0.55	if S1 == 14	& S2 ==	2
replace sigma =	0.50	if S1 == 14	& S2 ==	3
replace sigma =	0.45	if S1 == 14	& S2 ==	4
replace sigma =	0.40	if S1 == 14	& S2 ==	5
replace sigma =	0.40	if S1 == 14	& S2 ==	6
replace sigma =	0.35	if S1 == 14	& S2 ==	7
replace sigma =	0.30	if S1 == 14	& S2 ==	8
replace sigma =	0.25	if S1 == 14	& S2 ==	9
replace sigma =	0.20	if S1 == 14	& S2 ==	10
replace sigma =	0.15	if S1 == 14	& S2 ==	11
replace sigma =	0.15	if S1 == 14	& S2 ==	12
replace sigma =	0.10	if S1 == 14	& S2 ==	13
replace sigma =	0.10	if S1 == 14	& S2 ==	14
replace sigma =	0.05	if S1 == 14	& S2 ==	15
				
replace sigma =	0.50	if S1 == 15	& S2 ==	1
replace sigma =	0.50	if S1 == 15	& S2 ==	2
replace sigma =	0.45	if S1 == 15	& S2 ==	3
replace sigma =	0.40	if S1 == 15	& S2 ==	4
replace sigma =	0.35	if S1 == 15	& S2 ==	5
replace sigma =	0.35	if S1 == 15	& S2 ==	6
replace sigma =	0.30	if S1 == 15	& S2 ==	7
replace sigma =	0.25	if S1 == 15	& S2 ==	8
replace sigma =	0.20	if S1 == 15	& S2 ==	9
replace sigma =	0.20	if S1 == 15	& S2 ==	10
replace sigma =	0.15	if S1 == 15	& S2 ==	11
replace sigma =	0.10	if S1 == 15	& S2 ==	12
replace sigma =	0.10	if S1 == 15	& S2 ==	13
replace sigma =	0.05	if S1 == 15	& S2 ==	14
replace sigma =	0.05	if S1 == 15	& S2 ==	15

*******************************************************************************
*Estimate Alpha parameter - Probability Distortion

generate long alpha =.
label var alpha "alpha parameter - probability distortion"

replace alpha =	0.6		if S1 == 1	& S2 ==	1
replace alpha =	0.6		if S1 == 1	& S2 ==	2
replace alpha =	0.55	if S1 == 1	& S2 ==	3
replace alpha =	0.5		if S1 == 1	& S2 ==	4
replace alpha =	0.45	if S1 == 1	& S2 ==	5
replace alpha =	0.45	if S1 == 1	& S2 ==	6
replace alpha =	0.4		if S1 == 1	& S2 ==	7
replace alpha =	0.35	if S1 == 1	& S2 ==	8
replace alpha =	0.3		if S1 == 1	& S2 ==	9
replace alpha =	0.25	if S1 == 1	& S2 ==	10
replace alpha =	0.2		if S1 == 1	& S2 ==	11
replace alpha =	0.15	if S1 == 1	& S2 ==	12
replace alpha =	0.1		if S1 == 1	& S2 ==	13
replace alpha =	0.05	if S1 == 1	& S2 ==	14
replace alpha =	0.05	if S1 == 1	& S2 ==	15
				
replace alpha =	0.75	if S1 == 2	& S2 ==	1
replace alpha =	0.7		if S1 == 2	& S2 ==	2
replace alpha =	0.6		if S1 == 2	& S2 ==	3
replace alpha =	0.6		if S1 == 2	& S2 ==	4
replace alpha =	0.55	if S1 == 2	& S2 ==	5
replace alpha =	0.5		if S1 == 2	& S2 ==	6
replace alpha =	0.45	if S1 == 2	& S2 ==	7
replace alpha =	0.4		if S1 == 2	& S2 ==	8
replace alpha =	0.35	if S1 == 2	& S2 ==	9
replace alpha =	0.3		if S1 == 2	& S2 ==	10
replace alpha =	0.25	if S1 == 2	& S2 ==	11
replace alpha =	0.2		if S1 == 2	& S2 ==	12
replace alpha =	0.15	if S1 == 2	& S2 ==	13
replace alpha =	0.1		if S1 == 2	& S2 ==	14
replace alpha =	0.05	if S1 == 2	& S2 ==	15
				
replace alpha =	0.75	if S1 == 3	& S2 ==	1
replace alpha =	0.75	if S1 == 3	& S2 ==	2
replace alpha =	0.7		if S1 == 3	& S2 ==	3
replace alpha =	0.65	if S1 == 3	& S2 ==	4
replace alpha =	0.6		if S1 == 3	& S2 ==	5
replace alpha =	0.55	if S1 == 3	& S2 ==	6
replace alpha =	0.5		if S1 == 3	& S2 ==	7
replace alpha =	0.45	if S1 == 3	& S2 ==	8
replace alpha =	0.4		if S1 == 3	& S2 ==	9
replace alpha =	0.35	if S1 == 3	& S2 ==	10
replace alpha =	0.3		if S1 == 3	& S2 ==	11
replace alpha =	0.25	if S1 == 3	& S2 ==	12
replace alpha =	0.2		if S1 == 3	& S2 ==	13
replace alpha =	0.15	if S1 == 3	& S2 ==	14
replace alpha =	0.1		if S1 == 3	& S2 ==	15
				
replace alpha =	0.85	if S1 == 4	& S2 ==	1
replace alpha =	0.8		if S1 == 4	& S2 ==	2
replace alpha =	0.75	if S1 == 4	& S2 ==	3
replace alpha =	0.7		if S1 == 4	& S2 ==	4
replace alpha =	0.65	if S1 == 4	& S2 ==	5
replace alpha =	0.6		if S1 == 4	& S2 ==	6
replace alpha =	0.55	if S1 == 4	& S2 ==	7
replace alpha =	0.5		if S1 == 4	& S2 ==	8
replace alpha =	0.45	if S1 == 4	& S2 ==	9
replace alpha =	0.4		if S1 == 4	& S2 ==	10
replace alpha =	0.35	if S1 == 4	& S2 ==	11
replace alpha =	0.3		if S1 == 4	& S2 ==	12
replace alpha =	0.25	if S1 == 4	& S2 ==	13
replace alpha =	0.2		if S1 == 4	& S2 ==	14
replace alpha =	0.15	if S1 == 4	& S2 ==	15
				
replace alpha =	0.9		if S1 == 5	& S2 ==	1
replace alpha =	0.85	if S1 == 5	& S2 ==	2
replace alpha =	0.8		if S1 == 5	& S2 ==	3
replace alpha =	0.75	if S1 == 5	& S2 ==	4
replace alpha =	0.7		if S1 == 5	& S2 ==	5
replace alpha =	0.65	if S1 == 5	& S2 ==	6
replace alpha =	0.6		if S1 == 5	& S2 ==	7
replace alpha =	0.55	if S1 == 5	& S2 ==	8
replace alpha =	0.5		if S1 == 5	& S2 ==	9
replace alpha =	0.45	if S1 == 5	& S2 ==	10
replace alpha =	0.4		if S1 == 5	& S2 ==	11
replace alpha =	0.35	if S1 == 5	& S2 ==	12
replace alpha =	0.3		if S1 == 5	& S2 ==	13
replace alpha =	0.25	if S1 == 5	& S2 ==	14
replace alpha =	0.2		if S1 == 5	& S2 ==	15
				
replace alpha =	0.95	if S1 == 6	& S2 ==	1
replace alpha =	0.9		if S1 == 6	& S2 ==	2
replace alpha =	0.85	if S1 == 6	& S2 ==	3
replace alpha =	0.8		if S1 == 6	& S2 ==	4
replace alpha =	0.75	if S1 == 6	& S2 ==	5
replace alpha =	0.7		if S1 == 6	& S2 ==	6
replace alpha =	0.65	if S1 == 6	& S2 ==	7
replace alpha =	0.6		if S1 == 6	& S2 ==	8
replace alpha =	0.55	if S1 == 6	& S2 ==	9
replace alpha =	0.5		if S1 == 6	& S2 ==	10
replace alpha =	0.45	if S1 == 6	& S2 ==	11
replace alpha =	0.4		if S1 == 6	& S2 ==	12
replace alpha =	0.35	if S1 == 6	& S2 ==	13
replace alpha =	0.3		if S1 == 6	& S2 ==	14
replace alpha =	0.25	if S1 == 6	& S2 ==	15
				
replace alpha =	1		if S1 == 7	& S2 ==	1
replace alpha =	0.95	if S1 == 7	& S2 ==	2
replace alpha =	0.9		if S1 == 7	& S2 ==	3
replace alpha =	0.85	if S1 == 7	& S2 ==	4
replace alpha =	0.8		if S1 == 7	& S2 ==	5
replace alpha =	0.75	if S1 == 7	& S2 ==	6
replace alpha =	0.7		if S1 == 7	& S2 ==	7
replace alpha =	0.65	if S1 == 7	& S2 ==	8
replace alpha =	0.6		if S1 == 7	& S2 ==	9
replace alpha =	0.55	if S1 == 7	& S2 ==	10
replace alpha =	0.5		if S1 == 7	& S2 ==	11
replace alpha =	0.45	if S1 == 7	& S2 ==	12
replace alpha =	0.4		if S1 == 7	& S2 ==	13
replace alpha =	0.35	if S1 == 7	& S2 ==	14
replace alpha =	0.3		if S1 == 7	& S2 ==	15
				
replace alpha =	1.05	if S1 == 8	& S2 ==	1
replace alpha =	1		if S1 == 8	& S2 ==	2
replace alpha =	0.95	if S1 == 8	& S2 ==	3
replace alpha =	0.9		if S1 == 8	& S2 ==	4
replace alpha =	0.85	if S1 == 8	& S2 ==	5
replace alpha =	0.8		if S1 == 8	& S2 ==	6
replace alpha =	0.75	if S1 == 8	& S2 ==	7
replace alpha =	0.7		if S1 == 8	& S2 ==	8
replace alpha =	0.65	if S1 == 8	& S2 ==	9
replace alpha =	0.6		if S1 == 8	& S2 ==	10
replace alpha =	0.55	if S1 == 8	& S2 ==	11
replace alpha =	0.5		if S1 == 8	& S2 ==	12
replace alpha =	0.45	if S1 == 8	& S2 ==	13
replace alpha =	0.4		if S1 == 8	& S2 ==	14
replace alpha =	0.35	if S1 == 8	& S2 ==	15
				
replace alpha =	1.1		if S1 == 9	& S2 ==	1
replace alpha =	1.05	if S1 == 9	& S2 ==	2
replace alpha =	1		if S1 == 9	& S2 ==	3
replace alpha =	0.95	if S1 == 9	& S2 ==	4
replace alpha =	0.9		if S1 == 9	& S2 ==	5
replace alpha =	0.85	if S1 == 9	& S2 ==	6
replace alpha =	0.8		if S1 == 9	& S2 ==	7
replace alpha =	0.75	if S1 == 9	& S2 ==	8
replace alpha =	0.7		if S1 == 9	& S2 ==	9
replace alpha =	0.65	if S1 == 9	& S2 ==	10
replace alpha =	0.6		if S1 == 9	& S2 ==	11
replace alpha =	0.55	if S1 == 9	& S2 ==	12
replace alpha =	0.5		if S1 == 9	& S2 ==	13
replace alpha =	0.45	if S1 == 9	& S2 ==	14
replace alpha =	0.4		if S1 == 9	& S2 ==	15
				
replace alpha =	1.15	if S1 == 10	& S2 ==	1
replace alpha =	1.1		if S1 == 10	& S2 ==	2
replace alpha =	1.05	if S1 == 10	& S2 ==	3
replace alpha =	1		if S1 == 10	& S2 ==	4
replace alpha =	0.95	if S1 == 10	& S2 ==	5
replace alpha =	0.9		if S1 == 10	& S2 ==	6
replace alpha =	0.85	if S1 == 10	& S2 ==	7
replace alpha =	0.8		if S1 == 10	& S2 ==	8
replace alpha =	0.75	if S1 == 10	& S2 ==	9
replace alpha =	0.7		if S1 == 10	& S2 ==	10
replace alpha =	0.65	if S1 == 10	& S2 ==	11
replace alpha =	0.6		if S1 == 10	& S2 ==	12
replace alpha =	0.55	if S1 == 10	& S2 ==	13
replace alpha =	0.5		if S1 == 10	& S2 ==	14
replace alpha =	0.45	if S1 == 10	& S2 ==	15
				
replace alpha =	1.2		if S1 == 11	& S2 ==	1
replace alpha =	1.15	if S1 == 11	& S2 ==	2
replace alpha =	1.1		if S1 == 11	& S2 ==	3
replace alpha =	1.05	if S1 == 11	& S2 ==	4
replace alpha =	1		if S1 == 11	& S2 ==	5
replace alpha =	0.95	if S1 == 11	& S2 ==	6
replace alpha =	0.9		if S1 == 11	& S2 ==	7
replace alpha =	0.85	if S1 == 11	& S2 ==	8
replace alpha =	0.8		if S1 == 11	& S2 ==	9
replace alpha =	0.75	if S1 == 11	& S2 ==	10
replace alpha =	0.7		if S1 == 11	& S2 ==	11
replace alpha =	0.65	if S1 == 11	& S2 ==	12
replace alpha =	0.6		if S1 == 11	& S2 ==	13
replace alpha =	0.55	if S1 == 11	& S2 ==	14
replace alpha =	0.45	if S1 == 11	& S2 ==	15
				
replace alpha =	1.25	if S1 == 12	& S2 ==	1
replace alpha =	1.2		if S1 == 12	& S2 ==	2
replace alpha =	1.15	if S1 == 12	& S2 ==	3
replace alpha =	1.1		if S1 == 12	& S2 ==	4
replace alpha =	1.05	if S1 == 12	& S2 ==	5
replace alpha =	1		if S1 == 12	& S2 ==	6
replace alpha =	0.95	if S1 == 12	& S2 ==	7
replace alpha =	0.9		if S1 == 12	& S2 ==	8
replace alpha =	0.85	if S1 == 12	& S2 ==	9
replace alpha =	0.8		if S1 == 12	& S2 ==	10
replace alpha =	0.75	if S1 == 12	& S2 ==	11
replace alpha =	0.7		if S1 == 12	& S2 ==	12
replace alpha =	0.65	if S1 == 12	& S2 ==	13
replace alpha =	0.6		if S1 == 12	& S2 ==	14
replace alpha =	0.55	if S1 == 12	& S2 ==	15
				
replace alpha =	1.3		if S1 == 13	& S2 ==	1
replace alpha =	1.25	if S1 == 13	& S2 ==	2
replace alpha =	1.2		if S1 == 13	& S2 ==	3
replace alpha =	1.15	if S1 == 13	& S2 ==	4
replace alpha =	1.1		if S1 == 13	& S2 ==	5
replace alpha =	1.05	if S1 == 13	& S2 ==	6
replace alpha =	1		if S1 == 13	& S2 ==	7
replace alpha =	0.95	if S1 == 13	& S2 ==	8
replace alpha =	0.9		if S1 == 13	& S2 ==	9
replace alpha =	0.85	if S1 == 13	& S2 ==	10
replace alpha =	0.8		if S1 == 13	& S2 ==	11
replace alpha =	0.75	if S1 == 13	& S2 ==	12
replace alpha =	0.7		if S1 == 13	& S2 ==	13
replace alpha =	0.65	if S1 == 13	& S2 ==	14
replace alpha =	0.55	if S1 == 13	& S2 ==	15
				
replace alpha =	1.4		if S1 == 14	& S2 ==	1
replace alpha =	1.35	if S1 == 14	& S2 ==	2
replace alpha =	1.25	if S1 == 14	& S2 ==	3
replace alpha =	1.2		if S1 == 14	& S2 ==	4
replace alpha =	1.15	if S1 == 14	& S2 ==	5
replace alpha =	1.1		if S1 == 14	& S2 ==	6
replace alpha =	1.05	if S1 == 14	& S2 ==	7
replace alpha =	1		if S1 == 14	& S2 ==	8
replace alpha =	0.95	if S1 == 14	& S2 ==	9
replace alpha =	0.9		if S1 == 14	& S2 ==	10
replace alpha =	0.85	if S1 == 14	& S2 ==	11
replace alpha =	0.8		if S1 == 14	& S2 ==	12
replace alpha =	0.75	if S1 == 14	& S2 ==	13
replace alpha =	0.7		if S1 == 14	& S2 ==	14
replace alpha =	0.65	if S1 == 14	& S2 ==	15
				
replace alpha =	1.45	if S1 == 15	& S2 ==	1
replace alpha =	1.4		if S1 == 15	& S2 ==	2
replace alpha =	1.3		if S1 == 15	& S2 ==	3
replace alpha =	1.25	if S1 == 15	& S2 ==	4
replace alpha =	1.2		if S1 == 15	& S2 ==	5
replace alpha =	1.15	if S1 == 15	& S2 ==	6
replace alpha =	1.1		if S1 == 15	& S2 ==	7
replace alpha =	1.05	if S1 == 15	& S2 ==	8
replace alpha =	1		if S1 == 15	& S2 ==	9
replace alpha =	0.95	if S1 == 15	& S2 ==	10
replace alpha =	0.9		if S1 == 15	& S2 ==	11
replace alpha =	0.85	if S1 == 15	& S2 ==	12
replace alpha =	0.8		if S1 == 15	& S2 ==	13
replace alpha =	0.75	if S1 == 15	& S2 ==	14
replace alpha =	0.6		if S1 == 15	& S2 ==	15

*******************************************************************************
*Estimate Lambda parameter - Loss Aversion

generate long lambda =.
label var lambda "lambda parameter - loss aversion"

replace lambda =	0.12	if S3 == 1	& sigma ==	0.05
replace lambda =	0.12	if S3 == 1	& sigma ==	0.10
replace lambda =	0.13	if S3 == 1	& sigma ==	0.15
replace lambda =	0.14	if S3 == 1	& sigma ==	0.20
replace lambda =	0.14	if S3 == 1	& sigma ==	0.25
replace lambda =	0.15	if S3 == 1	& sigma ==	0.30
replace lambda =	0.16	if S3 == 1	& sigma ==	0.35
replace lambda =	0.17	if S3 == 1	& sigma ==	0.40
replace lambda =	0.18	if S3 == 1	& sigma ==	0.45
replace lambda =	0.18	if S3 == 1	& sigma ==	0.50
replace lambda =	0.19	if S3 == 1	& sigma ==	0.55
replace lambda =	0.20	if S3 == 1	& sigma ==	0.60
replace lambda =	0.21	if S3 == 1	& sigma ==	0.65
replace lambda =	0.22	if S3 == 1	& sigma ==	0.70
replace lambda =	0.23	if S3 == 1	& sigma ==	0.75
replace lambda =	0.25	if S3 == 1	& sigma ==	0.80
replace lambda =	0.26	if S3 == 1	& sigma ==	0.85
replace lambda =	0.27	if S3 == 1	& sigma ==	0.90
replace lambda =	0.28	if S3 == 1	& sigma ==	0.95
replace lambda =	0.29	if S3 == 1	& sigma ==	1.00
replace lambda =	0.31	if S3 == 1	& sigma ==	1.05
replace lambda =	0.32	if S3 == 1	& sigma ==	1.10
replace lambda =	0.33	if S3 == 1	& sigma ==	1.15
replace lambda =	0.35	if S3 == 1	& sigma ==	1.20
replace lambda =	0.36	if S3 == 1	& sigma ==	1.25
replace lambda =	0.38	if S3 == 1	& sigma ==	1.30
replace lambda =	0.40	if S3 == 1	& sigma ==	1.35
replace lambda =	0.41	if S3 == 1	& sigma ==	1.40
replace lambda =	0.43	if S3 == 1	& sigma ==	1.45
replace lambda =	0.45	if S3 == 1	& sigma ==	1.50
				
replace lambda =	0.67	if S3 == 2	& sigma ==	0.05
replace lambda =	0.68	if S3 == 2	& sigma ==	0.10
replace lambda =	0.69	if S3 == 2	& sigma ==	0.15
replace lambda =	0.70	if S3 == 2	& sigma ==	0.20
replace lambda =	0.71	if S3 == 2	& sigma ==	0.25
replace lambda =	0.72	if S3 == 2	& sigma ==	0.30
replace lambda =	0.73	if S3 == 2	& sigma ==	0.35
replace lambda =	0.74	if S3 == 2	& sigma ==	0.40
replace lambda =	0.75	if S3 == 2	& sigma ==	0.45
replace lambda =	0.77	if S3 == 2	& sigma ==	0.50
replace lambda =	0.78	if S3 == 2	& sigma ==	0.55
replace lambda =	0.79	if S3 == 2	& sigma ==	0.60
replace lambda =	0.80	if S3 == 2	& sigma ==	0.65
replace lambda =	0.82	if S3 == 2	& sigma ==	0.70
replace lambda =	0.83	if S3 == 2	& sigma ==	0.75
replace lambda =	0.85	if S3 == 2	& sigma ==	0.80
replace lambda =	0.86	if S3 == 2	& sigma ==	0.85
replace lambda =	0.88	if S3 == 2	& sigma ==	0.90
replace lambda =	0.89	if S3 == 2	& sigma ==	0.95
replace lambda =	0.91	if S3 == 2	& sigma ==	1.00
replace lambda =	0.93	if S3 == 2	& sigma ==	1.05
replace lambda =	0.95	if S3 == 2	& sigma ==	1.10
replace lambda =	0.97	if S3 == 2	& sigma ==	1.15
replace lambda =	0.98	if S3 == 2	& sigma ==	1.20
replace lambda =	1.00	if S3 == 2	& sigma ==	1.25
replace lambda =	1.02	if S3 == 2	& sigma ==	1.30
replace lambda =	1.04	if S3 == 2	& sigma ==	1.35
replace lambda =	1.06	if S3 == 2	& sigma ==	1.40
replace lambda =	1.09	if S3 == 2	& sigma ==	1.45
replace lambda =	1.11	if S3 == 2	& sigma ==	1.50

replace lambda =	1.61	if S3 == 3	& sigma ==	0.05
replace lambda =	1.60	if S3 == 3	& sigma ==	0.10
replace lambda =	1.58	if S3 == 3	& sigma ==	0.15
replace lambda =	1.57	if S3 == 3	& sigma ==	0.20
replace lambda =	1.56	if S3 == 3	& sigma ==	0.25
replace lambda =	1.55	if S3 == 3	& sigma ==	0.30
replace lambda =	1.55	if S3 == 3	& sigma ==	0.35
replace lambda =	1.54	if S3 == 3	& sigma ==	0.40
replace lambda =	1.54	if S3 == 3	& sigma ==	0.45
replace lambda =	1.54	if S3 == 3	& sigma ==	0.50
replace lambda =	1.54	if S3 == 3	& sigma ==	0.55
replace lambda =	1.54	if S3 == 3	& sigma ==	0.60
replace lambda =	1.55	if S3 == 3	& sigma ==	0.65
replace lambda =	1.55	if S3 == 3	& sigma ==	0.70
replace lambda =	1.56	if S3 == 3	& sigma ==	0.75
replace lambda =	1.57	if S3 == 3	& sigma ==	0.80
replace lambda =	1.58	if S3 == 3	& sigma ==	0.85
replace lambda =	1.59	if S3 == 3	& sigma ==	0.90
replace lambda =	1.60	if S3 == 3	& sigma ==	0.95
replace lambda =	1.62	if S3 == 3	& sigma ==	1.00
replace lambda =	1.63	if S3 == 3	& sigma ==	1.05
replace lambda =	1.65	if S3 == 3	& sigma ==	1.10
replace lambda =	1.67	if S3 == 3	& sigma ==	1.15
replace lambda =	1.68	if S3 == 3	& sigma ==	1.20
replace lambda =	1.70	if S3 == 3	& sigma ==	1.25
replace lambda =	1.72	if S3 == 3	& sigma ==	1.30
replace lambda =	1.74	if S3 == 3	& sigma ==	1.35
replace lambda =	1.76	if S3 == 3	& sigma ==	1.40
replace lambda =	1.79	if S3 == 3	& sigma ==	1.45
replace lambda =	1.81	if S3 == 3	& sigma ==	1.50

replace lambda =	2.21	if S3 == 4	& sigma ==	0.05
replace lambda =	2.16	if S3 == 4	& sigma ==	0.10
replace lambda =	2.13	if S3 == 4	& sigma ==	0.15
replace lambda =	2.09	if S3 == 4	& sigma ==	0.20
replace lambda =	2.07	if S3 == 4	& sigma ==	0.25
replace lambda =	2.04	if S3 == 4	& sigma ==	0.30
replace lambda =	2.02	if S3 == 4	& sigma ==	0.35
replace lambda =	2.01	if S3 == 4	& sigma ==	0.40
replace lambda =	1.99	if S3 == 4	& sigma ==	0.45
replace lambda =	1.99	if S3 == 4	& sigma ==	0.50
replace lambda =	1.98	if S3 == 4	& sigma ==	0.55
replace lambda =	1.98	if S3 == 4	& sigma ==	0.60
replace lambda =	1.98	if S3 == 4	& sigma ==	0.65
replace lambda =	1.98	if S3 == 4	& sigma ==	0.70
replace lambda =	1.99	if S3 == 4	& sigma ==	0.75
replace lambda =	2.00	if S3 == 4	& sigma ==	0.80
replace lambda =	2.01	if S3 == 4	& sigma ==	0.85
replace lambda =	2.02	if S3 == 4	& sigma ==	0.90
replace lambda =	2.04	if S3 == 4	& sigma ==	0.95
replace lambda =	2.06	if S3 == 4	& sigma ==	1.00
replace lambda =	2.08	if S3 == 4	& sigma ==	1.05
replace lambda =	2.11	if S3 == 4	& sigma ==	1.10
replace lambda =	2.13	if S3 == 4	& sigma ==	1.15
replace lambda =	2.16	if S3 == 4	& sigma ==	1.20
replace lambda =	2.19	if S3 == 4	& sigma ==	1.25
replace lambda =	2.23	if S3 == 4	& sigma ==	1.30
replace lambda =	2.26	if S3 == 4	& sigma ==	1.35
replace lambda =	2.30	if S3 == 4	& sigma ==	1.40
replace lambda =	2.34	if S3 == 4	& sigma ==	1.45
replace lambda =	2.38	if S3 == 4	& sigma ==	1.50

replace lambda =	3.57	if S3 == 5	& sigma ==	0.05
replace lambda =	3.48	if S3 == 5	& sigma ==	0.10
replace lambda =	3.39	if S3 == 5	& sigma ==	0.15
replace lambda =	3.32	if S3 == 5	& sigma ==	0.20
replace lambda =	3.25	if S3 == 5	& sigma ==	0.25
replace lambda =	3.19	if S3 == 5	& sigma ==	0.30
replace lambda =	3.14	if S3 == 5	& sigma ==	0.35
replace lambda =	3.10	if S3 == 5	& sigma ==	0.40
replace lambda =	3.06	if S3 == 5	& sigma ==	0.45
replace lambda =	3.03	if S3 == 5	& sigma ==	0.50
replace lambda =	3.01	if S3 == 5	& sigma ==	0.55
replace lambda =	2.99	if S3 == 5	& sigma ==	0.60
replace lambda =	2.97	if S3 == 5	& sigma ==	0.65
replace lambda =	2.97	if S3 == 5	& sigma ==	0.70
replace lambda =	2.96	if S3 == 5	& sigma ==	0.75
replace lambda =	2.97	if S3 == 5	& sigma ==	0.80
replace lambda =	2.97	if S3 == 5	& sigma ==	0.85
replace lambda =	2.99	if S3 == 5	& sigma ==	0.90
replace lambda =	3.00	if S3 == 5	& sigma ==	0.95
replace lambda =	3.02	if S3 == 5	& sigma ==	1.00
replace lambda =	3.04	if S3 == 5	& sigma ==	1.05
replace lambda =	3.07	if S3 == 5	& sigma ==	1.10
replace lambda =	3.10	if S3 == 5	& sigma ==	1.15
replace lambda =	3.14	if S3 == 5	& sigma ==	1.20
replace lambda =	3.18	if S3 == 5	& sigma ==	1.25
replace lambda =	3.22	if S3 == 5	& sigma ==	1.30
replace lambda =	3.27	if S3 == 5	& sigma ==	1.35
replace lambda =	3.32	if S3 == 5	& sigma ==	1.40
replace lambda =	3.37	if S3 == 5	& sigma ==	1.45
replace lambda =	3.43	if S3 == 5	& sigma ==	1.50

replace lambda =	5.31	if S3 == 6	& sigma ==	0.05
replace lambda =	5.15	if S3 == 6	& sigma ==	0.10
replace lambda =	5.01	if S3 == 6	& sigma ==	0.15
replace lambda =	4.88	if S3 == 6	& sigma ==	0.20
replace lambda =	4.76	if S3 == 6	& sigma ==	0.25
replace lambda =	4.66	if S3 == 6	& sigma ==	0.30
replace lambda =	4.57	if S3 == 6	& sigma ==	0.35
replace lambda =	4.49	if S3 == 6	& sigma ==	0.40
replace lambda =	4.42	if S3 == 6	& sigma ==	0.45
replace lambda =	4.36	if S3 == 6	& sigma ==	0.50
replace lambda =	4.31	if S3 == 6	& sigma ==	0.55
replace lambda =	4.27	if S3 == 6	& sigma ==	0.60
replace lambda =	4.24	if S3 == 6	& sigma ==	0.65
replace lambda =	4.22	if S3 == 6	& sigma ==	0.70
replace lambda =	4.20	if S3 == 6	& sigma ==	0.75
replace lambda =	4.20	if S3 == 6	& sigma ==	0.80
replace lambda =	4.19	if S3 == 6	& sigma ==	0.85
replace lambda =	4.20	if S3 == 6	& sigma ==	0.90
replace lambda =	4.21	if S3 == 6	& sigma ==	0.95
replace lambda =	4.23	if S3 == 6	& sigma ==	1.00
replace lambda =	4.25	if S3 == 6	& sigma ==	1.05
replace lambda =	4.28	if S3 == 6	& sigma ==	1.10
replace lambda =	4.32	if S3 == 6	& sigma ==	1.15
replace lambda =	4.36	if S3 == 6	& sigma ==	1.20
replace lambda =	4.41	if S3 == 6	& sigma ==	1.25
replace lambda =	4.46	if S3 == 6	& sigma ==	1.30
replace lambda =	4.51	if S3 == 6	& sigma ==	1.35
replace lambda =	4.58	if S3 == 6	& sigma ==	1.40
replace lambda =	4.64	if S3 == 6	& sigma ==	1.45
replace lambda =	4.72	if S3 == 6	& sigma ==	1.50

replace lambda =	8.15	if S3 == 7	& sigma ==	0.05
replace lambda =	7.94	if S3 == 7	& sigma ==	0.10
replace lambda =	7.76	if S3 == 7	& sigma ==	0.15
replace lambda =	7.60	if S3 == 7	& sigma ==	0.20
replace lambda =	7.46	if S3 == 7	& sigma ==	0.25
replace lambda =	7.34	if S3 == 7	& sigma ==	0.30
replace lambda =	7.24	if S3 == 7	& sigma ==	0.35
replace lambda =	7.16	if S3 == 7	& sigma ==	0.40
replace lambda =	7.09	if S3 == 7	& sigma ==	0.45
replace lambda =	7.04	if S3 == 7	& sigma ==	0.50
replace lambda =	7.00	if S3 == 7	& sigma ==	0.55
replace lambda =	6.98	if S3 == 7	& sigma ==	0.60
replace lambda =	6.97	if S3 == 7	& sigma ==	0.65
replace lambda =	6.97	if S3 == 7	& sigma ==	0.70
replace lambda =	6.99	if S3 == 7	& sigma ==	0.75
replace lambda =	7.02	if S3 == 7	& sigma ==	0.80
replace lambda =	7.06	if S3 == 7	& sigma ==	0.85
replace lambda =	7.11	if S3 == 7	& sigma ==	0.90
replace lambda =	7.17	if S3 == 7	& sigma ==	0.95
replace lambda =	7.25	if S3 == 7	& sigma ==	1.00
replace lambda =	7.34	if S3 == 7	& sigma ==	1.05
replace lambda =	7.44	if S3 == 7	& sigma ==	1.10
replace lambda =	7.55	if S3 == 7	& sigma ==	1.15
replace lambda =	7.67	if S3 == 7	& sigma ==	1.20
replace lambda =	7.80	if S3 == 7	& sigma ==	1.25
replace lambda =	7.94	if S3 == 7	& sigma ==	1.30
replace lambda =	8.10	if S3 == 7	& sigma ==	1.35
replace lambda =	8.27	if S3 == 7	& sigma ==	1.40
replace lambda =	8.45	if S3 == 7	& sigma ==	1.45
replace lambda =	8.64	if S3 == 7	& sigma ==	1.50
				
replace lambda =	10.41	if S3 == 8	& sigma ==	0.05
replace lambda =	10.17	if S3 == 8	& sigma ==	0.10
replace lambda =	9.96	if S3 == 8	& sigma ==	0.15
replace lambda =	9.78	if S3 == 8	& sigma ==	0.20
replace lambda =	9.62	if S3 == 8	& sigma ==	0.25
replace lambda =	9.48	if S3 == 8	& sigma ==	0.30
replace lambda =	9.37	if S3 == 8	& sigma ==	0.35
replace lambda =	9.29	if S3 == 8	& sigma ==	0.40
replace lambda =	9.22	if S3 == 8	& sigma ==	0.45
replace lambda =	9.17	if S3 == 8	& sigma ==	0.50
replace lambda =	9.14	if S3 == 8	& sigma ==	0.55
replace lambda =	9.13	if S3 == 8	& sigma ==	0.60
replace lambda =	9.14	if S3 == 8	& sigma ==	0.65
replace lambda =	9.17	if S3 == 8	& sigma ==	0.70
replace lambda =	9.21	if S3 == 8	& sigma ==	0.75
replace lambda =	9.27	if S3 == 8	& sigma ==	0.80
replace lambda =	9.34	if S3 == 8	& sigma ==	0.85
replace lambda =	9.44	if S3 == 8	& sigma ==	0.90
replace lambda =	9.54	if S3 == 8	& sigma ==	0.95
replace lambda =	9.67	if S3 == 8	& sigma ==	1.00
replace lambda =	9.81	if S3 == 8	& sigma ==	1.05
replace lambda =	9.96	if S3 == 8	& sigma ==	1.10
replace lambda =	10.13	if S3 == 8	& sigma ==	1.15
replace lambda =	10.32	if S3 == 8	& sigma ==	1.20
replace lambda =	10.52	if S3 == 8	& sigma ==	1.25
replace lambda =	10.74	if S3 == 8	& sigma ==	1.30
replace lambda =	10.98	if S3 == 8	& sigma ==	1.35
replace lambda =	11.23	if S3 == 8	& sigma ==	1.40
replace lambda =	11.50	if S3 == 8	& sigma ==	1.45
replace lambda =	11.79	if S3 == 8	& sigma ==	1.50

save /*NewNameForYourData*/, replace											//change this with a name for your new data file

**Code Created by Alexis Villacis
