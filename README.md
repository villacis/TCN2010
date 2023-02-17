Stata code for estimating Prospect Theory Risk Preference Parameters as presented in: 
Tanaka, T., Camerer, C. F., & Nguyen, Q. (2010). Risk and time preferences: Linking experimental and household survey data from Vietnam. American economic review, 100(1), 557-571.

Code Created by Alexis Villacis

Note 1:

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


Note 2:

If you benefit from this code, make sure to cite these papers that motivated me to write and share this code:

- Villacis, A. H., Alwang, J. R., & Barrera, V. (2021). Linking risk preferences and risk perceptions of climate change: A prospect theory approach. Agricultural Economics, 52(5), 863-877. DOI: 10.1111/agec.12659

- Villacis, A. H. (2023). Inconsistent Choices Over Prospect Theory Lottery Games: Evidence from Field Experiments. Journal of Behavioral and Experimental Economics. DOI: 10.1016/j.socec.2023.101989


Note 3:

Feel free to reach out to me at: alexis.villacis@asu.edu if you have any questions or find any bugs.

Thank you!!!


