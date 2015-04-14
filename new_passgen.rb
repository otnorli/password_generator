=begin
General description:
Function to generate a password.

Detailed descripton:
This function takes no input.
As code stands generates an eight letter password, 
first letter is a consonant, second a vowel, third 
a consonant and so on. The letters are appended to 
the password pw.
The function returns pw.

Comments on code:
* Function can easily be changed in future to 
  take length of password as input. Option available.

* Length of wanted password can be changed without 
  without changing code.

* Can insert new vowels in the vowel array and these 
  will be used in password, without changing code 

* Can insert new consonants in the consonant array 
  and these will be used in password without changing 
  code.

* Can add capital letters for example.

* The random function in use returns different values on each 
  run. This ensures we do not get same password every time.

Written by Ole Norli.
=end

def passgen()
   # Parameters we have the option to change in this function here:

   # Length we want on password
   passlen = 8;
   
   # Vowels we use in password
   vowel = ['a', 'e', 'o', 'u', 'y'];

   # Consonants we use in password
   consonant = ['b', 'd', 'f', 'g', 'h', 'j', 'k', 
		'm', 'n', 'p', 'r', 's', 't', 'v'];

   # Parameters we do not change in this function without changing code:

   # Declear password
   pw = "";

   # Number of possible vowels
   length_of_vowel = vowel.size(); 

   # Number of possible consonants
   length_of_consonant = consonant.size(); 

   # Dummie variables here:
   v = 2; # v put to random integer value not equal to 0. Sign will be flipped
   n = 0; # Counter for current length of password

   while n < passlen do # Add letters untill password reach set size
	v = -v; # Flip sign on v

	# If v < 0 we add a consonant
	if v < 0 
	   # Get random int number between 0 and (length of consonant array -1)
	   i = Random.rand(length_of_consonant);
	   
	   # Add consonant to password from consonant array
	   pw = pw + consonant[i];

	# If v > 0 we add a vowel
	else 
	   # Get random int number between 0 and (length of vowel - 1)
	   i = Random.rand(length_of_vowel);

	   # Add vowel to password from vowel array
	   pw = pw + vowel[i];
	end

	# Iterate n++
	n = n+1;
   end
   
   # Return password
   return pw;
end

# Test, generate a password and print it
password = passgen();
puts password;
